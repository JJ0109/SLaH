namespace slah.db;

using {managed, cuid} from '@sap/cds/common';

entity patient : managed, cuid
{
    PatientenID : String(15) not null;
    VersichertenNr : String(20) not null;
    GesetzVers : Boolean;
    PatientNrKIS : String(20);
    Anrede : String(4) not null;
    Titel : String(20);
    Vorname : String(45) not null;
    Nachname : String(45) not null;
    GebDatum : Date not null;
    Geschlecht : Gender not null; 
    Land : String(3); 
    Postleitzahl : String(10); 
    Ort : String(40); 
    Strasse : String(45); 
    Hausnr : String(9); 
    Zusatz : String(40);
    Postfach: String(8);
    Telefonnummer : String(20);
    Mobilnummer : String(20);
    Fax : String(20);
    Email : String(60) not null;
    Datenschutz1 : Boolean;
    LastChangedDatenschutz : DateTime;
    //Test
    box : Association to geraetebox;
}

entity geraet : managed, cuid
{
    // key GeraeteUUID : UUID; //erstetzt durch aspect "cuid"
    key GeraeteNr : String(10) not null;
    Bezeichnung : String(100);
    Eigenschaften : String(100);
    Hersteller : String(80);
    Betriebsanleitung : String(100);
    Video : String(100);
    //Test
    geraeteid :  Association to many geraeteid on geraeteid.geraet = $self; 
}

entity geraeteid : managed, //cuid
{
    key GeraeteIdUUID : UUID; //ersetzt durch aspect "cuid"
    key GeraeteId : String(10) not null;
    //GeraeteNr : String(18) not null;
    Betriebsstunden : Time;
    Geraetestatus : String(30);
    //Test
    geraet : Association to geraet;
    linkgeraetid: Association to many gverbindung on linkgeraetid.geraetid = $self; 
}

entity geraetebox : managed
{
    key Name : String(18) not null;
    key PatientenNr : String(10) not null;
    LeihDatum : Date;
    LeihUhrzeit : Time;
    LetzterPatient : UUID;
    //Test
    patient: Association to many patient on patient.box = $self;
    status: Association to geraeteboxstatus;
    linkbox: Composition of many gverbindung on linkbox.box = $self;
}

entity geraeteboxstatus : managed
{
    key BoxName : String(18) not null;
    key Datum : Date;
    key Uhrzeit : Time;
    PatientenId : String(15);
    BoxStatus : String(30);
}

//Liste aller Geräte in einer Box 
entity gverbindung{
    key box : Association to geraetebox;
    key geraetid : Association to geraeteid;  
}

//Type Geschlecht
type Gender : String enum {
    w; m; d;
}

//Typ Länder --> über common aspects
//Typ Status
//Type Link einfügen
//Typ nur Stundenzahl anzeigen

