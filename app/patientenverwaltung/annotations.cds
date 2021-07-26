using catalogservice as service from '../../srv/slahservice';

annotate catalogservice.PatientenSet with @UI : {
    LineItem:[
            {
                Label:'ID',
                Value:PatientenID,
            },
            {
                Label:'Anrede',
                Value:Anrede,
            },
            {
                Label:'Vorname',
                Value:Vorname,
            },
            {
                Label:'Nachname',
                Value:Nachname,
            },
            {
                Label:'Geburtsdatum',
                Value:GebDatum,
            },
            {
                Label:'Geschlecht',
                Value:Geschlecht,
            }
        ]
};