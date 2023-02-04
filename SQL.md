### 一、SQL通用语法：

​	①SQL语言可以单行或者多行书写，以句号结尾
​	②MySQL数据库的SQL语言不区分大小写，关键字建议使用大写
​	③注释:单行：-- xxx ; 多行：/*xxx*/



### 二、SQL分类：

​	①DDL(Data Definition Language):数据定义语言，用于定义数据库对象：数据库，表，列等
​	②DML(Data Manipulation Language):数据操作语言，用于对数据库中表的数据进行增删改
​	③DQL(Data Query Language):数据查询语言，用于查询数据库中表的记录（数据）
​	④DCL(Data Control Language):数据控制语言，用于定义数据库的访问权限和安全级别，及创建用户



### 三、DDL(Data Definition Language):数据定义语言

#### 1.操作数据库：

##### 	①.查找数据库：

```sql
show databases;
```

##### 	②.创建数据库：

```sql
create database db1;	--db1为要创建的数据库名
```

```sql
create database if not exists db1;	--数据库不存在时候创建数据库
```

##### 	③.删除数据库：

```sql
drop database db1;
```

```sql
drop database if exists db1;	--数据库存在时删除数据库
```

##### 	④.进入数据库：

```sql
use db1;		--进入(切换)数据库db1
```

```sql
select database();	--查看当前使用的数据库
```

#### 2.操作表：

##### 	①.查询表：

```sql
show tables;	--查询当前数据库下所有表名称
```

```sql
desc 表名称;	--查询表结构
```

##### 	②.创建表：

```sql
create table 表名 (
			字段名1 数据类型1,	
			字段名2 数据类型2, 
			...,
			字段名n 数据类型n	--最后一行不要加逗号
		);
```

##### 	③.修改表：

```sql
alter table 表名 rename to 新的表名；	--修改表名
```

```sql
alter table 表名 add 列名 数据类型；	--添加一列
```

```sql
alter table 表名 modify 列名 数据类型	--修改数据类型
```

```sql
alter table 表名 change 列名 新的列名 新的数据类型		--修改列名和数据类型
```

```sql
alter table 表明 drop 列名	--删除列
```

##### 	④.删除表：

```sql
drop 表名称；
```

```sql
drop table if exists 表名；	--若表存在则删除
```



### 四、DML(Data Manipulation Language):数据操作语言

#### 1.添加数据

##### 	①.给指定列添加数据：

```sql
insert into 表名(列名1，列名2，...) values(值1，值2,...);
```

##### ②.给全部列添加数据

```sql
insert into 表名 values(值1，值2,...);
```

##### ③.批量添加数据

```sql
insert into 表名(列名1，列名2，...) values(值1，值2,...),values(值1，值2,...)...;
```

```sql
insert into 表名 values(值1，值2,...),values(值1，值2,...)...;
```

#### 2.修改数据

```sql
update 表名 set 列名1=值1,列名2=值2,...[where 条件]；	--注意：修改语句中如果不加条件，则将所有列数据都修改
```

#### 3.删除数据

```sql
delete from 表名 [where 条件]；	--注意：删除语句中如果不加条件，则将所有列数据都删除
```



### 五、DQL(Data Query Language):数据查询语言

#### 查询语法：

```sql
select 字段列表 from 表名列表 where 条件列表 group by 分组字段 having 分组后条件 order by 排序字段 limit 分页限定
```

#### 1.基础查询

##### ①.查询多个字段

```sql
select 字段列表 from 表名；
select * from 表名；	-- 查询所有数据
```

##### ②.去除重复记录

```sql
select distinct 字段列表 from 表名；
```

##### ③.起别名

```sql
AS:	--AS也可以省略
```

#### 2.条件查询

```sql
select 字段列表 from 表名 where 条件列表；
```

```sql
select 字段列表 from 表名 where 字段列表 like 'xxx'；	--模糊查询，xxx填写条件，_单个任意字符 %多个任意字符
```



#### 3.排序查询

```sql
select 字段列表 from 表名 order by 排序字段名1[排序方式1],排序字段名2[排序方式2]...;		-- ASC:升序(默认)；DESC:降序。字段一一样时，按照字段二排序
```



#### 4.分组查询

##### ①.聚合函数：将一列数据作为一个整体，进行纵向计算

