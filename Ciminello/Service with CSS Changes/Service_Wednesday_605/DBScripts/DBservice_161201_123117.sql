-- Group [Group]
create table `group_3` (
   `oid`  integer  not null,
   `group_name`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module_3` (
   `oid`  integer  not null,
   `module_id`  varchar(255),
   `module_name`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user_3` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- ServiceRequest [pkg1#ent8]
create table `servicerequest_2` (
   `oid`  integer  not null,
   `description`  longtext,
   `location`  varchar(255),
   `photo`  varchar(255),
   `photoblob`  longblob,
   `time_added`  datetime,
   `status`  varchar(255),
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group_3`  add column  `module_3_oid`  integer;
alter table `group_3`   add index fk_group_3_module_3 (`module_3_oid`), add constraint fk_group_3_module_3 foreign key (`module_3_oid`) references `module_3` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module_3` (
   `group_3_oid`  integer not null,
   `module_3_oid`  integer not null,
  primary key (`group_3_oid`, `module_3_oid`)
);
alter table `group_module_3`   add index fk_group_module_3_group_3 (`group_3_oid`), add constraint fk_group_module_3_group_3 foreign key (`group_3_oid`) references `group_3` (`oid`);
alter table `group_module_3`   add index fk_group_module_3_module_3 (`module_3_oid`), add constraint fk_group_module_3_module_3 foreign key (`module_3_oid`) references `module_3` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user_3`  add column  `group_3_oid`  integer;
alter table `user_3`   add index fk_user_3_group_3 (`group_3_oid`), add constraint fk_user_3_group_3 foreign key (`group_3_oid`) references `group_3` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group_3` (
   `user_3_oid`  integer not null,
   `group_3_oid`  integer not null,
  primary key (`user_3_oid`, `group_3_oid`)
);
alter table `user_group_3`   add index fk_user_group_3_user_3 (`user_3_oid`), add constraint fk_user_group_3_user_3 foreign key (`user_3_oid`) references `user_3` (`oid`);
alter table `user_group_3`   add index fk_user_group_3_group_3 (`group_3_oid`), add constraint fk_user_group_3_group_3 foreign key (`group_3_oid`) references `group_3` (`oid`);


-- User_ServiceRequest [rel1]
alter table `servicerequest_2`  add column  `user_3_oid`  integer;
alter table `servicerequest_2`   add index fk_servicerequest_2_user_3 (`user_3_oid`), add constraint fk_servicerequest_2_user_3 foreign key (`user_3_oid`) references `user_3` (`oid`);


