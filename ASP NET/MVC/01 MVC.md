# MVC

三层架构原则：约定大于配置

1. 约定1：Controllers Models Views 分别约定放置控制器文件 模型文件 视图文件
2. 约定2：Controllers中的某个Controller对应的Views目录下的一个文件夹，对应规则：Controller前面的名称对应文件夹名称。
3. 约定3：某个Controller文件中的一个Action(返回View)对应Views文件夹下的某个文件夹下的某个视图。
4. 约定4：视图文件加载前，先执行Views目录下的_ViewStart

>   MVC 要求所有控制器文件的名称以Controller结尾

MVC项目运行起来后，访问路径是控制器中的Action，然后通过Action渲染View视图

![image-20230227144046416](imgs/image-20230227144046416.png)