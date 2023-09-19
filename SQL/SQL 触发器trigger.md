# SQL 触发器trigger

## 触发器trigger

触发器是一种对象，能实现特定的功能，由若干代码组成

触发器不需要调用，没有参数。触发器由动作触发，代码自动执行 数据表级触发器： * insert触发器 * update触发器 * delete触发器 数据库级触发器：(on database) * create_table * drop_table 实现功能：当删除某个学生时，该学生的成绩记录同时被删除

```sql
create trigger delscore on 学生 after deleteasbegin    declare @stuno char(10)    select @stuno=学号    from deleted    delete from 成绩 where 学号=@stunoend--  --delete from 学生 where 学号='101010231'
```

deleted是一个临时表，当执行数据删除操作时，deleted临时表会生效

1. 表的结构与操作的数据表结构完全一致
2. 表的数据始终只保存正在被删除的一条记录

inserted临时表，当执行数据录入操作时，inserted临时表会生效

1. 表的结构与操作的数据表完全一致
2. 表的数据始终只保存正在被添加的一条数据

系统中将update操作动作分解成两步

1. 删除旧的数据：deleted
2. 添加新的数据：inserted

实现功能：当修改某个学生的学号时，同步修改成绩表中的学号

```sql
create trigger updatesno on 学生 after updateasbegin    declare @oldstuno char(10)    declare @newstuno char(10)    select @oldstuno = 学号 from deleted    select @newstuno = 学号 from inserted    update 成绩 set 学号=@newstuno where 学号=@oldstunoend
```

### 数据保护

[[Pasted image 20220528151128.png]]
