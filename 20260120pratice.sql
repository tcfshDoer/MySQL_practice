#DCL語句
#創建用戶 itcast，只能夠在當前主機localhost訪問，密碼123456;
create user 'itcast'@'localhost' identified by '123456';

#創建用戶 heima, 可以在任意主機訪問該數據庫，密碼123456;
create user 'heima'@'%' identified by '123456';

#修改用戶 heima 的訪問密碼為1234;
alter user 'heima'@'%' identified with mysql_native_password by '1234';

#刪除itcast@localhost用戶
drop user 'itcast'@'localhost';

#查詢權限
show grants for 'heima'@'%';

#授予權限
grant all on itcast.* to 'heima'@'%';

#撤銷權限
revoke all on itcast.* from 'heima'@'%';

#函數演飾
#concot
select concat('Hello','MySQL');

#lower
select lower('Hello');

#upper
select upper('Hello');

#lpad
select lpad('01',5,'-');

#rpad
select rpad('01',5,'-');

#trim
select trim(('Hellow MySQL'));

#substring
select substring('Hello MySQL',1,5);

#由於業務需求，企業員工工號統一工號，工號統一為五碼，目前不足為五位數的全部在前面補零。比如:1號員工的工號應該為00001。
update itcast.emp set workno = lpad(workno,5,'0');

#數值函數
#ceil
select ceil(1.1);

#floor
select floor(1.9);

#mod求餘數
select mod(3,4);

#rand
select rand();

#round
select round(2.345,2);

#案例:通過數據庫的函數，生成一個六位數的隨機數
select lpad(round(rand()*100000,0),6,'0');

#日期函數
#curdate()
select curdate();

#curtime()
select curtime();

#now()
select now();

#year,month,day
select YEAR(now());

select month(now());

select day(now());

#date_add
select date_add(now(),INTERVAL 70 year);

#datediff
select datediff('2021-12-01','2021-11-01');

#查詢所有員工的入職天數，並根據入職天數倒序排序
select name,datediff(curdate(),entrydate) as 'entrydate' from  itcast.emp;

#流程函數
#if
select if(true,'Ok','Error');

#ifnull
select ifnull('Ok','Default');

select ifnull('','Default');

select ifnull(null,'Default');

#case when then else end
#需求:查詢emp表的員工姓名和工作地址(北京、上海->一線城市;其他->二線城市
select
    name,
    case workaddress when '北京'then '一線城市'when '上海' then '一線城市'else '二線城市' end
from itcast.emp;
#統計班級各個同學的成績，展示範例如下
#->=85，展示優秀
#->=60，展示及格
#->否則，展示不及格

create table score(
    id int comment 'ID',
    name varchar(20) comment '姓名',
    math int comment '數學',
    english int comment '英語',
    chinese int comment '語文',
)comment '學員成績表';
insert into 







