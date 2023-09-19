# SQL 多表查询

### 自然连接

```sql
select * from 学生,成绩where 学生.学号=成绩.学号    -- 筛选有效数据
```

### 内连接 inner join

```sql
select * from 学生 inner join 成绩 on 学生.学号=成绩.学号   -- 内连接执行效率高于自然连接之后进行筛选-- inner 是默认select * from 学生 join 成绩 on 学生.学号=成绩.学号
```

### 外连接 outer join

左外连接，右外连接

```sql
select *from 学生 left outer join 成绩 on 学生.学号=成绩.学号  -- 左外连接from 学生 left outer join 成绩 on 学生.学号=成绩.学号  -- 右外连接from 学生 full outer join 成绩 on 学生.学号=成绩.学号  -- 完全保留
```

- 左外连接 确保左表中的每条记录都会显示到最终结果中
