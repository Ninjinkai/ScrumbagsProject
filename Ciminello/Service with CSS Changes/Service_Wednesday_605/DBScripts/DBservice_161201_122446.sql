-- User_ServiceRequest [rel1]
alter table `servicerequest_2`  add column  `user_3_oid`  integer;
alter table `servicerequest_2`   add index fk_servicerequest_2_user_3 (`user_3_oid`), add constraint fk_servicerequest_2_user_3 foreign key (`user_3_oid`) references `user_3` (`oid`);


