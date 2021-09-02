namespace slah.db;
using { managed, cuid, sap.common } from '@sap/cds/common';             //sap.common.CodeList,

type Url : String;

//Patientendaten 
//@odata.draft.enabled            //Ist für den Anlege- und Löschbutton zuständig
entity patient : managed
{
    key ID: UUID @(Core.Computed : true);
@FieldControl.Mandatory //not null; 
    PatientenID            : String(15) @title : 'Patienten ID'; 
@FieldControl.Mandatory  
    VersichertenNr         : String(20) @title : 'VersichertenNr'; 
    GesetzVers             : Boolean    @title : 'GesetzVers';
    PatientNrKIS           : String(20) @title : 'PatientNrKIS';
@FieldControl.Mandatory     
    Anrede                 : Association to one FrauHerr       @title : 'Anrede';
    Titel                  : String(20) @title : 'Titel';
@FieldControl.Mandatory     
    Vorname                : String(45) @title : 'Vorname'; 
@FieldControl.Mandatory     
    Nachname               : String(45) @title : 'Nachname'; 
@FieldControl.Mandatory     
    GebDatum               : Date       @title : 'Geburtsdatum'; 
@FieldControl.Mandatory        
    Geschlecht             : Association to one typeGeschlecht @title : 'Geschlecht'; 
    Land                   : Association to one typeLand       @title : 'Land';
    Postleitzahl           : String(10) @title : 'Postleitzahl'; 
    Ort                    : String(40) @title : 'Ort'; 
    Strasse                : String(45) @title : 'Strasse'; 
    Hausnr                 : String(9)  @title : 'Hausnr'; 
    Zusatz                 : String(40) @title : 'Zusatz';
    Postfach               : String(8)  @title : 'Postfach';
    Telefonnummer          : String(20) @title : 'Telefonnummer';
    Mobilnummer            : String(20) @title : 'Mobilnummer';
    Fax                    : String(20) @title : 'Fax';
@FieldControl.Mandatory 
    Email                  : String(60) @title : 'Email'; 
    Datenschutz1           : Boolean    @title : 'Datenschutz1';
    LastChangedDatenschutz : DateTime   @title : 'LastChangedDatenschutz';
    //Association zu geraetebox
    box                    : Association to geraetebox;
}


//Gerätetypen
//@odata.draft.enabled    //Damit die Buttons funktionieren, musste ich die Bezeichnung "Key" vor der GeraeteNr entfernen
entity geraet : managed
{
    key GeraeteUUID   : UUID        @title : 'Geräte ID' @(Core.Computed : true);
@FieldControl.Mandatory     
    GeraeteNr         : String(10)  @title : 'Gerätetypnr'; 
@FieldControl.Mandatory     
    Bezeichnung       : String(100) @title : 'Bezeichnung'; 
    Eigenschaften     : String(100) @title : 'Eigenschaften';
    Hersteller        : String(80)  @title : 'Hersteller';
    Betriebsanleitung : Url         @title : 'Betriebsanleitung';
    //Betriebsanleitung : Url         @title : 'Betriebsanleitung'@Core.MediaType: imageType @Core.ContentDisposition.Filename: fileName;
    //fileName : String;
    Video             : Url         @title : 'Video';  //@Core.IsURL @Core.MediaType: imageType;
    //imageType : String @Core.IsMediaType;
    //Association zu geraeteid
    geraeteid         :  Association to many geraeteid on geraeteid.geraet = $self; 
    //geraeteid         :  Composition of ItemGeraet on $self = geraeteid.geraet; 

}


//Geräte
//@odata.draft.enabled    //Damit die Buttons funktionieren, musste ich die Bezeichnung "Key" vor der GeraeteId entfernen
//@cds.persistence.exists
entity geraeteid : managed
{
    key GeraeteIdUUID : UUID       @title : 'Geräteid ID' @(Core.Computed : true); 
@FieldControl.Mandatory     
    GeraeteId     : String(10) @title : 'Gerätenr'; 
    Betriebsstunden   : Time       @title : 'Betriebsstunden';
    Geraetestatus     : Association to one GStatus @title : 'Gerätestatus';
    //Geraetestatus     : String(30) @title : 'Gerätestatus';
    //Association zu geraet und gverbindung
    geraet            : Association to geraet;
    linkgeraetid      : Association to many gverbindung on linkgeraetid.geraetid = $self; 

}

/*view GeraeteView as select from geraet {
    GeraeteUUID,
    GeraeteNr,
    geraeteid.Geraetestatus
};


entity ItemGeraet as projection on geraeteid;*/



//Geräteboxen
entity geraetebox : managed
{
@FieldControl.Mandatory     
    key Name        : String(18) @title : 'Geräteboxname';
@FieldControl.Mandatory     
    PatientenNr : String(10) @title : 'Patientennr.'; 
    LeihDatum       : Date       @title : 'Leihdatum';
    LeihUhrzeit     : Time       @title : 'Leihuhrzeit';
    LetzterPatient  : UUID       @title : 'Letzer Patient';
    //Association zu patient, geraeteboxstatus und gverbindung
    patient         : Association to many patient on patient.box = $self;
    status          : Association to geraeteboxstatus;
    linkbox         : Composition of many gverbindung on linkbox.box = $self;
}


//Geräteboxstatus
entity geraeteboxstatus : managed
{
@FieldControl.Mandatory     
    key BoxName : String(18) @title : 'Geräteboxname'; 
    Datum   : Date       @title : 'Datum';
    Uhrzeit : Time       @title : 'Uhrzeit';
    PatientenId : String(15) @title : 'Patientennr.';
    BoxStatus   : String(30) @title : 'Boxstatus';
}


//Liste aller Geräte in einer Box 
entity gverbindung 
{
    key box      : Association to geraetebox;
    key geraetid : Association to geraeteid;  
}




//Entitäten
//Geschlecht
entity typeGeschlecht : GeschlechttypeGeschlecht {}
entity GeschlechttypeGeschlecht : common.CodeList {
    key code1 : String (10);
}

//Anrede 
entity FrauHerr : AnredeFrauHerr {}
entity AnredeFrauHerr : common.CodeList {
    key code : String (10);
}

//Land
entity typeLand : LandtypeLand {}
entity LandtypeLand : common.CodeList {
    key code2 : String(3);
}

//Geraetestatus
entity GStatus : GeraetestatustypeGStatus {}
entity GeraetestatustypeGStatus : common.CodeList {
    key code3 : String (50);
}