CREATE TABLE employees (
    emp_no      INT             NOT NULL,  
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,  
    PRIMARY KEY (emp_no)    
);
SELECT * FROM employees;
insert into employees(emp_no,first_name,last_name,gender) 
values(1,'John','Thomas','M');
insert into employees(emp_no,first_name,last_name,gender) 
values(2,'Joseph','Mathew','M');

CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,  
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),                 
    UNIQUE  KEY (dept_name)             
);

INSERT into departments values('HR','Human Resource');
INSERT into departments values('IT','Technical');
INSERT into departments values('FN','Finance');
INSERT into departments values('MK','Marketing');
INSERT into departments values('OP','Operations');
select * from departments;

SHOW TABLES;