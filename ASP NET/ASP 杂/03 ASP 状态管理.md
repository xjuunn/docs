# ASP 状态管理

- cookie储存到浏览器里面，每个用户独有
- Session储存信息 每个用户独有，只要通信断开，服务端session销毁
- Application 所有用户共享

### cookie

1. Request使用 Response创建
   
    > 创建：Response.Cookies[“MyCookie”].Value = “OK”;
    > 
    > 
    > 使用：Request
    > 
    > ```
    > if(Request.Cookise["flag"]==null){  Response.Cookies["flag"].Value="yes";      Response.Cookies["flag"].Expires = DateTime.Now.AddSSconds(10);  }
    > ```
    > 
2. Session

```C#
//Session的创建
Session["UserInfo"]="";
Response.Redict(url);
//Session的使用   在另一个页面接收数据
if(Session["UserInfo"]!=null){
    User user = Session["UserInfo"] as User;  
    lblInfo.Text = user.UserType;
}
```

1. Application
- 找到Global.asax，项目启动时要执行的，

```C#
Application["online"]=0;
void Session_Start(object sender, EventArgs e) 
{         
    Application.Lock();    
    Application["online"] = (int)Application["online"] + 1;   
    Application.UnLock();     
}   
void Session_End(object sender, EventArgs e)  
{            
    Application.Lock();        
    Application["online"] = (int)Application["online"] - 1;   
    Application.UnLock();  
}
```

- `lblInfo.Text=$"当前在线人数:{Application["online"].ToString()}"`
- 销毁session Web.config中
  
    ```
    <sessionState timeout="1"></sessionState>
    ```
