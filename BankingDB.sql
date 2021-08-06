show tables;

create table customer_details
(
cus_id int auto_increment primary key,
cus_name varchar(50) not null,
cus_age int not null
);

insert into customer_details(cus_name,cus_age)
values('ram',25),
('anu',30);

select * from customer_details;

create table account_details(accnt_no int auto_increment primary key,
id int not null,
name varchar(50) not null,
FOREIGN KEY (id) REFERENCES customer_details (cus_id) ON DELETE CASCADE);

alter table account_details auto_increment=100;
insert into account_details (id,name) values(1,'ram'),(2,'anu');

select * from account_details;



