namespace slah.db; //SLaH_0_1.srv;

using catalogservice as service from './slahservice';
using {cuid} from '@sap/cds/common';


/*annotate cuid with {

    ID @(

        title : 'Hallo',

        UI.HiddenFilter,

        Core.Computed );

        }

*/


//Anrede

annotate service.Patientenverwaltung with {

    Anrede @Common : {

        Text           : Anrede.name,
        TexArrangement : #TextOnly,
        ValueListWithFixedValues

    };

};


annotate service.FrauHerr with {

    code @UI.Hidden  @Common : {

    Text : name

    }

};


//Geschlecht

annotate service.Patientenverwaltung with {

    Geschlecht @Common : {

        Text           : Geschlecht.name,
        TexArrangement : #TextOnly,
        ValueListWithFixedValues

    };

};


annotate service.typeGeschlecht with {

    code1 @UI.Hidden  @Common : {

    Text : name

    }

};


//Land

annotate service.Patientenverwaltung with {

    Land @Common : {

        Text           : Land.name,
        TexArrangement : #TextOnly,
        ValueListWithFixedValues

    };

};


annotate service.typeGeschlecht with {

    code2 @UI.Hidden  @Common : {

    Text : name

    }

};


//Geraetestatus

annotate service.Geraeteverwaltung with {

    Geraetestatus @Common : {

        Text           : Geraetestatus.name,
        TexArrangement : #TextOnly,
        ValueListWithFixedValues

    };

};


annotate service.GStatus with {

    code3 @UI.Hidden  @Common : {

    Text : name

    }

};
