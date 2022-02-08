using {pbsaaspoc1.db as db} from '../db/data-model';

using {
    CV_SALES,
    CV_SESSION_INFO
} from '../db/data-model';


service CatalogService @(path : '/catalog')@(requires : 'authenticated-user') {

    @odata.draft.enabled
    @Capabilities : { Deletable:true, Insertable:true}
    entity Sales                                              @(restrict : [
        {
            grant : ['READ'],
            to    : 'Viewer'
        },
        {
            grant : ['WRITE'],
            to    : 'Admin'
        }
    ])                                                 as select * from db.Sales actions {
                                                              @(restrict : [{to : 'Admin'}])
                                                              action boost();
                                                          };
    
    @Capabilities : { Deletable:true, Insertable:true}
    entity Products @(restrict : [
        {
            grant : ['READ'],
            to    : 'Viewer'
        },
        {
            grant : [
                'WRITE',
                'DELETE'
            ],
            to    : 'Admin'
        }
    ])                                                 as select * from db.Products;

    entity ProductGroups @(restrict : [
        {
            grant : ['READ'],
            to    : 'Viewer'
        },
        {
            grant : [
                'WRITE',
                'DELETE'
            ],
            to    : 'Admin'
        }
    ])                                                 as select * from db.ProductGroups;

    @readonly
    entity VSales @(restrict : [{to : 'Viewer'}])      as select * from CV_SALES;

    @readonly
    entity SessionInfo @(restrict : [{to : 'Viewer'}]) as select * from CV_SESSION_INFO;

    function topSales @(restrict : [{to : 'Viewer'}])(amount : Integer) returns many Sales;


    type userScopes {
        identified      : Boolean;
        authenticated   : Boolean;
        Viewer          : Boolean;
        Admin           : Boolean;
        ExtendCDS       : Boolean;
        ExtendCDSdelete : Boolean;
    };

    type user {
        user   : String;
        locale : String;
        tenant : String;
        scopes : userScopes;
    };

    function userInfo() returns user;
};

service TechnicalUserService @(requires : 'system-user') {
    entity Sales         as projection on db.Sales;
    entity Products      as projection on db.Products;
    entity ProductGroups as projection on db.ProductGroups;
}
