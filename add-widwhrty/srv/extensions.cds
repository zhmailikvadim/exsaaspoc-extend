using CatalogService from '_base/srv/catalog-service';
using Z_sapsaaspoc.db as db from '../db/new';
using Z_sapsaaspoc.newfields as newfields from '../db/extend';

extend service CatalogService with {

    @readonly
    entity Z_UnitOfMesure @(restrict : [{to : 'Viewer'}]) as select * from db.Z_UnitOfMesure;

};

annotate CatalogService.Sales with {
    Z_city        @title : '{i18n>city}';
    Z_totalAmount @title : '{i18n>totalAmount}' @UI.DataFieldDefault;
};

// annotate CatalogService.Sales with @(UI :{
//   LineItem: [ {
//                 $Type:'UI.DataField',
//                 Value : Z_city,
//             }] 
// });

annotate CatalogService.Products with {
    Z_weight @title : '{i18n>weight}';
    //Z_toUOM  @title : '{i18n>toUOM}';

    toProductGroup @Common.ValueList: {
        CollectionPath : 'ProductGroups',
        Label : 'Product Groups',
        Parameters   : [
            { $Type : 'Common.ValueListParameterInOut', LocalDataProperty : 'toProductGroup_ID', ValueListProperty : 'ID'},
            { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'name'}                 
            ],
        SearchSupported : true
 };
 
     Z_toUOM @Common.ValueList: {
        CollectionPath : 'Z_UnitOfMesure',
        Label : 'Product Groups',
        Parameters   : [
            { $Type : 'Common.ValueListParameterInOut', LocalDataProperty : 'Z_toUOM_msehi', ValueListProperty : 'msehi'},
            { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'name'}                 
            ],
        SearchSupported : true
 };
};

 


// annotate CatalogService.Sales with @(UI : {
//     LineItem                : [
//         {
//             $Type             : 'UI.DataField',
//             Value             : Z_city,
//             ![@UI.Importance] : #High
//         },
//         {
//             $Type             : 'UI.DataField',
//             Value             : Z_totalAmount,
//             ![@UI.Importance] : #High
//         }
//     ],
//     FieldGroup #Description : {Data : [{
//         $Type : 'UI.DataField',
//         Value : Z_city
//     }]},
//     FieldGroup #Details     : {Data : [{
//         $Type : 'UI.DataField',
//         Value : Z_totalAmount
//     }]}

// });

// 

// annotate CatalogService.Products with @(UI : {
//     LineItem             : [{
//         $Type             : 'UI.DataField',
//         Value             : Z_weight,
//         ![@UI.Importance] : #High
//     }],
//     FieldGroup #Details3 : {Data : [{
//         $Type             : 'UI.DataField',
//         Value             : Z_weight,
//         ![@UI.Importance] : #High
//     }]}
// });
