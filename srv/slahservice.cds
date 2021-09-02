using { slah.db as slah } from '../db/datamodel';


//@path: '/sap/opu/odata/sap/API_PATIENT'
service catalogservice {

    entity PatientenSet        as projection on slah.patient;
        annotate  PatientenSet with @odata.draft.enabled;
     
 
   entity GeraetSet            as projection on slah.geraet;
    annotate  GeraetSet with @odata.draft.enabled;

  
    entity GeraeteIdSet        as projection on slah.geraeteid;
        annotate  GeraeteIdSet with @odata.draft.enabled;
  
    
    entity GeraeteboxSet       as projection on slah.geraetebox;
        annotate  GeraeteboxSet with @odata.draft.enabled;

 //@odata.draft.enabled     
    //entity GeraeteboxStatusSet as projection on slah.geraeteboxstatus;
}

