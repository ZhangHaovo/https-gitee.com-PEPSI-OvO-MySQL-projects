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

#### ①.操作数据库：

##### 	1.查找数据库：

```sql
show databases;
```

##### 	2.创建数据库：

```sql
create database db1;	--db1为要创建的数据库名
```

```sql
create database if not exists db1;	--数据库不存在时候创建数据库
```

##### 	3.删除数据库：

```sql
drop database db1;
```

```sql
drop database if exists db1;	--数据库存在时删除数据库
```

##### 	4.进入数据库：

```sql
use db1;		--进入(切换)数据库db1
```

```sql
select database();	--查看当前使用的数据库
```

#### ②.操作表：

##### 	1.查询表：

```sql
show tables;	--查询当前数据库下所有表名称
```

```sql
desc 表名称;	--查询表结构
```

##### 	2.创建表：

```sql
create table 表名 (
			字段名1 数据类型1,	
			字段名2 数据类型2, 
			...,
			字段名n 数据类型n	--最后一行不要加逗号
		);
```

##### 	3.修改表：

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

##### 	4.删除表：

```sql
drop 表名称；
```

```sql
drop table if exists 表名；	--若表存在则删除
```



### 四、DML(Data Manipulation Language):数据操作语言

#### ①添加数据

##### 	1.给指定列添加数据：

```sql
insert into 表名(列名1，列名2，...) values(值1，值2,...);
```

##### 2.给全部列添加数据

```sql
insert into 表名 values(值1，值2,...);
```

##### 3.批量添加数据

```sql
insert into 表名(列名1，列名2，...) values(值1，值2,...),values(值1，值2,...)...;
```

```sql
insert into 表名 values(值1，值2,...),values(值1，值2,...)...;
```

#### ②修改数据

```sql
update 表名 set 列名1=值1,列名2=值2,...[where 条件]；	--注意：修改语句中如果不加条件，则将所有列数据都修改
```

#### ③删除数据

```sql
delete from 表名 [where 条件]；	--注意：删除语句中如果不加条件，则将所有列数据都删除
```



### 五、DQL(Data Query Language):数据查询语言

#### 查询语法：

```sql
select 字段列表 from 表名列表 where 条件列表 group by 分组字段 having 分组后条件 order by 排序字段 limit 分页限定
```

#### ①基础查询

##### 1.查询多个字段

```sql
select 字段列表 from 表名；
select * from 表名；	-- 查询所有数据
```

##### 2.去除重复记录

```sql
select distinct 字段列表 from 表名；
```

##### 3.起别名

```sql
AS:	--AS也可以省略
```

#### ②条件查询

```sql
select 字段列表 from 表名 where 条件列表；
```

```sql
select 字段列表 from 表名 where 字段列表 like 'xxx'；	--模糊查询，xxx填写条件，_单个任意字符 %多个任意字符
```



#### ③排序查询

```sql
select 字段列表 from 表名 order by 排序字段名1[排序方式1],排序字段名2[排序方式2]...;		-- ASC:升序(默认)；DESC:降序。字段一一样时，按照字段二排序
```































































































































































































































































































































































































































