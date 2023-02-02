-- 删除stu表
drop table if exists stu;


-- 创建stu表
CREATE TABLE stu (
 id int, -- 编号
 name varchar(20), -- 姓名
 age int, -- 年龄
 sex varchar(5), -- 性别
 address varchar(100), -- 地址
 math double(5,2), -- 数学成绩
 english double(5,2), -- 英语成绩
 hire_date date -- 入学时间
);

-- 添加数据
INSERT INTO stu(id,NAME,age,sex,address,math,english,hire_date) 
VALUES 
(1,'马运',55,'男','杭州',66,78,'1995-09-01'),
(2,'马花疼',45,'女','深圳',98,87,'1998-09-01'),
(3,'马斯克',55,'男','香港',56,77,'1999-09-02'),
(4,'柳白',20,'女','湖南',76,65,'1997-09-05'),
(5,'柳青',20,'男','湖南',86,NULL,'1998-09-01'),
(6,'刘德花',57,'男','香港',99,99,'1998-09-01'),
(7,'张学右',22,'女','香港',99,99,'1998-09-01'),
(8,'德玛西亚',18,'男','南京',56,65,'1994-09-02');

select * from stu;

-- 基础查询==================================================================================

select name,age from stu;	-- 查询name,age列
select * form stu;				-- 查询所有列数据

select distinct address from stu;	-- 查询所有地址去除重复信息

select name,math as 数学成绩,english 英语成绩 from stu;		-- 查询数学成绩和英语成绩并且起别名


-- 条件查询==================================================================================

select * from stu where age>20; 			-- 查询年龄大于20岁的人
select * from stu where hire_date between '1998-09-01' and '1999-09-01'; 	-- 查询年龄在20-30之间的人

select * from stu where age in (18,20,22);	-- 年龄是18，20，22的人
select * from stu where english is null; 		-- 英语成绩是null的人，注意null只能用is 和 is not

select * from stu where name like '马%';	-- 查询姓马的，模糊查询，_单个任意字符 %多个任意字符

-- 排序查询==================================================================================

select * from stu order by age asc,math desc;		-- 按照年龄增长的方式排序,如果年龄相同按照math降序排序