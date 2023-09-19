# WinFrom 基本控件1

### 常用控件

### 文本类控件

### 标签Label

[Untitled](WinFrom%20%E5%9F%BA%E6%9C%AC%E6%8E%A7%E4%BB%B61%2012c8537f9d8c4d659c29327355b4708f/Untitled%20Database%200f9b41b17d9f45ad99516d6aa33b5a81.csv)

[Untitled](WinFrom%20%E5%9F%BA%E6%9C%AC%E6%8E%A7%E4%BB%B61%2012c8537f9d8c4d659c29327355b4708f/Untitled%20Database%2031ff28a8bdd24d37a6c1826922915a12.csv)

```
lbltest.Text = "string";   //修改label的文字string str = lbltest.Text; //获取label的文字
```

### 输入框TextBox

[Untitled](WinFrom%20%E5%9F%BA%E6%9C%AC%E6%8E%A7%E4%BB%B61%2012c8537f9d8c4d659c29327355b4708f/Untitled%20Database%20e92368a92a3b444f80dc2b2cd827bedf.csv)

[Untitled](WinFrom%20%E5%9F%BA%E6%9C%AC%E6%8E%A7%E4%BB%B61%2012c8537f9d8c4d659c29327355b4708f/Untitled%20Database%203ae79641ca7a4181afc215ba379f580d.csv)

### 选择类控件

### 复选框CheckBox/单选框RadioButton

[Untitled](WinFrom%20%E5%9F%BA%E6%9C%AC%E6%8E%A7%E4%BB%B61%2012c8537f9d8c4d659c29327355b4708f/Untitled%20Database%20a0721747e79e490ab17b86934011b928.csv)

[Untitled](WinFrom%20%E5%9F%BA%E6%9C%AC%E6%8E%A7%E4%BB%B61%2012c8537f9d8c4d659c29327355b4708f/Untitled%20Database%2001ae84cfd68c43ae9bbdfe27b947fbb7.csv)

```
cbtest.Checked = true;//修改复选框的选中状态if (cbtest.Checked == true){}//对选中状态进行判断
```

> 单选框实现单选效果，需要在同一父容器中或者在同一组
> 

### 分组类控件

### Panel容器

[Untitled](WinFrom%20%E5%9F%BA%E6%9C%AC%E6%8E%A7%E4%BB%B61%2012c8537f9d8c4d659c29327355b4708f/Untitled%20Database%200b2522b608354fe7abe3694a47861643.csv)

**Panel的单页面切换**

```
private void btnNameCheck_Click(object sender, EventArgs e){        this.pnlMain.Controls.Clear();             //初始化主panel        NameRule nr = new NameRule();              // 实例化要在pnlMain里显示的form(NameRule是新建的一个form)        nr.TopLevel = false;                       //设置属性        nr.Show();                                 //显示form        this.pnlMain.Controls.Add(nr);            //把from添加到pnlMain里}
```

### 其他控件

### 通用对话框

### 消息对话框

### 文本对话框

### 普通对话框
