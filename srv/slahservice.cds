using { slah.db as slah } from '../db/datamodel';


//@path: '/sap/opu/odata/sap/API_PATIENT'
service catalogservice {

@odata.draft.enabled
    entity PatientenSet        as projection on slah.patient;
@odata.draft.enabled    
    entity GeraetSet           as projection on slah.geraet;
@odata.draft.enabled    
    entity GeraeteIdSet        as projection on slah.geraeteid;
    //entity GeraeteboxSet       as projection on slah.geraetebox;
    //entity GeraeteboxStatusSet as projection on slah.geraeteboxstatus;
}