```sql
select 聚合函数名(列名) from 表;
```

| 函数名      | 功能     | 说明                |
| ----------- | -------- | ------------------- |
| count(列名) | 统计数量 | 参数建议写主键或者* |
| max(列名)   | 最大值   |                     |
| min(列名)   | 最小值   |                     |
| sum(列名)   | 求和     |                     |
| avg(列名)   | 平均值   |                     |

-- null不参与任何聚合函数

##### ②分组查询

```sql
select 字段列表 from 表名 [where 分组前条件限定] group by [having 分组后条件过滤]；	--分组之后，查询的字段为聚合函数和分组字段，查询其他字段无任何意义
```

where和having的区别：

- where是分组之前进行限定，不满足where条件，则不参与分组，而having是分组之后对结果过滤
- where不能对聚合函数进行判断，having可以
- 执行顺序：where > 聚合函数 > having



#### 5.分页查询

```sql
select 字段列表 from 表名 limit 起始索引.查询条目数;	-- 起始索引：从0开始
```

计算公式：起始索引=(当前页码 - 1)*每页显示的条数

tips:

- 分页查询limit是MySQL数据库的方言
- Oracle分页查询使用rownumber
- SQL Serve分页查询使用top



### 六.约束

#### 1.约束的概念：

- 约束是作用于表中列上的规则，用于限制加入表的数据
- 约束的存在保证了数据库中数据的正确性，有效性，完整性



#### 2.约束的分类：

| 约束名称 | 描述                                                         | 关键词      |
| -------- | ------------------------------------------------------------ | ----------- |
| 非空约束 | 保证列中所有数据不为空                                       | NOT NULL    |
| 唯一约束 | 保证列中所有数据各不相同                                     | UNIQUE      |
| 主键约束 | 主键是一行数据的唯一标识，要求非空唯一                       | PRIMARY KEY |
| 检查约束 | 保证列中的值满足某一条件                                     | CHECK       |
| 默认约束 | 报讯数据时，未指定值则采用默认值                             | DEFAULT     |
| 外键约束 | 外键用来让俩个表的数据之间建立链接，保证数据的一致性和完整性 | FOREIGN KEY |

-- MySQL不支持检查约束

##### ①非空约束：

(1)添加约束

```sql
-- 创建表时添加非空约束
CREATE TABLE 表名(
   列名 数据类型 NOT NULL,
   …
); 
```

(2)删除约束

```sql
ALTER TABLE 表名 MODIFY 字段名 数据类型;
```

##### ②唯一约束：

(1)添加约束

```sql
-- 创建表时添加唯一约束
CREATE TABLE 表名(
   列名 数据类型 UNIQUE [AUTO_INCREMENT],
   -- AUTO_INCREMENT: 当不指定值时自动增长
   …
); 
CREATE TABLE 表名(
   列名 数据类型,
   …
   [CONSTRAINT] [约束名称] UNIQUE(列名)
); 
```

```sql
-- 建完表后添加唯一约束
ALTER TABLE 表名 MODIFY 字段名 数据类型 UNIQUE;
```

(2)删除约束

```sql
ALTER TABLE 表名 DROP INDEX 字段名;
```

##### ③主键约束：

(1)添加约束

```sql
-- 创建表时添加主键约束
CREATE TABLE 表名(
   列名 数据类型 PRIMARY KEY [AUTO_INCREMENT],
   …
); 
CREATE TABLE 表名(
   列名 数据类型,
   [CONSTRAINT] [约束名称] PRIMARY KEY(列名)
); 
```

```sql
-- 建完表后添加主键约束
ALTER TABLE 表名 ADD PRIMARY KEY(字段名);
```

(2)删除约束

```sql
ALTER TABLE 表名 DROP PRIMARY KEY;
```

##### ④默认约束：

(1)添加约束

```sql
-- 创建表时添加默认约束
CREATE TABLE 表名(
   列名 数据类型 DEFAULT 默认值,
   …
); 
```

```sql
-- 建完表后添加默认约束
ALTER TABLE 表名 ALTER 列名 SET DEFAULT 默认值;
```

(2)删除约束

```sql
ALTER TABLE 表名 ALTER 列名 DROP DEFAULT;
```

##### ⑤外键约束：

(1)添加约束

