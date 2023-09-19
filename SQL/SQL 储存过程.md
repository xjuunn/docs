# SQL 储存过程

```markdown
## SQL存储过程

#### 创建-不带参数的存储过程

~~~ SQL
create proc stunum
as
select count(*) from 学生
~~~

调用

> ```sql
> exec stunum
> ```

#### 创建带参数的存储过程

~~~ SQL
create proc stunumbyclass @classno char(8)
as
select count(*) from 学生 where 班级编号=@classno
~~~

> ```sql
> execstunumbyclass '10101010'
> ```

两个参数

```sql
create proc stun @classno char(8),@num int output
as
select @num=count(*) from 学生 where 班级编号=@classno
-- 调用
declare @stunum int
exec stun '10010101',@stunum output
print '人数为'+cast(@stunum as char(2))+'人'
```

数据类型转换

* cast
* convert

##### 例子

```sql
--创建存储过程，实现学生成绩的录入，业务逻辑如下：
--1.判断学号是否存在
--2.判断课程编号是否存在
--3.判断成绩在0-100之间
--4.判断该学生该门课程的成绩是否已经录入
--5.判断性质是否为 正常、补考

create proc addscore @stuno char(10),@courseno char(6),@score int ,@type varchar(10)
as
begin
  if not exists(select * from 学生 where 学号=@stuno)
  begin
    print '该学号不存在！'
    return
  end

  if not exists(select * from 课程 where 课程编号=@courseno)
  begin
    print '该课程不存在！'
    return
  end

  if @score not between 0 and 100 
  begin
    print '成绩必须在0-100之间！'
    return
  end

  if exists(select * from 成绩 where 学号=@stuno and 课程编号=@courseno)
  begin
    print '学号为'+@stuno + '，课程编号为'+@courseno+ '的成绩已经录入！'
    return
  end

  if @type <>'正常' and @type<>'补考'
  begin
    print '性质必须为正常或补考'
    return
  end

  insert into 成绩
  values(@stuno,@courseno,@score,@type)

  print '成绩录入成功！'
end

go

exec dbo.addscore '1101010101','101003',80,'正常'
go

--根据学号、课程号 修改补考成绩
create proc updatescore @stuno char(10),@courseno char(6),@score int 
as
begin  
  if @score not between 0 and 100 
  begin
    print '成绩必须在0-100之间！'
    return
  end
  if not exists(select * from 成绩 where 学号=@stuno and 课程编号=@courseno)
  begin
    print '学号为'+@stuno + '，课程编号为'+@courseno+ '的成绩尚未录入！'
    return
  end  
  update 成绩 set 成绩=@score,性质='补考' where 学号=@stuno and 课程编号=@courseno
  print '补考成绩录入成功！'
end
go
exec dbo.updatescore '1101010101','101003',60
go
--学生信息删除，根据学号
--判断学号是否存在
--判断有没有成绩
create proc delstu @stuno char(10)
as
begin
  if not exists(select * from 学生 where 学号=@stuno)
  begin
    print '查无此学生！'
    return
  end 

  if exists(select * from 成绩 where 学号=@stuno)
  begin
    print '该学生存在成绩记录，不允许删除！'
    return
  end

  delete from 学生  where 学号=@stuno
  print '删除成功！'

end

go
exec dbo.delstu '1101010104'
```

> 存储过程的加密 
>
> create ... 
>
> with encryption
```SQL

```
