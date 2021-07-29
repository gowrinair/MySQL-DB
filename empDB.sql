CREATE TABLE employees (
    emp_no      INT             NOT NULL,  -- UNSIGNED AUTO_INCREMENT??
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,  -- Enumeration of either 'M' or 'F'  
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)    -- Index built automatically on primary-key column
                                           -- INDEX (first_name)
                                           -- INDEX (last_name)
);


CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,  -- in the form of 'dxxx'
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),                 -- Index built automatically
    UNIQUE  KEY (dept_name)                -- Build INDEX on this unique-value column
);


CREATE TABLE dept_emp (
    emp_no      INT         NOT NULL,
    dept_no     CHAR(4)     NOT NULL,
    from_date   DATE        NOT NULL,
    to_date     DATE        NOT NULL,
    KEY         (emp_no),   -- Build INDEX on this non-unique-value column
    KEY         (dept_no),  -- Build INDEX on this non-unique-value column
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
           -- Cascade DELETE from parent table 'employee' to this child table
           -- If an emp_no is deleted from parent 'employee', all records
           --  involving this emp_no in this child table are also deleted
           -- ON UPDATE CASCADE??
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
           -- ON UPDATE CASCADE??
    PRIMARY KEY (emp_no, dept_no)
           -- Might not be unique?? Need to include from_date
);

CREATE TABLE dept_manager (
   dept_no      CHAR(4)  NOT NULL,
   emp_no       INT      NOT NULL,
   from_date    DATE     NOT NULL,
   to_date      DATE     NOT NULL,
   KEY         (emp_no),
   KEY         (dept_no),
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)    ON DELETE CASCADE,
                                  -- ON UPDATE CASCADE??
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
   PRIMARY KEY (emp_no, dept_no)  -- might not be unique?? Need from_date
);
CREATE TABLE titles (
    emp_no      INT          NOT NULL,
    title       VARCHAR(50)  NOT NULL,
    from_date   DATE         NOT NULL,
    to_date     DATE,
    KEY         (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
                         -- ON UPDATE CASCADE??
    PRIMARY KEY (emp_no, title, from_date)
       -- This ensures unique combination. 
       -- An employee may hold the same title but at different period
);

CREATE TABLE salaries (
    emp_no      INT    NOT NULL,
    salary      INT    NOT NULL,
    from_date   DATE   NOT NULL,
    to_date     DATE   NOT NULL,
    KEY         (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
);

insert into employees(emp_no,birth_date,first_name,last_name,gender,hire_date) 
values(1,'1997-03-07','John','Thomas','M','2020-02-07');
select * from employees;
insert into employees(emp_no,birth_date,first_name,last_name,gender,hire_date) 
values(2,'1998-04-07','Joseph','Mathew','M','2020-03-07');
insert into employees(emp_no,birth_date,first_name,last_name,gender,hire_date) 
values(3,'1993-04-07','Milu','Mary','F','2018-04-01');
insert into employees(emp_no,birth_date,first_name,last_name,gender,hire_date) 
values(4,'1995-04-07','Sarah','T','F','2020-03-08');
insert into employees(emp_no,birth_date,first_name,last_name,gender,hire_date) 
values(5,'1996-03-07','Nadeema','Khader','F','2017-08-07');
insert into employees(emp_no,birth_date,first_name,last_name,gender,hire_date) 
values(6,'1992-02-07','Gowri','Nair','F','2015-08-07');

 
insert into employees (emp_no,birth_date,first_name,last_name,gender,hire_date)
values(6,'1992-12-12','joe','hiddleston','M','2021-03-21');
 
insert into employees (emp_no,birth_date,first_name,last_name,gender,hire_date)
values(7,'1992-12-12','jasper','john','M','1997-03-21');
 
 
insert into employees (emp_no,birth_date,first_name,last_name,gender,hire_date)
values(8,'1994-03-12','john','jasper','M','2020-03-21');
 
insert into employees (emp_no,birth_date,first_name,last_name,gender,hire_date)
values(9,'1996-12-12','rachel','green','F','2020-06-28');
 
Insert into employees (emp_no,birth_date,first_name,last_name,gender,hire_date)
values(10,'1967-04-14','james','A','M','2011-05-21');


CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,  -- in the form of 'dxxx'
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),                 -- Index built automatically
    UNIQUE  KEY (dept_name)                -- Build INDEX on this unique-value column
);
INSERT into departments values('HR','Human Resource');
INSERT into departments values('IT','Technical');
INSERT into departments values('FN','Finance');
INSERT into departments values('MK','Marketing');
INSERT into departments values('OP','Operations');
 
