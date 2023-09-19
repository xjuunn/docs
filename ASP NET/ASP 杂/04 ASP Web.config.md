# ASP Web.config

`web.config` 文件由 IIS 和 `web.config`读取，用于使用 IIS 配置已托管的应用。

Web.config是XML文件，用来储存Asp.net Web应用程序的配置信息，包括**数据库**连接字符串、身份验证等，可以出现在ASP.net Web应用程序服务器上的任何目录中，每一个Web.config讲配置设置应用道它所在的目录及虚拟子目录下，子目录中的设置可以随意重写或修改在父目录中置顶的设置。**该文件不需要重启服务器就可以生效。**

#### 当读取某个节点或是节点组信息时：

1.   如果当前页面所在目录下存在web.config文件，查看是否存在所查找的节点名称，如果存在，则返回结果停止查找。
2.   如果当前页面所在目录下不存在web.config文件或文件中不存在该节点名，则查找它的上一级目录，知道查找到网站的根目录。
3.   如果网站根目录下不存在web.config或者文件中不存在节点名，则在`Framework`文件的web.config中查找
     1.   `%windir%/Microsoft.NET/Framework/v2.0.50727/CONFIG/web.config`
     2.   `%windir%/Microsoft.NET/Framework/v2.0.50727/CONFIG/machine.config` 	
4.   如果仍然没有，则返回`null`

所以当某个页面需要进行特殊的配置时，只需要在当前文件夹添加web.config文件，进行相应的配置。

## 配置数据库连接字符串

web.config,在configuration中添加

~~~xml
<connectionStrings>
		<add name="connStr" connectionString="Server=localhost;Database=Works;Trusted_Connection=True"/>
</connectionStrings>
~~~

获取连接字符串，添加引用

~~~C#
string connStr = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
~~~





