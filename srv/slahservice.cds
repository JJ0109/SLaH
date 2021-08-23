using { slah.db as slah } from '../db/datamodel';

//@path: '/sap/opu/odata/sap/API_PATIENT'
service catalogservice {

    entity PatientenSet        as projection on slah.patient;
    entity GeraetSet           as projection on slah.geraet;
    //entity GeraeteIdSet        as projection on slah.geraeteid;
    //entity GeraeteboxSet       as projection on slah.geraetebox;
    //entity GeraeteboxStatusSet as projection on slah.geraeteboxstatus;

}
