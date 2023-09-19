# WinFrom 杂

- this.Hide(); 隐藏窗口 在Load事件里执行
- this.Show(); 显示窗口
- this.Close();只是关闭当前窗口，若不是主窗体，无法退出程序；若有托管线程（非主线程），也无法完全退出；Application.Exit();强制所有消息终止，退出所有窗体，若有托管线程（非主线程），无法完全退出Application.ExitThread();强制终止调用线程上的所有消息，同样面临其他线程无法正确退出的问题System.Envionment.Exit(0);一种最彻底的退出方式，强制退出，无残留。
- 

复制 .Copy();

剪切 .Cut();

粘贴 .Paste();

选中字的背景 .SelectionBackColor =

选中字的颜色 .SelectionColor =

新建文字 Font font = new Font(“黑体”,18);

拖入文件，属性设置为可以拖动

~~~ C#
private void Form1_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop))
            {
                string[] files = (string[])e.Data.GetData(DataFormats.FileDrop);
                FPath = files[0];
            }
        }
~~~

