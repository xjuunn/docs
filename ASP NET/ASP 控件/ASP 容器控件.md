# ASP 容器控件

### 容器控件

### Panel控件

显示隐藏 pnlMore.Visible = true;

### PlaceHolder

代码生成控件

> TextBox txtCreate = new TextBox();
> 
> 
> txtCreate.Text = “123456”;
> 
> txtCreate.TextMode = TextBoxMode.Password;
> 
> PlaceHolder1.Controls.Add(txtCreate);//添加控件
> 

### HiddenField

隐藏在源码中的数据

### FileUpload

文件上传

> string path = “~/upload/”+fuImg.FileName;
> 
> 
> fuImg.SaveAs(Server.MapPath(path));
>
