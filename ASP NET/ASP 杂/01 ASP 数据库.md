# ASP 数据库

### 数据库

```C#
using System.Data.SqlClient;
string sqlinfo = "server=.;database=aspsql;Integrated Security=true";
SqlConnection connection = new SqlConnection(conStr);connection.Open();
string sql = "";
//sql命令SqlCommand cmd = new SqlCommand(sql,connection);
int resule = cmd.ExecuteNonQuery();
//增删改都用这个方法
if(resule>0){
    //添加成功
}
```

> string sql = “insert into userInfo(用户名,密码,用户类型,邮箱,手机号,年龄,家乡)”+ $“values(‘{txtUserName.Text}’, ‘{txtPassword.Text}’, ‘{ddlUserType.SelectedItem.Text}’, ‘{txtMail.Text}’, ‘{txtPhone.Text}’, ‘{txtAge.Text}’, ‘{ddlUserHome.SelectedItem.Text}’)”;
> 

### 删除

```
//RowDeletingstring id = e.Keys["id"].Tostring()://添加DataKeyNames属性
```
