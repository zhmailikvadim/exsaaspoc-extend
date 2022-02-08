namespace Z_pbsaaspoc1.newfields;
using pbsaaspoc1.db from '_base/db/data-model.cds';
using Z_pbsaaspoc1.db as new from './new.cds';

extend entity db.Sales with {
    Z_city        : String(30);
    Z_phone       : String(20)@assert.format : '^[+]\d+$';
    Z_totalAmount : Decimal(15, 2)@assert.range: [ 0, 5000 ]; 
};

extend entity db.Products with {
    Z_weight : Decimal(15, 2);
    Z_toUOM  : Association to new.Z_UnitOfMesure; 
};
