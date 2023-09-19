# SQL 函数

### 函数

### 标量值函数

返回值只有一个

```sql
use 学生成绩管理系统gocreate function getanme(@stuno char(10)) returns char(8)asbegin    declare @stuname char(8)    select @styname = 姓名 from 学生 where 学号=@stuno    retuen @stunameend-- 函数的调用print dbo.getname('1001010127')
```

函数保存在可编程性-函数中

函数调用时，需要带上用户名

### 表值函数

返回值多个

```sql
-- 根据班级编号 获取该班的学生信息create function getstudent(@classno char(8)) returns tableas    retuen (select * from 学生 where 班级编号=@classno) -- 不写begin end ()可以不写-- 调用select * from dbo.getstudent('10010101');
```

### 多语句表值函数
