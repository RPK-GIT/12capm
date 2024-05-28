namespace ravi.db;

using {
    cuid,
    managed,
    temporal
} from '@sap/cds/common';

using { ravi.common} from './common';


context master {
    entity employee : cuid{
        nameFirst     : String(60);
        nameLast      : String(60);
        sex           : common.Gender;
        language      : String(2);
        email         : String(60);
        loginName     : String(60);
        salary        : common.AmountT;
        accountNumber : String(16);
        bankId        : String(8);
        bankName      : String(60);

    }

    entity businesspartner {
        key NODE_KEY      : String(32);
            BP_ROLE       : String(2);
            EMAIL_ADDRESS : String(64);
            PHONE_NUMBER  : String(14);
            FAX_NUMBER    : String(14);
            WEB_ADDRESS   : String(64);
            ADDRESS_GUID  : Association to one address;
            BP_ID         : String(16);
            COMPANY_NAME  : String(80);
    }

    entity address {
        key NODE_KEY       : String(32);
            CITY           : String(64);
            POSTAL_CODE    : String(14);
            STREET         : String(64);
            BUILDING       : String(64);
            COUNTRY        : String(2);
            VAL_START_DATE : Date;
            VAL_END_DATE   : Date;
            LATITUDE       : String(64);
            LONGITUDE      : String(64);
    }

    entity prodtext {
        key NODE_KEY   : UUID;
            PARENT_KEY : UUID;
        key LANGUAGE   : String(2);
            TEXT       : String(256);
    }

    entity product {
        key NODE_KEY        : UUID;
            PRODUCT_ID      : String(28);
            TYPE_CODE       : String(2);
            CATEGORY        : String(32);
            DESC_GUID       : Association to master.prodtext;
            SUPPLIER_GUID   : Association to master.businesspartner;
            TAX_TARRIF_CODE : Integer
    }


}

context transaction {
    entity purchaseorder {
        key NODE_KEY         : UUID;
            PO_ID            : String(24);
            BP_GUID_NODE_KEY : Association to master.businesspartner;
            CURRENCY_CODE    : String(4);
            OVERALL_STATUS   : String(2);
    }

    entity poitem {
        key NODE_KEY      : UUID;
            PARENT_KEY    : Association to transaction.purchaseorder;
            PO_ITEMS_POS  : Integer;
            PRODUCT_GUID  : Association to master.product;
            CURRENCY_CODE : String(4);
    }
}
