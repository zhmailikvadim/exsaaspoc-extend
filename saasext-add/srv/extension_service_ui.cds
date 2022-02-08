using from '_base/app/index';
using CatalogService from './extensions';

annotate CatalogService.Sales with @(UI : {
    LineItem                : [
        ...,
        {
            Value : Z_city,
            Label : 'City'
        },
        {
            Value : Z_phone,
            Label : 'Phone'
        },
        {
            Value : Z_totalAmount,
            Label : 'Total Amount'
        }        
    ],

    FieldGroup #Details     : {Data : [
        ...,
        {
            Value : Z_city,
            Label : 'City'
        }, // extension field
        {
            Value : Z_phone,
            Label : 'Phone'
        }, // extension field
        {
            Value : Z_totalAmount,
            Label : 'Total Amount'
        }   // extension field 

    ]},
    
    FieldGroup #Description : {Data : [
        ...,
        {
            Value : Z_city,
            Label : 'City'
        }, // extension field
        {
            Value : Z_phone,
            Label : 'Phone'
        }, // extension field
        {
            Value : Z_totalAmount,
            Label : 'Total Amount'
        }   // extension field         
    ]}
});

annotate CatalogService.Products with @(UI : {
    LineItem                : [..., {
        Value : Z_weight,
        Label : 'Weight'
    }],

    FieldGroup #Details3    : {Data : [..., {
        Value : Z_weight,
        Label : 'Weight'
    } ]}
});
