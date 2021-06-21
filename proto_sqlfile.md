

use spring;

CREATE TABLE waw_user (
email varchar(50) NOT null,
id varchar(50) not null, 
pwd varchar(50) NOT null,
name varchar(50) not null,
phoneNumber varchar(50) not null,
regDATE timestamp default NOW(),
primary key (email)
) ENGINE= InnoDB, default charset=utf8mb4;

select * from waw_user;