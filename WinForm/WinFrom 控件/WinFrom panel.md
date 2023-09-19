# WinFrom panel

```C#
 private void btnNameCheck_Click(object sender, EventArgs e){ 
     this.pnlMain.Controls.Clear();    
     //初始化主panel     
     NameRule nr = new NameRule();     
     // 实例化要在pnlMain里显示的form(NameRule是新建的一个form)  
     nr.TopLevel = false;            
     //设置属性       
     nr.Show();                      
     //显示form          
     this.pnlMain.Controls.Add(nr);     
     //把from添加到pnlMain里}
```
