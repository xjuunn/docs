# SQL 游标

## 游标

游标：支持对结果集中的数据进行逐行处理，支持个性化操作 select * from 学生 where 性别 = ‘男’ 游标的执行步骤 1. 声明游标：指定游标所对应的结果集 declare 2. 打开游标：open 3. 提取数据：fetch，while循环，，业务逻辑操作 4. 关闭游标：close 5. 释放游标：deallocate 通过游标，逐行显示每个学生的学号和姓名，输入的格式为： 学号：1010001，姓名：张三 ~~~ sql declate cur_stu cursor for select 学号,姓名 from 学生 declare @stuno char(10),@stuname char(8) open cur_stu fetch next from cur_stu into @stuno,@stuname while @@FETCH_STATUS=0 –=0代表可以提取到数据 begin print ‘学号:’+@stuno+‘,姓名:’+@stuname fetch next from cur_stu into @stuno,@stuname end close cur_stu deallocate cur_stu ~~~

```sql
--通过游标--对每个学生的总学分 进行重新计算：根据成绩表已经存在的及格成绩进行计算godeclare cur_stu cursor for select 学号 from 学生表declare @credits int,@stuno char(6)open cur_stufetch next from cur_stu into @stunowhile @@FETCH_STATUS=0begin  select @credits=sum(学分) from 课程表  where 课程号 in (  select 课程号 from 成绩表 where 学号=@stuno and 成绩>60)  update 学生表  set 总学分= isnull( @credits,0)  where 学号=@stuno  fetch next from cur_stu into @stunoendclose cur_studeallocate cur_stu
```
