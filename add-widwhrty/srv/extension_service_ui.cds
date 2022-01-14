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
    }]}
});
