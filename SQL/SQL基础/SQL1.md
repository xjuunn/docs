# SQL1

对象处理

- Create：创建对象
- Alter：修改对象
- Drop：删除对象

数据处理

- Select：选择，数据查询
- Insert：数据录入
- Update：数据修改
- Delete：数据删除

权限管理

- Grant：授权
- Revoke：回收权限

数据文件扩展名mdfndf

日志文件扩展名ldf

数据库迁移，分离和附加数据库。

选中语句，会只执行选中的语句。

---

### Create语句创建数据库

```sql
create database student
```

```sql
create database factoryon(    name = fac,    filename = 'C:\data\fac.maf',    size = 5MB,    maxsize = 30MB,    filegrowth = 5MB)log on(    name = fac_log,    filename = 'C:\data\fac_log.ldf',    size = 5MB,    maxsize = 30MB,    filegrowth = 5MB)
```

### Drop数据库

```sql
drop database test
```

### Alter修改数据库

- add 添加文件
- modify 修改文件
- remove 移除文件

```sql
alter database studentadd file //添加文件(    name = student1,    filename = 'C:\data\student1.ndf',    size = 8MB,    maxsize = 40MB,    filegrowth = 5MB)alter database studentmodify file //修改文件(    name = student1,    size = 20MB)alter database studentremove file student1 //移除文件
```

---

### Create创建表

```sql
create table student1(    学号 char(12) primary key,    姓名 varchar(30) not null,    性别 nchar(1) not null default '男'，    出生日期 date,    身份证号 char(18) unique,    政治面貌 nchar(2) default '团员'，    联系电话 varchar(13),    家庭住址 varchar(100))
```
