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

