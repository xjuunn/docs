# ASP 常用对象

### Page

AutoPostBack自动回传

IsPostBack 是否回传，区分于页面第一次加载

```C#
if(!isPostBack)第一次加载
```

Page_Load页面加载事件

Page_Init 页面初始化 只在页面首次加载时执行 ，回发不会执行

Init 比 Load先执行

### Response

Response.Write(“”);html

Response.Redirct(“”); 跳转 Response.Redirect(“Personal.aspx”);

```C#
        protected void Button1_Click(object sender, EventArgs e)
        {
        Response.Redirect("Response.aspx?val="+tb1.Text); 
        }
```

### Request

Request接收

```C#
if (Request.QueryString["val"]!=null){    tb1.Text = Request.QueryString["val"].ToString();}
```

### Server

```
Server.Transfer(url)
```

> Response.Redirct()跳转 不等页面执行结束
> 
> 
> Server.Transfer()跳转，等待当前页面执行完毕
> 
> Server.Transfer()不能跨服务器跳转
> 

```C#
if(Request.QueryString["userType"]!=null&&Request.QueryString["username"]!=null){
    lblInfo.Text = $"{Request.QueryString["usertype"]}"
}
```
