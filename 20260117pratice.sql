drop table employee;

#數據準備
create table emp(
    id          int             comment '編號',
    workno      varchar(10)     comment '工號',
    name        varchar(10)     comment '姓名',
    gender      char(1)         comment '性別',
    age         tinyint unsigned comment '年齡',
    idcard      char(18)        comment '身份證號',
    workaddress varchar(50)     comment '工作地址',
    entrydate   date            comment  '入職時間,'
)   comment '員工表';

insert into emp(id, workno, name, gender, age, idcard, workaddress, entrydate)
values  (1,'1','柳岩','女',20,'123456789012345678','北京','2000-01-01'),
        (2,'2','柳岩','女',20,'123456789012345678','北京','2000-01-01'),
        (3,'3','柳岩','女',20,'123456789012345678','北京','2000-01-01'),
        (4,'4','柳岩','女',20,'123456789012345678','北京','2000-01-01'),
        (5,'5','柳岩','女',20,'123456789012345678','北京','2000-01-01'),
        (6,'6','柳岩','女',20,'123456789012345678','北京','2000-01-01'),
        (7,'7','柳岩','女',20,'123456789012345678','北京','2000-01-01'),
        (8,'8','柳岩','女',20,'123456789012345678','北京','2000-01-01'),
        (9,'9','柳岩','女',20,'123456789012345678','北京','2000-01-01'),
        (10,'10','柳岩','女',20,'123456789012345678','北京','2000-01-01'),
        (11,'11','柳岩','女',20,'123456789012345678','北京','2000-01-01'),
        (12,'12','柳岩','女',20,'123456789012345678','北京','2000-01-01'),
        (13,'13','張三豐','男',88,'123456789012345678','北京','2000-01-01'),
        (14,'14','柳岩','女',20,'123456789012345678','北京','2000-01-01'),
        (15,'15','柳岩','女',20,'123456789012345678','北京','2000-01-01'),
        (16,'16','柳岩','女',20,'123456789012345678','北京','2000-01-01');
TRUNCATE TABLE emp;
-- 然後重新執行一次正確的 INSERT (13 筆)

#基礎查詢
#1.查詢定字段 name,workno,age 返回
select name,workno,emp.age from emp;

#2. 查詢宿字段返回
select id,emp.workno,emp.name,emp.gender,emp.age,emp.idcard,emp.workaddress,emp.entrydate from emp;

#3查詢所有員工的工作地址
select emp.workaddress as '工作地址' from emp;
select emp.workaddress '工作地址' from emp;

#4查詢公司員工的上班地址(不要重複)
select distinct  emp.workaddress '工作地址' from emp;


#條件查詢
#1查詢年齡等於88的員工
select  * from emp where age =88;

#2查詢姓名為兩字的員工信息
select  * from emp where  name like '__';

#3查詢身分證最後一號是X的員工信息
select  * from emp where idcard like '%X';

#聚合函數
#1統計竿企業員工數量
select  count(*) from emp;
#2統計該企業員工的平均年齡
select avg(emp.age) from emp;
#3統計西安地區員工的年齡之和
select  sum(emp.age) from emp where workaddress ='西安';

#分組查詢
#1.根據性別分組，統計男性員工 和 女性員工的數量
select gender,count(*) from emp group by gender;
#2.根據性別分組，統計男員工 和 女性員工的平均年齡
select emp.gender,avg(emp.age) from  emp group by gender;
#3查詢年齡小於45的員工，並根據工作地址分組，獲取員工數量大於等於3的工作地址
select emp.workaddress,count(*) address_count from emp where age < 45 group by  workaddress having address_count >=3;

#排序查詢
#1.根據年齡對公司的員工進行升序排序
select * from emp order by entrydate asc ;

#分頁查詢
#1查詢第一頁員工數據，每頁展示10條紀錄(0~9)
select  * from  emp limit 0,10;

#2查詢第二頁員工數據，每頁展示10條紀錄(10~19)
select  * from  emp limit 10,10;

#DQL語句
#1查詢年齡為20，21，22、23的女性員工信息
select  * from emp where gender = '女' and age in (20,21,22,23);

#2查詢性別為男，並且年齡定在20~40歲(含)以內的姓名為三個字的員工
select * from emp where gender = '男' and ( age between  20 and  40) and name like '___';
#3統計員工表中，年齡小於60歲的，男性員工和女性員工的人數
select emp.gender,count(*) from emp where emp.age < 60 group by gender;

#4查詢所有年齡小於等於35歲員工的姓名和年齡，並對查詢結果按年齡生續排序，如果年齡相同按入職時間降序排序
select  emp.name,emp.age from emp where age <=35 order by age asc ,entrydate desc ;
#5查詢性別為男，且年齡在20歲~40歲(含)以內的前五個員工信息，對查詢的結果按年齡升序排序，年齡按入職時間升序排序
select * from emp where gender =  '男' and age between 20 and 40 order by age asc , entrydate asc limit 5;
