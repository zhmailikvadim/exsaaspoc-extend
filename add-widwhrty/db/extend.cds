namespace Z_sapsaaspoc.newfields;
using sapsaaspoc.db from '_base/db/data-model.cds';
using Z_sapsaaspoc.db as new from './new.cds';

extend entity db.Sales with {
    Z_city        : String(30);
    Z_totalAmount : Decimal(15, 2);
};

extend entity db.Products with {
    Z_weight : Decimal(15, 2);
    Z_toUOM  : Association to new.Z_UnitOfMesure; 
};
