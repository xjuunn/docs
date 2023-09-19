# SQL 变量

### 变量

系统常量

- @@servername服务器名称
- @@version服务器版本

### 变量

### 定义

> declare 声明、定义
> 

```sql
declare @wname varchar(50),@wid char(3)select @wname = (select 姓名 from 学生 where 学号 = '1001010127')set @wid = @
```
