using { slah.db as slah } from '../db/datamodel';


@requires: 'authenticated-user'
service catalogservice {

    entity PatientenSet        as projection on slah.patient;
        annotate  PatientenSet with @odata.draft.enabled;
}

