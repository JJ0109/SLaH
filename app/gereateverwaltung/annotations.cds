using catalogservice as service from '../../srv/slahservice';

using from '../../srv/common';


//Masterpage - List Report
annotate catalogservice.GeraetSet with @UI : {
    LineItem                   : [
        {
            Label         : 'GUUID',
            Value         : GeraeteUUID,
            ![@UI.Hidden] : true
        },
        {
            Label : 'GeräteNr',
            Value : GeraeteNr,
        },
        {
            Label : 'Bezeichnung',
            Value : Bezeichnung,
        },
        {
            Label : 'Eigenschaften',
            Value : Eigenschaften,
        },
        {
            Label : 'Hersteller',
            Value : Hersteller,
        },
        {
            Label : 'Betriebsanleitung',
            Value : Betriebsanleitung,
        },
        {
            Label : 'Video',
            Value : Video,
        }
    ],

    //Masterpage - Überschrift
 HeaderInfo: {
            TypeName: 'Gerät',
            TypeNamePlural: 'Geräte',
            Title: { Value: GeraeteUUID },
            Description: { Value: Bezeichnung }
        },


    //ObjectPage - Details zum Gerätetyp
    FieldGroup #GeraeteDetails : {
        $Type : 'UI.FieldGroupType',
        Data  : [
                        {
                $Type : 'UI.DataField',
                Value : GeraeteUUID,
            },
            {
                $Type : 'UI.DataField',
                Value : GeraeteNr,
            },
            {
                $Type : 'UI.DataField',
                Value : Bezeichnung,
            },
            {
                $Type : 'UI.DataField',
                Value : Eigenschaften,
            },
            {
                $Type : 'UI.DataField',
                Value : Hersteller,
            },
            {
                $Type : 'UI.DataField',
                Value : Betriebsanleitung,
            },
            {
                $Type : 'UI.DataField',
                Value : Video,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
        ]
    },


    //ObjectPage - Facetten: Gerätetyp und Geräte
    Facets                     : [{
        $Type  : 'UI.CollectionFacet',
        Label  : 'Informationen zum Gerätetyp',
        ID     : 'Testlauf',
        Facets : [
            {
                $Type  : 'UI.ReferenceFacet',
                // Label  : 'Gerätetyp',                 //Entspricht nochmal einer Überschrift
                ID     : 'GeraeteDetailsFacet',
                Target : '@UI.FieldGroup#GeraeteDetails',
            },

              //insert your reference facet enhancement here
            {

                $Type  : 'UI.ReferenceFacet',
                Label  : 'Geräte',
                ID     : 'GeraeteIdFacet',
                Target: '@UI.LineItem#Test',
                //Target : 'geraeteid/@UI.LineItem#Geraet',

            /*![@UI.Hidden] : isDraft*/

            }
        ]
    }],

LineItem#Test : [
        {
            Label         : 'Geräteid ID',
            Value         : geraeteid.GeraeteIdUUID,
            ![@UI.Hidden] : true
        },
        {
            Label : 'Geräteidnr',
            Value : geraeteid.GeraeteId,
        },
        {
            Label : 'Stunden',
            Value : geraeteid.Betriebsstunden,
        },
        {
            Label : 'Status',
            Value : geraeteid.Geraetestatus_code3,
        },
                    ],

};


