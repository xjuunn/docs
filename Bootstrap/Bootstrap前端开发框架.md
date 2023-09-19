# Bootstrap前端开发框架

## Bootstrap前端开发框架

### Bootstrap简介

Bootstrap来自Twitter（推特），是目前最受欢迎的前端框架。Bootstrap是基于HTML，CSS和JS的，它简洁灵活，使得Web开发更快捷

### 优点

- 标准化的html+css编码规范
- 提供了一套简洁、直观、强悍的组件
- 有自己的生态圈，不断的更新迭代
- 让开发更简单，提高了开发效率

### Bootstrap使用

1. 创建文件夹结构（bootstrap文件夹）
2. 创建html骨架结构
3. 引入相关样式文件
4. 书写内容

html的骨架结构

```html
<!DOCTYPE html><html>  
    <head>  
        <title>Bootstrap 模板</title>  
        <meta name="viewport" content="width=device-width, initial-scale=1.0">   
        <!-- 引入 Bootstrap -->  
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">  
        <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->      
        <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->   
        <!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>    
		<![endif]-->  
    </head> 
    <body>      
        <h1>Hello, world!</h1>   
        <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->  
        <script src="https://code.jquery.com/jquery.js"></script>   
        <!-- 包括所有已编译的插件 -->    
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
```

### 布局容器

Bootstrap需要为页面内容和栅格系统包裹一个.container容器，Bootstarp预先定义好了这个类，叫.container，它提供了两个作此用处的类。

### 1. .container类

- 响应式布局的容器 固定宽度
- 大屏（>=1200px）宽度为1170px
- 中屏（>=992px）宽度定为970px
- 小屏（>=768px）宽度定为750px
- 超小屏（100%）

### 2. .container-fluid类

- 流式布局容器100%宽度
- 占据全部视口（viewport）的容器
- 适合于单独做移动端开发
