# SQL 事务

## 事务

将多个需要同时成功的操作打包到一起，让这些操作，要不同时成功，要不同时失败 * 原子性：事务中的所有操作，要不都成功，要不都取消 rollback * 一致性 * 隔离性：事务之间互相隔离不影响。 * 持久性：事务执行成功之后，数据永久生效。 如果出现错误，将整个事务撤销，rollback 如果执行成功，将整个事务提交，commit ~~~ sql set xact_abort on – 设置事务的整体回滚 begin transaction – 事务开始

if @@error=0 – 表示执行成功 commit else rollback ~~~

```sql
set xact_abort on  --设置事务的整体回滚begin transaction   --事务开始insert into 课程 values('101012','网页设计',null,72,null)insert into 课程 values('101016','C#',null,72,null)if @@ERROR =0  --表示执行成功  commitelse  rollback
```
