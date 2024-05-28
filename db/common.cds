namespace ravi.common;

using {
    sap,
    Currency,
    temporal,
    managed
} from '@sap/cds/common';

type Gender  : String(1) enum {
    male         = 'M';
    female       = 'F';
    nonBinary    = 'N';
    noDisclosure = 'D';
    selfDescribe = 'S';
};

type AmountT : Decimal(15, 2) @(Semantics.amount.currencycode: 'CURRENCY_CODE',
sap.unit : 'CURRENCY_CODE');

abstract entity Amount {

    CURRENCY_CODE : String(4);
    GROSS_AMOUNT  : AmountT;
    NET_AMOUNT    : AmountT;
    TAX_AMOUNT    : AmountT;

}
