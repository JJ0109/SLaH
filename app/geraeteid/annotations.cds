using catalogservice as service from '../../srv/slahservice';


using from '../../srv/common';


//Masterpage - List Report
annotate catalogservice.GeraeteIdSet with @UI : {
    LineItem                   : [
        {
            Label         : 'GUUID',
            Value         : GeraeteIdUUID,
            ![@UI.Hidden] : true
        },
        {
            Label : 'GeräteNr',
            Value : GeraeteId,
        },
        {
            Label : 'Betriebsstunden',
            Value : Betriebsstunden,
        },
        {
            Label : 'Status',
            Value : Geraetestatus_code3,
        },
        
    ],

    //Masterpage - Überschrift
    HeaderInfo                 : {
        TypeName       : 'Gerät',
        TypeNamePlural : 'Geräte',
        Title          : {
            $Type : 'UI.DataField',
            Value : GeraeteId,
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : Geraetestatus_code3,
        },
    },


    //ObjectPage - Details zum Gerätetyp
    FieldGroup #GeraeteDetails : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : GeraeteId,
            },
            {
                $Type : 'UI.DataField',
                Value : Betriebsstunden,
            },
            {
                $Type : 'UI.DataField',
                Value : Geraetestatus_code3,
            }
        ]
    },



        //ObjectPage - Facetten: Gerätetyp und Geräte
    Facets                     : [{
        $Type  : 'UI.CollectionFacet',
        Label  : 'Informationen zum Gerät',
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


