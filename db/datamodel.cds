namespace slah.db;
using { managed, cuid, sap.common} from '@sap/cds/common';             //sap.common.CodeList,

type Url : String;

//Patientendaten 
//@odata.draft.enabled            //Ist für den Anlege- und Löschbutton zuständig
entity patient : managed
{
    key ID: UUID @(Core.Computed : true);
    PatientenID            : String(15) @title : 'Patienten ID'; //not null; 
    VersichertenNr         : String(20) @title : 'VersichertenNr'; //not null; 
    GesetzVers             : Boolean    @title : 'GesetzVers';
    PatientNrKIS           : String(20) @title : 'PatientNrKIS';
    Anrede                 : Association to one FrauHerr       @title : 'Anrede';
    Titel                  : String(20) @title : 'Titel';
    Vorname                : String(45) @title : 'Vorname'; //not null; 
    Nachname               : String(45) @title : 'Nachname'; //not null; 
    GebDatum               : Date       @title : 'Geburtsdatum'; //not null;     
    Geschlecht             : Association to one typeGeschlecht @title : 'Geschlecht'; //not null;
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
    Email                  : String(60) @title : 'Email'; //not null; 
    Datenschutz1           : Boolean    @title : 'Datenschutz1';
    LastChangedDatenschutz : DateTime   @title : 'LastChangedDatenschutz';
    //Association zu geraetebox
    box                    : Association to geraetebox;
}


//Gerätetypen
//@odata.draft.enabled    //Damit die Buttons funktionieren, musste ich die Bezeichnung "Key" vor der GeraeteNr entfernen
entity geraet : managed
{
    key GeraeteUUID   : UUID        @(Core.Computed : true);
    GeraeteNr         : String(10)  @title : 'Gerätetypnr.'; //not null;
    Bezeichnung       : String(100) @title : 'Bezeichnung'; //not null;
    Eigenschaften     : String(100) @title : 'Eigenschaften';
    Hersteller        : String(80)  @title : 'Hersteller';
    Betriebsanleitung : Url         @title : 'Betriebsanleitung';
    Video             : Url         @title : 'Video';
    //Association zu geraeteid
    geraeteid         :  Association to many geraeteid on geraeteid.geraet = $self; 
}


//Geräte
//@odata.draft.enabled    //Damit die Buttons funktionieren, musste ich die Bezeichnung "Key" vor der GeraeteId entfernen
entity geraeteid : managed
{
    key GeraeteIdUUID : UUID       @(Core.Computed : true); 
    GeraeteId     : String(10) @title : 'Geräte ID'; //not null;
    Betriebsstunden   : Time       @title : 'Betriebsstunden';
    Geraetestatus     : Association to one GStatus @title : 'Gerätestatus';
    //Geraetestatus     : String(30) @title : 'Gerätestatus';
    //Association zu geraet und gverbindung
    geraet            : Association to geraet;
    linkgeraetid      : Association to many gverbindung on linkgeraetid.geraetid = $self; 
}


//Geräteboxen
entity geraetebox : managed
{
    key Name        : String(18) @title : 'Geräteboxname'; //not null;
    key PatientenNr : String(10) @title : 'Patientennr.'; //not null;
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
    key BoxName : String(18) @title : 'Geräteboxname'; //not null;
    key Datum   : Date       @title : 'Datum';
    key Uhrzeit : Time       @title : 'Uhrzeit';
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