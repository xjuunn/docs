# SQL 流程控制

### 循环

### while

```sql
while @i<=100    begin        ```    end
```

```sql
-- 从1加到100declare @i int ,@sum int ;set @i = 1;set @sum = 0;while @i<=100    begin        set @sum=@i+@sum        set @i=@i+1;    endprint @sum
```

### 条件

### if

```sql
if @avg>=    ```else    ```
```

```sql
declare @avg int ;
select @avg=avg(成绩) from 成绩 where 学号='1101010101'if @avg>=90    print '成绩优秀'else    if @avg>=80        print '成绩良好'    else        if @avg>=70            print '成绩中等'        else            if @avg>=60                print '成绩一般'            else                print '成绩较差'
```
