-- Group [Group]
create table "APP"."GROUP_3" (
   "OID"  integer  not null,
   "GROUP_NAME"  varchar(255),
  primary key ("OID")
);


-- Module [Module]
create table "APP"."MODULE_3" (
   "OID"  integer  not null,
   "MODULE_ID"  varchar(255),
   "MODULE_NAME"  varchar(255),
  primary key ("OID")
);


-- User [User]
create table "APP"."USER_3" (
   "OID"  integer  not null,
   "USERNAME"  varchar(255),
   "PASSWORD"  varchar(255),
   "EMAIL"  varchar(255),
  primary key ("OID")
);


-- ServiceRequest [pkg1#ent8]
create table "APP"."SERVICEREQUEST_2" (
   "OID"  integer  not null,
   "DESCRIPTION"  clob(10000),
   "LOCATION"  varchar(255),
   "PHOTO"  varchar(255),
   "TIME_ADDED"  timestamp,
  primary key ("OID")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "APP"."GROUP_3"  add column  "MODULE_3_OID"  integer;
alter table "APP"."GROUP_3"   add constraint FK_GROUP_3_MODULE_3 foreign key ("MODULE_3_OID") references "APP"."MODULE_3" ("OID");


-- Group_Module [Group2Module_Module2Group]
create table "APP"."GROUP_MODULE_3" (
   "GROUP_3_OID"  integer not null,
   "MODULE_3_OID"  integer not null,
  primary key ("GROUP_3_OID", "MODULE_3_OID")
);
alter table "APP"."GROUP_MODULE_3"   add constraint FK_GROUP_MODULE_3_GROUP_3 foreign key ("GROUP_3_OID") references "APP"."GROUP_3" ("OID");
alter table "APP"."GROUP_MODULE_3"   add constraint FK_GROUP_MODULE_3_MODULE_3 foreign key ("MODULE_3_OID") references "APP"."MODULE_3" ("OID");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "APP"."USER_3"  add column  "GROUP_3_OID"  integer;
alter table "APP"."USER_3"   add constraint FK_USER_3_GROUP_3 foreign key ("GROUP_3_OID") references "APP"."GROUP_3" ("OID");


-- User_Group [User2Group_Group2User]
create table "APP"."USER_GROUP_3" (
   "USER_3_OID"  integer not null,
   "GROUP_3_OID"  integer not null,
  primary key ("USER_3_OID", "GROUP_3_OID")
);
alter table "APP"."USER_GROUP_3"   add constraint FK_USER_GROUP_3_USER_3 foreign key ("USER_3_OID") references "APP"."USER_3" ("OID");
alter table "APP"."USER_GROUP_3"   add constraint FK_USER_GROUP_3_GROUP_3 foreign key ("GROUP_3_OID") references "APP"."GROUP_3" ("OID");


