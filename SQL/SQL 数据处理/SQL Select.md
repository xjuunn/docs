# SQL Select

```sql
select *  -- 罗列的是最终要查询显示的内容into 表1   -- 表示将查询结果插入到表1中，表1 是新创建的表from 表    -- 从哪个数据表进行查询 ，可以是一个或多个where 字段1 = 值1  -- 用来限定查询条件group by 字段1     -- 分组统计having count(字段1) = 3    -- 分组结果的筛选条件order by 字段1    -- 对查询结果进行排序
```

### select *

```sql
select * -- 查询所有select 课程编号,课程名称  -- 查询列 顺序改变，显示结果顺序也改变select top 5 -- 显示前5行
```

> 查询成绩最高的记录
> 
> 
> select top 1 *
> 
> from 成绩
> 
> order by 成绩 desc * desc降序 默认升序*
> 
> 不一定准确 子查询
> 

> select year(getdate()) 获取当前日期
> 
> 
> 计算年龄
> 
> ```sql
> select year(getdate()) - year(出生日期) 年龄from 学生
> ```
> 
> 重命名方式：
> 
> 1. 加空格 name
> 2. as name
> 3. name = 。。。
> 
> 也可以对现有字段进行重命名
> 

> 统计学生人数
> 
> 
> ```sql
> select count(*) 人数from 学生
> ```
> 
> 结果 ： 人数：48
> 
> 计算平均年龄
> 
> ```sql
> select  avg(year(getdate()) - year(出生日期)) as 平均年龄from 学生
> ```
> 

### into

将查询结果存入新表

```sql
select *into 学生信息from 学生
```

创建一个空表

```sql
select *into 课程1from 课程where 学时=0  -- where 1=2
```

> 消除重复值
> 
> 
> select distinct 性别
> 
> from 学生
> 
> select count(distinct 学号)
> 

基本函数

- avg 平均值
- count 计数
- sum 求和
- max 最大值
- min 最小值

### case

1. `case 年级 when 2022 then '大一' when 2021 then ’大二‘ when 2020 then ’大三‘ when 2019 then ’大四’ end 年级`
2. `select 学号，课程编号， case  when 年级<=2021 and 年级 <= 2015 then ‘大一’ when 年级=2020 then '大二' end 年级`

### where

对表中数据的筛选过滤

having 是对统计结果筛选

```sql
sekect *from 学生where 性别='男' and year(出生日期)=1991
```

### 模糊查询

like % _

% :任意字符

_:单个字符

### escape 消除通配符的功能

like ‘%#_%’ escape ‘#’

### [] ^

like ‘%-0[1-6]-%’

查询出学号最后一位不是1-6的学生

```sql
like '%[^1-6]'
```

> 倒数第二位是1
> 
> 
> select * from 学生
> 
> where 学号 like ‘%1_’
> 

### group by

分组统计

```sql
select count(*) from 学生select 些别,count(*) from 学生 group by 性别
```

```sql
-- 查询出人数在10人以上的班级编号select 班级编号 from 学生group by 班级编号having count(*) >=10
```

- <=all
- any
- some
- exists 存在

### all

> 查询出分数最低的成绩记录 select * from 成绩 where 成绩<=all(select 成绩 from 成绩) <=all查最低 =all查最高
> 

### in

> 查询出有成绩的学生姓名 select 姓名 from 学生 where 学号 in ( select distinct 学号 from 成绩)
> 

### exists

> select 姓名 from 学生 where exists(select * from 成绩 where 学生.学号=学号) exists(子查询) 子查询能查询到结果，表示条件成立 查不到结果表示条件不成立
>
