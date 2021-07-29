CREATE TABLE OFFICES(officeCode VARCHAR(10),city VARCHAR(50),phone VARCHAR(50),addressLine1 VARCHAR(50),addressLine2 VARCHAR(50),state VARCHAR(50),
country VARCHAR(50),postalCode VARCHAR(15),territory VARCHAR(10));

ALTER TABLE offices ADD PRIMARY KEY(officeCode);

create table employees(employeeNumber INT(10) PRIMARY KEY,lastName VARCHAR(50),firstName VARCHAR(50),extension VARCHAR(50),email VARCHAR(100),
officeCode VARCHAR(10),reportsTo INT(10),jobTitle VARCHAR(50),
FOREIGN KEY (officeCode) REFERENCES offices (officeCode) ON DELETE CASCADE);

CREATE TABLE customers(customerNumber INT PRIMARY KEY,customerName VARCHAR(50),contactLastName VARCHAR(50),contactFirstName VARCHAR(50),phone VARCHAR(50),
addressLine1 VARCHAR(50),addressLine2 VARCHAR(50),city VARCHAR(50),state VARCHAR(50),postalCode VARCHAR(15),country VARCHAR(50),
salesRepEmployeeNumber INT,creditLimit INT);



CREATE TABLE orders(orderNumber INT PRIMARY KEY,orderDate DATE,requiredDate DATE,shippedDate DATE,status VARCHAR(15),comments TEXT,customerNumber INT,
FOREIGN KEY (customerNumber) references customers(customerNumber) ON DELETE CASCADE);

CREATE TABLE products(productCode VARCHAR(15) PRIMARY KEY,productName VARCHAR(70),productLine VARCHAR(50),productScale VARCHAR(10),
productVendor VARCHAR(50),productDescription TEXT,quantityInStock SMALLINT(6),buyPrice DECIMAL(8,2),MSRP DECIMAL(8,2));


select * from offices;
INSERT INTO offices values ('ofc1','trivandrum','123456789','MGRoad','Street2','Kerala','India','695001','t1');
INSERT INTO offices values ('ofc2','Banglore','987654321','IndiraNagar','NorthSide','Karnataka','India','675513','t2');
INSERT INTO offices values ('ofc3','Chennai','234567819','patanam','puramRoad','TamilNadu','India','695021','t3');

select * from employees;
INSERT INTO employees values(101,'Shiva','Mithun','N','mithunshiva@gmail.com','ofc1',11,'Manager');
INSERT INTO employees values(102,'Balasubramanian','Sandhya','B','Sandhyabalasubramanian@gmail.com','ofc1',11,'Sales1');
INSERT INTO employees values(103,'Nair','Gowri','R','gowrinair@gmail.com','ofc2',12,'Manager');
INSERT INTO employees values(104,'Mary','Milu','Paul','milumary@gmail.com','ofc2',12,'AsstManager');
INSERT INTO employees values(105,'Khader','Nadeema','','nadeemakhader@gmail.com','ofc3',13,'Manager');
INSERT INTO employees values(106,'virginia','Sarah','S','Sarahvirginia@gmail.com','ofc3',13,'LeadExecutive');

select * from offices inner join employees on offices.officecode=employees.officecode;

select * from customers;
INSERT INTO customers values(1,'Maya','Manohar','Maya','34567','midhunam','vellayambalam','trivandrum','kerala','695001','India',101,2500);
INSERT INTO customers values(2,'Manu','Mohan','Manu','88812','manthiram','eastfort','trivandrum','kerala','695001','India',102,5000);
INSERT INTO customers values(3,'John','Thomas','Manju','33321','Hycinth','Indira','Banglore','Karnataka','675513','India',103,3000);
INSERT INTO customers values(4,'Jacob','Emmanuel','Jacob','9991','Tamara','CommercialStreet','Banglore','Karnataka','695201','India',104,5000);
INSERT INTO customers values(5,'Indra','Menon','Indra','66621','Powdikonam','Nagar','Chennai','TamilNadu','695081','India',105,2500);

SELECT * FROM PAYMENTS;

CREATE TABLE payments(customerNumber INT,checkNumber VARCHAR(50),paymentNumber DATE,amount DECIMAL(8,2),
FOREIGN KEY (customerNumber) references customers(customerNumber) ON DELETE CASCADE,
PRIMARY KEY(customerNumber,checkNumber));

INSERT INTO payments values (1,'CN101','2018-07-03',2000);
INSERT INTO payments values (2,'CN102','2019-08-02',3500);
INSERT INTO payments values (3,'CN103','2018-01-10',2500);
INSERT INTO payments values (4,'CN104','2020-05-09',4500);
INSERT INTO payments values (5,'CN105','2018-06-08',1500);

select * from orders;
INSERT INTO orders VALUES (1000,'2018-07-03','2018-08-27','2018-07-15','S101','Order Dispatched',1);
INSERT INTO orders VALUES (1001,'2019-08-02','2019-08-20','2018-08-05','S102','Order Delayed',2);
INSERT INTO orders VALUES (1002,'2018-01-10','2018-02-10','2018-01-15','S103','Order Dispatched',3);
INSERT INTO orders VALUES (1003,'2020-05-09','2020-06-09','2020-05-15','S104','Order Delivered',4);
INSERT INTO orders VALUES (1004,'2018-06-08','2018-07-15','2018-06-15','S105','Order Dispatched',5);

select * from products;
INSERT INTO products VALUES ('PLipStk','LipStick','Lipline LipGloss','Scale10','Maybelline','Matte lipstick','500','699','720');
INSERT INTO products VALUES ('PEyeLinr','EyeLiner','EyeShadow kajal ','Scale20','Sugar','shimmer Eyeshadow','300','250','200');
INSERT INTO products VALUES ('PTop','CropTop','TShirt Jeans','Scale30','Levis','Length before waist','25','520','500');

select * from orderdetails;

CREATE TABLE orderDetails(orderNumber INT,productCode VARCHAR(15),quantityOrdered INT,priceEach DECIMAL(7,2),orderLineNumber TINYINT(3),
PRIMARY KEY(orderNumber,productCode),
FOREIGN KEY(orderNumber) REFERENCES orders(orderNumber) ON DELETE CASCADE,
FOREIGN KEY(productCode) REFERENCES products(productCode) ON DELETE CASCADE);

INSERT INTO orderdetails VALUES (1000,'PLipStk',2,699,3);
INSERT INTO orderdetails VALUES (1001,'PEyeLinr',1,250,1);
INSERT INTO orderdetails VALUES (1002,'PLipStk',5,699,3);
INSERT INTO orderdetails VALUES (1003,'PTop',5,520,4);
INSERT INTO orderdetails VALUES (1004,'PEyeLinr',3,250,1);

ALTER TABLE productdetails RENAME TO productlines;
select * from productLines;

CREATE TABLE productlines(productLine VARCHAR(50) PRIMARY KEY,textDescription VARCHAR(4000),htmlDescription TEXT,image BLOB);

INSERT INTO productlines VALUES('Lipstick','new launch','Maybelline new lipstick range','');
INSERT INTO productlines VALUES('EyeLiner','2015 launch','Colosal','');
INSERT INTO productlines VALUES('CropTop','style statement','Levis new product','');

drop table payments;
drop table orderdetails;
drop table productlines;

select * from customers;
select * from employees;
select * from offices;
select * from orderdetails;
select * from orders;
select * from payments;
select * from productlines;
select * from products;




 