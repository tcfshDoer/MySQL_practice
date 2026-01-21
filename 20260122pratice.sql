#約束
create table user(
    id int primary key auto_increment comment '主鍵',
    name varchar(10) not null unique comment '姓名',
    age int check ( age>0 && age<=120 ) comment '年齡',
    status char(1) default '1' 评论 '狀態'，
    gender char(1) comment '性別'
)comment '用戶表';

#插入數據
insert into user( name, age, status, gender) values ('Tom1',19，'1'，'男'),('Tom2',25，'0'，'男');
insert into user(name, age, status, gender) values ('Tom3',19，'1'，'男')

insert into user(name, age, status, gender) values ('Tom4',80，'1'，'男');

#外鍵約束，用來保持醫治性和完整性
#準備數據
create table dept(
    id int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '部門名稱'
)comment '部門表';
INSERT into dept(id, name) VALUES (1，'研發部'),(2，'事業部'),(3，'財務部'),(4，'銷售部'),(5，'總經辦');

create table emp(
    id int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '姓名',
    age int comment '年齡',
    job varchar(20) comment '職位',
    salary int comment '薪資',
    entrydate date comment '入質時間',
    mangerid int comment '直屬領導ID',
    dept_id int comment '部門ID'
)comment '員工表';

INSERT into emp(id, name, age, job, salary, entrydate, mangerid, dept_id) VALUES
(1，'金庸',66，'總裁',20000，'2000-01-01'，null，5);

#添加外鍵
alter table emp add constraint fk_emp_dept_id foreign key (dept_id) references dept(id);

#刪除外鍵
alter table emp drop foreign key fk_emp_dept_id;

#外鍵的刪除和更新
alter table  emp add constraint fk_emp_dept_id foreign key (dept_id) references  dept(id, name) ON UPDATE cascade on DELETE cascade ;

alter table  emp add constraint fk_emp_dept_id foreign key (dept_id) references  dept(id, name) ON UPDATE set null on DELETE set null ;

-- 创建用户基础信息表
CREATE TABLE IF NOT EXISTS tb_user (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '用户唯一ID',
    name VARCHAR(10) NOT NULL COMMENT '姓名',
    age INT COMMENT '年龄',
    gender ENUM('男', '女') COMMENT '性别',
    phone CHAR(11) COMMENT '手机号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户基础信息表';

-- 创建用户教育信息表
CREATE TABLE IF NOT EXISTS tb_user_edu (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '教育信息ID',
    degree VARCHAR(20) COMMENT '学历（本科/硕士/博士等）',
    major VARCHAR(50) COMMENT '专业',
    primaryschool VARCHAR(50) COMMENT '小学名称',
    middleschool VARCHAR(50) COMMENT '中学名称',
    university VARCHAR(50) COMMENT '大学名称',
    userid INT UNIQUE NOT NULL COMMENT '关联用户ID',
    -- 外键约束：关联tb_user的id
    CONSTRAINT fk_userid FOREIGN KEY (userid) REFERENCES tb_user(id)
        ON DELETE CASCADE  -- 用户删除时，教育信息也同步删除
        ON UPDATE CASCADE  -- 用户ID更新时，教育信息的userid同步更新
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户教育信息表';
