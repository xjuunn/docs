# js获取时间

```jsx
var time = new Date();
time.getYear(); //获取当前年份
time.getFullYear(); //获取完整的年份(4位,1970-???)
time.getMonth(); //获取当前月份(0-11,0代表1月)
time.getDate(); //获取当前日(1-31)
time.getDay(); //获取当前星期X(0-6,0代表星期天)
time.getTime(); //获取当前时间(从1970.1.1开始的毫秒数)
time.getHours(); //获取当前小时数(0-23)
time.getMinutes(); //获取当前分钟数(0-59)
time.getSeconds(); //获取当前秒数(0-59)
time.getMilliseconds(); //获取当前毫秒数(0-999)
time.toLocaleDateString(); //获取当前日期
var mytime=time.toLocaleTimeString(); //获取当前时间
time.toLocaleString( ); //获取日期与时间
```

![Untitled](js%E8%8E%B7%E5%8F%96%E6%97%B6%E9%97%B4%209c519a4355154f8b8e59f5faf56842bd/Untitled.png)

![Untitled](js%E8%8E%B7%E5%8F%96%E6%97%B6%E9%97%B4%209c519a4355154f8b8e59f5faf56842bd/Untitled%201.png)

[(24条消息) 前端js获取当前时间的方法_学无止境super的博客-CSDN博客_前端获取当前时间](https://blog.csdn.net/qq_43693520/article/details/87900903)
