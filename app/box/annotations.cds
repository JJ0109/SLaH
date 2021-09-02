using catalogservice as service from '../../srv/slahservice';

using from '../../srv/common';


//Masterpage - List Report
annotate catalogservice.GeraeteboxSet with @UI : {
    LineItem                   : [
        {
            Label : 'Name',
            Value : Name,
        },
        {
            Label : 'PatientenNr',
            Value : PatientenNr,
        },
        {
            Label : 'Verleihdatum',
            Value : LeihDatum,
        },
        {
            Label : 'Verleihuhrzeit',
            Value : LeihUhrzeit,
        }
        
    ],

    //Masterpage - Überschrift
    HeaderInfo                 : {
        TypeName       : 'Gerätebox',
        TypeNamePlural : 'Geräteboxen',
        Title          : {
            $Type : 'UI.DataField',
            Value : Name,
        },
    },


    //ObjectPage - Details zum Gerätetyp
    FieldGroup #GeraeteDetails : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Value : PatientenNr,
            },
            {
                $Type : 'UI.DataField',
                Value : LeihDatum,
            },
            {
                $Type : 'UI.DataField',
                Value : LeihUhrzeit,
            },
            {
                $Type : 'UI.DataField',
                Value : LetzterPatient,
            }                        
        ]
    },



        //ObjectPage - Facetten: Gerätetyp und Geräte
    Facets                     : [{
        $Type  : 'UI.CollectionFacet',
        Label  : 'Informationen zur Gerätebox',
        ID     : 'Testlauf',
        Facets : [
            {
                $Type  : 'UI.ReferenceFacet',
                // Label  : 'Gerätetyp',                 //Entspricht nochmal einer Überschrift
                ID     : 'GeraeteDetailsFacet',
                Target : '@UI.FieldGroup#GeraeteDetails',
            },
           
        ]
    }],



};
