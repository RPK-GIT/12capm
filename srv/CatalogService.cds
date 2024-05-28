using {ravi.db.master, ravi.db.transaction} from '../db/datamodel';

service CatalogService {

    entity EmployeeSet as projection on master.employee;
    entity AddressSet as projection on master.address;
    entity ProductSet as projection on master.product;
    entity ProductTextsSet as projection on master.prodtext;
    entity BPSet as projection on master.businesspartner;

}