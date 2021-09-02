using catalogservice as service from '../../srv/slahservice';

using from '../../srv/common';


//Masterpage - List Report
annotate catalogservice.PatientenSet with @(UI : {
    LineItem : [
        {
        Label : 'GUUID',
        Value : ID,
        ![@UI.Hidden] : true
        },
    {
        Label : 'ID',
        Value : PatientenID,
    },
    {
        Label : 'Anrede',
        Value : Anrede_code,
    },
    {
        Label : 'Vorname',
        Value : Vorname,
    },
    {
        Label : 'Nachname',
        Value : Nachname,
    },
    {
        Label : 'Geburtsdatum',
        Value : GebDatum,
    },
    {
        Label : 'Geschlecht',
        Value : Geschlecht_code1,
    },
    {
        Label : 'VersichertenNr',
        Value : VersichertenNr,
    },
    {
        Label : 'GesetzVers',
        Value : GesetzVers,
    },
    {
        Label : 'PatientNrKIS',
        Value : PatientNrKIS,
    },
    {
        Label : 'Titel',
        Value : Titel,
    },
    {
        Label : 'Land',
        Value : Land_code2,
    },
    {
        Label : 'Postleitzahl',
        Value : Postleitzahl,
    },
    {
        Label : 'Ort',
        Value : Ort,
    },    
    {
        Label : 'Strasse',
        Value : Strasse,
    },
        {
        Label : 'Hausnr',
        Value : Hausnr,
    },
        {
        Label : 'Zusatz',
        Value : Zusatz,
    },  
        {
        Label : 'Postfach',
        Value : Postfach,
    },  
        {
        Label : 'Telefonnummer',
        Value : Telefonnummer,
    },
    {
        Label : 'Mobilnummer',
        Value : Mobilnummer,
    },
        {
        Label : 'Fax',
        Value : Fax,
    },
        {
        Label : 'Email',
        Value : Email,
    },
        {
        Label : 'Datenschutz1',
        Value : Datenschutz1,
    },
        {
        Label : 'LastChangedDatenschutz',
        Value : LastChangedDatenschutz,
    }
],


//Masterpage - Überschrift
HeaderInfo          : {
        TypeName       : 'Patient',
        TypeNamePlural : 'Patienten',
        Title          : {
            $Type : 'UI.DataField',
            Value : Nachname
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : Vorname
        },
    },


//ObjectPage - Details zum Patienten
Facets: [
            {
                $Type: 'UI.ReferenceFacet', 
                Label: 'Allgemeine Informationen', 
                Target: '@UI.FieldGroup#Main'
            },      
            {
                $Type: 'UI.ReferenceFacet', 
                Label: 'Adressdaten', 
                Target: '@UI.FieldGroup#Main1'
            },    
            {
                $Type: 'UI.ReferenceFacet', 
                Label: 'Kontaktdaten', 
                Target: '@UI.FieldGroup#Main2'
            },   
        ],
        

FieldGroup#Main: {
            Data: [
                {Value: ID, ![@UI.Hidden] : true },
                {Value: PatientenID },
                {Value: VersichertenNr},
                {Value: PatientNrKIS},
                {Value: Anrede_code},
                {Value: Titel},
                {Value: Vorname } ,  
                {Value: Nachname },
                {Value: GebDatum },
                {Value: Geschlecht_code1},
                {Value: GesetzVers},
               
               // {Value: Datenschutz1},
               // {Value: LastChangedDatenschutz}
            ]
        },

FieldGroup#Main1: {
            Data: [
                {Value: Strasse},
                {Value: Hausnr},
                {Value: Zusatz},
                {Value: Postleitzahl},
                {Value: Ort},
                {Value: Postfach},
                {Value: Land_code2},
            ]
        },        

FieldGroup#Main2: {
            Data: [
                {Value: Telefonnummer},
                {Value: Mobilnummer},
                {Value: Fax},
                {Value: Email}
            ]
        },

});