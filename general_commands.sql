show databases;
select user from mysql.user;
create user gowri@localhost identified by 'root123';
grant insert on *.* to gowri@localhost;
show grants for gowri@localhost;
use mysql;
desc user;
select current_user();
select * from user;