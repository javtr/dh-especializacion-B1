
-- DROP table temporal_test2

CREATE TABLE temporal_test(firstName VARCHAR(50));
CREATE TABLE temporal_test2(firstName VARCHAR(50), createdDate datetime);



DELIMITER $$
CREATE TRIGGER trigger_test1
AFTER INSERT 
ON temporal_test FOR each row 
BEGIN 

insert into temporal_test2(firstName, createdDate) 
values (New.firstName,NOW());

END; $$

insert into temporal_test (firstName) values ('Test 1');

select * from temporal_test2;
