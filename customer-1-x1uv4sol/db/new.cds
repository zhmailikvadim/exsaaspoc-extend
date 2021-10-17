namespace Z_exsaaspoc.db;

entity Z_UnitOfMesure {
    key msehi        : String(3) @(title : '{i18n>mesureCode}');
        dimid        : String(6) @(title : '{i18n>type}');
        isocode      : String(3) @(title : '{i18n>ISOcode}');
        name         : String(30) @(title : '{i18n>name}');
};
