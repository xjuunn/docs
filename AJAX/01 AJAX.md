# 01 AJAX

## AJAX

AJAX:Asynchronous JavaScript And XML ，就是异步的js和XML

通过AJAX可以在浏览器中向服务器发送异步请求，最大的优势：无刷新获取数据。

AJAX不是新的编程语言，而是一种将现有的标准组合在一起使用的新方式。

### XML

XML可扩展标记语言

XML被设计用来传输和储存数据。

XML和HTML类似，不同的是，HTML中都是预定义的标签，而XML中没有预定义标签，全都是自定义标签，用来表示一些数据。

不过现在已经可以被json替代了

### AJAX的优点

1. 可以无需刷新页面与服务器端进行通信
2. 允许根据用户事件来更新部分页面内容

### AJAX的缺点

1. 没有浏览记录，不能回退
2. 存在跨域问题（同源）
3. SEO不友好

### 响应报文

> 响应行：HTTP/1.1 200 OK
> 
> 
> 响应头：Content-Type: text/html;charset=utf-8
> 
> ​ Content-length:2048
> 
> ​ Content-encoding:gzip
> 
> 响应体：HTML内容
> 

### 前期准备

node

```jsx
const express = require('express');
const app = express();
app.get('/server',(req,res)=>{
    response.setHeader('Access-Control-Allow-Origin','*');
    response.send("hellow AJAX");
})
app.listen(8080,()=>{
    console.log('服务器已启动');
})
```

### 基本操作

js

```jsx
//获取button元素
const btn = document.getElementsByTagName('button')[0];
const result = document.getElemntById('result');
//绑定事件
btn.onclick = function(){
    //1. 创建对象
    const xhr = new XMLHttpRequest();
    //2. 初始化 设置请求方法和url
    xhr.open('GET','http://127.0.0.1:8080/server');
    //设置请求头 xhr.setRequestHeader('',''); 
    //3. 发送
    xhr.send();//post请求的参数卸载send()方法中
    //4. 事件绑定 处理服务端返回的结果
    xhr.onreadystatechange = function(){
        if(xhr.readState==4)
{            if(xhr.status>=200 && xhr.status<300){
                //响应 
               //console.log(xhr.status);//状态码 
               //console.log(xhr.statusText);//状态字符串
                //console.log(xhr.getAllResponseHeaders());//所有响应头
                //console.log(xhr.response);//响应体
                // 设置result的文本 
               result.innerHTML。response;
            }else{
            }
        }
    }}
```

### JSON数据处理

当后端需要向前端传一个对象时，需要将对象转换为json格式

```jsx
const data = {
    name:'abcd'
};
let str = JSON.stringify(data);response.send(str);
```

js

方法一，手动对数据转化

```jsx
let data = JSON.parse(xhr.response);
console.log(data.name);
```

方法二，设置响应体数据类型

```jsx
xhr.responseType = 'json';
console.log(xhr.response.name);
```
