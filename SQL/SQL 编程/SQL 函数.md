# SQL 函数

### 函数

### 数学函数

- rand()随机数
- round(数字，精度)

### 字符串函数

- left(‘abcd3’,3)左字符数
- len(‘abcd3’)字符串长度
- lower(‘abcd3’)转换为小写
- upper(‘abcd3’)转换为大写
- replace(‘aabbccdd’,’a’,’z’)把‘a’替换为‘z’
- reverse(‘abcd’)倒序输出
- substring(‘abcdefg’,2,3)提取第2位开始取3个字符->bcd

### 日期函数

- dateadd()基于日期向后推迟指定日期
    
    > select dateadd(year,1,getdate())当前日期推迟一年
    > 
- datediff(day,’2002-1-1’,getdate())返回两个日期之间的间隔差值

### 数据类型转换

- cast(‘111’ as int)字符串转换为整数
- convert(int,’111’)字符串转换为整数
