
DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;


# 创建部门表
	CREATE TABLE dept(
		did INT PRIMARY KEY AUTO_INCREMENT,
		dname VARCHAR(20)
	);
	
	# 创建员工表
	CREATE TABLE emp (
		id INT PRIMARY KEY AUTO_INCREMENT,
		NAME VARCHAR(10),
		gender CHAR(1), -- 性别
		salary DOUBLE, -- 工资
		join_date DATE, -- 入职日期
		dep_id INT,
		FOREIGN KEY (dep_id) REFERENCES dept(did) -- 外键，关联部门表(部门表的主键)
	);
	-- 添加部门数据
	INSERT INTO dept (dNAME) VALUES ('研发部'),('市场部'),('财务部'),('销售部');
	-- 添加员工数据
	INSERT INTO emp(NAME,gender,salary,join_date,dep_id) VALUES
	('孙悟空','男',7200,'2013-02-24',1),
	('猪八戒','男',3600,'2010-12-02',2),
	('唐僧','男',9000,'2008-08-08',2),
	('白骨精','女',5000,'2015-10-07',3),
	('蜘蛛精','女',4500,'2011-03-14',1),
	('小白龙','男',2500,'2011-02-14',null);	


select * from emp;

-- 多表查询

select * from emp , dept;

-- 笛卡尔积 ： 有 A ,B两个集合 取 A,B所有的组合情况


-- 消除无效数据


-- 查询emp 和 dept 的数据 ，emp.dep_id = dept.did
-- 隐式内连接
select * from emp , dept where emp.dep_id = dept.did;


-- 查询 emp 的name,gender 和dept 的dname
select emp.name,emp.gender,dept.dname from emp,dept where emp.dep_id = dept.did;
-- 起别名
select t1.name,t1.gender,t2.dname from emp t1,dept t2 where t1.dep_id = t2.did;

-- 显示内连接
select * from emp inner join dept on emp.dep_id = dept.did;

-- 左外连接
-- 查询emp表所有数据和对应的部门信息
select * from emp left join dept on emp.dep_id = dept.did;
-- 右外连接
-- 查询dept表所有数据和对应的部门信息
select * from emp right join dept on emp.dep_id = dept.did;


-- 子查询

-- 查询猪八戒的工资
select salary from emp where name = '猪八戒';
-- 查询工资高于3600
select * from emp where salary >3600;
-- 查询工资高于猪八戒的员工信息
select * from emp where salary > (select salary from emp where name = '猪八戒');

-- 查询'财务部'和'市场部'所有的员工信息
select did from dept where dname = '财务部' or dname ='市场部'; 
select * from emp where dep_id in (2,3);
select * from emp where dep_id in (select did from dept where dname = '财务部' or dname ='市场部');

-- 查询入职日期是'2011-11-11'之后的员工信息和部门信息
select * from emp where join_date > '2011-11-11';
select * from emp ,dept where emp.dep_id = dept.did;
select * from (select * from emp where join_date > '2011-11-11') t1,dept where t1.dep_id = dept.did;		-- 将大于日期的员工表作为虚拟表替换原来的员工表，并且起别名为t1