select * from departments;


CREATE TABLE dept_emp (
    emp_no      INT         NOT NULL,
    dept_no     CHAR(4)     NOT NULL,
    from_date   DATE        NOT NULL,
    to_date     DATE        NOT NULL,
    KEY         (emp_no),   -- Build INDEX on this non-unique-value column
    KEY         (dept_no),  -- Build INDEX on this non-unique-value column
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
           -- Cascade DELETE from parent table 'employee' to this child table
           -- If an emp_no is deleted from parent 'employee', all records
           --  involving this emp_no in this child table are also deleted
           -- ON UPDATE CASCADE??
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
           -- ON UPDATE CASCADE??
    PRIMARY KEY (emp_no, dept_no)
           -- Might not be unique?? Need to include from_date
);

 
insert into dept_emp(emp_no,dept_no,from_date,to_date)
values(1,'HR','2015-08-01','2020-07-01');
 
insert into dept_emp(emp_no,dept_no,from_date,to_date)
values(2,'IT','2018-08-01','2021-07-01');
 
insert into dept_emp(emp_no,dept_no,from_date,to_date)
values(3,'HR','2016-09-01','2020-07-01');
 
insert into dept_emp(emp_no,dept_no,from_date,to_date)
values(4,'FN','2017-01-01','2020-01-01');
 
insert into dept_emp(emp_no,dept_no,from_date,to_date)
values(5,'MK','2014-08-01','2019-07-01');

insert into dept_emp values(7,'FN','1997-03-21','2021-01-07');
insert into dept_emp values(8,'OP','2020-03-21','2021-01-07');
insert into dept_emp values(9,'IT','2020-06-28','2021-05-07');
insert into dept_emp values(10,'IT','2011-05-21','2019-05-12');
select * from employees;
select * from dept_emp;
SELECT * FROM DEPARTMENTS;
SELECT * FROM DEPT_MANAGER;

update dept_emp set from_date='2015-08-07' where emp_no=5;
update dept_emp set to_date='2021-04-08' where emp_no=4;
CREATE TABLE dept_manager (
   dept_no      CHAR(4)  NOT NULL,
   emp_no       INT      NOT NULL,
   from_date    DATE     NOT NULL,
   to_date      DATE     NOT NULL,
   KEY         (emp_no),
   KEY         (dept_no),
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)    ON DELETE CASCADE,
                                  -- ON UPDATE CASCADE??
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
   PRIMARY KEY (emp_no, dept_no)  -- might not be unique?? Need from_date
);

insert into dept_manager values ('FN',7,'1999-01-20','2020-01-07');
insert into dept_manager values ('HR',1,'2020-12-31','2021-07-01');
insert into dept_manager values ('MK',5,'2016-03-21','2020-07-21');
insert into dept_manager values ('OP',8,'2020-12-31','2021-07-21');
insert into dept_manager values ('IT',10,'2012-05-21','2018-07-21');


insert into titles values(1,'HR','2020-02-07','2020-07-01');
insert into titles values(2,'ITOps','2020-03-07','2021-07-01');
insert into titles values(3,'Consultant','2018-04-01','2020-07-01');
insert into titles values(4,'Asst Manager','2020-03-08','2021-04-08');
insert into titles values(5,'Lead','2015-08-07','2019-07-01');
insert into titles values(6,'Assistant','2015-08-07','2020-08-07');
insert into titles values(7,'Manager','1997-03-21','2021-01-07');
insert into titles values(8,'Lead','2020-03-21','2021-01-07');
insert into titles values(9,'assistant manager','2020-06-28','2021-05-07');
insert into titles values(10,'Itops','2011-05-21','2019-05-12');
select * from titles;

insert into salaries values(1,120000,'2020-02-07','2020-07-01');
insert into salaries values(2,40000,'2020-03-07','2021-07-01');
insert into salaries values(3,12356,'2018-04-01','2020-07-01');
insert into salaries values(4,35600,'2020-03-08','2021-04-08');
insert into salaries values(5,23000,'2015-08-07','2019-07-01');
insert into salaries values(6,23000,'2015-08-07','2020-08-07');
insert into salaries values(7,23000,'1997-03-21','2021-01-07');
insert into salaries values(8,23000,'2020-03-21','2021-01-07');
insert into salaries values(9,23000,'2020-06-28','2021-05-07');
insert into salaries values(10,23000,'2011-05-21','2019-05-12');

select * from salaries;






