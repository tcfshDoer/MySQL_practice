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