```sql
-- 创建表的时候添加外键约束 
create table 表名 （
	列名 数据元素，
	...
	[constraint][外键名称] foreign key(外键列名) references 主表(主表列名)
);
```

```sql
-- 创建表后添加外键约束
alter table 表名 add constraint 外键名称 foreign key(外键列名) references 主表(主表列名)；
```

(2)删除约束

```sql
alter table 表名 drop foreign key 外键名称；
```



### 七.数据库设计

#### 1.数据库设计概念

- 数据库设计就是根据业务系统的具体需求，结合我们所选用的DBMS，为这个业务系统构造出最优的数据存储模型。
- 建立数据库中的表结构以及表与表之间的关联关系的过程。
- 有哪些表？表里有哪些字段？表和表之间有什么关系？



#### 2.数据库设计的步骤

##### ①需求分析（数据是什么? 数据具有哪些属性? 数据与属性的特点是什么）

##### ②逻辑分析（通过ER图对数据库进行逻辑建模，不需要考虑我们所选用的数据库管理系统）

##### ③物理设计（根据数据库自身的特点把逻辑设计转换为物理设计(表)）

##### ④维护设计（1.对新的需求进行建表；2.表优化）



#### 3.表关系

##### ①一对一

一对一关系多用于表拆分，将一个实体中经常使用的字段放一张表，不经常使用的字段放另一张表，用于提升查询性能，如：用户 和 用户详情

实现方式：在任何一方设置外键，关联对方主键，并设置外键唯一

##### ②一对多

一个部门对应多个员工，一个员工对应一个部门，如：部门 和 员工

实现方式：在多的一方建立外键关联一的一方主键

##### ③多对多

一个商品对应多个订单，一个订单包含多个商品，如：商品 和 订单

实现方式：建立第三张表，中间表至少包含2个外键



### 八.多表查询

查询时消除无效的数据

#### 1.连接查询

##### ①内连接查询：相当于查询AB交集数据

​	(1)隐式内连接

```sql
SELECT 字段列表 FROM 表1,表2… WHERE 条件;
```

​	(2)显示外连接

```sql
SELECT 字段列表 FROM 表1 [INNER] JOIN 表2 ON 条件;		-- inner可省略
```

##### ②外连接查询：

​	(1)左外连接查询 ：相当于查询A表所有数据和交集部门数据

```sql
SELECT 字段列表 FROM 表1 LEFT [OUTER] JOIN 表2 ON 条件;
```

​	(2)右外连接查询 ： 相当于查询B表所有数据和交集部分数据

```sql
SELECT 字段列表 FROM 表1 RIGHT [OUTER] JOIN 表2 ON 条件;
```



#### 2.子查询

查询中嵌套查询，称嵌套查询为子查询。

子查询根据查询结果不同，作用不同

(1).单行单列：子查询语句作为条件值，使用 =  !=  >  <  等进行条件判断

```
select 字段列表 from 表 where 字段名 = (子查询);
```

(2).多行单列：子查询语句作为条件值，使用 in 等关键字进行条件判断

```sql
select 字段列表 from 表 where 字段名 in (子查询);
```

(3).多行多列：子查询语句作为虚拟表

```sql
select 字段列表 from (子查询) where 条件;
```



#### 3.其他知识点

##### ①表起别名

```sql
表名 别名
```



### 九.事务

- 数据库的事务（Transaction）是一种机制、一个操作序列，包含了一组数据库操作命令
- 事务把所有的命令作为一个整体一起向系统提交或撤销操作请求，即这一组数据库命令==要么同时成功，要么同时失败
- 事务是一个不可分割的工作逻辑单元

#### 1.语法

##### ①开启事务

```sql
start transaction；
-- 或者
BEGIN;
```

##### ②提交事务

```sql
commit；
```

##### ③回滚事务

```sql
rollback;
```



#### 2.事务的四大特征

##### ①原子性（Atomicity）: 事务是不可分割的最小操作单位，要么同时成功，要么同时失败

##### ②一致性（Consistency） :事务完成时，必须使所有的数据都保持一致状态

##### ③隔离性（Isolation） :多个事务之间，操作的可见性

##### ④持久性（Durability） :事务一旦提交或回滚，它对数据库中的数据的改变就是永久的















































































































































































































































































































