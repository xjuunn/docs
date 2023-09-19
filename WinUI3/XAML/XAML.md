# XAML

[XAML依赖属性 (vue5.com)](http://www.vue5.com/xaml/xaml_dependency_properties.html)

XAML代表可扩展应用程序标记语言。它是基于XML的简单的声明性语言。

*   XAML很容易创建，初始化和设置具有层次关系的对象的属性。
*   主要用于设计GUI
*   也可以用于其他目的，例如Workflow Foundation中声明工作流。

~~~ xaml
<Window x:Class = "Resources.MainWindow" 
   xmlns = "http://schemas.microsoft.com/winfx/2006/xaml/presentation" 
   xmlns:x = "http://schemas.microsoft.com/winfx/2006/xaml" Title = "MainWindow" Height = "350" Width = "525"> 
	
   <Grid> 
         
   </Grid> 
	
</Window> 
~~~

| <window           | 它是根的开放对象元素或容器                       |
| ----------------- | ------------------------------------------------ |
| x:Class=“”        | 它是将标记连接到其中定义的部分类代码的部分类声明 |
| xmlns=“http://”   | 映射WPF客户端/框架的默认XAML命名空间             |
| xmlns=x=“http://” | XAML命名空间，用于将其映射到x:prefix的XAML语言   |
| <Grid></Grid>     | 启动和关闭网格对象的标签                         |
| </window>         | 关闭对象元素                                     |

## 对象元素的语法规则

XAML的语法规则于XML类似。XAML是有效的XML文件，但XML不一定是有效的XAML文件。因为在XML中，属性值必须是字符string，而在XAML中，它可以是不同的对象，称为Property元素语法。

Object元素的语法以左尖括号<kbd>></kbd>开始，后面跟着对象的名称，例如Button

定义该对象元素的一些属性

对象元素必须用<kbd>/></kbd>关闭

>   没有子元素的对象
>
>   ~~~ xaml
>   <Button/>
>   ~~~
>
>   具有某些属性的对象元素
>
>   ~~~ xaml
>   <Button Content="ClickMe" Height="30" Width="60"/>
>   ~~~
>
>   定义属性的替代语法
>
>   ~~~ xaml
>   <Button>
>   	<Button.Content>ClickMe</Button.Content>
>       <Button.Height>30</Button.Height>
>       <Button.Width>60</Button.Width>
>   </Button>
>   ~~~
>
>   具有子元素的对象
>
>   ~~~ xaml
>   <StackPanel Orientation="Horizontal">
>   	<TextBlock Text="Hello"/>
>   </StackPanel>
>   ~~~
>
>   

## 用C#代码修改界面

~~~ C#
public partial class MainWindow : Window {
	
      public MainWindow() { 
		
         InitializeComponent();  
         // Create the StackPanel 
         StackPanel stackPanel = new StackPanel();
         this.Content = stackPanel; 
			
         // Create the TextBlock 
         TextBlock textBlock = new TextBlock(); 
         textBlock.Text = "Welcome to XAML Tutorial"; 
         textBlock.Height = 20;
         textBlock.Width = 200; 
         textBlock.Margin = new Thickness(5); 
         stackPanel.Children.Add(textBlock);  
			
         // Create the Button 
         Button button = new Button(); 
         button.Content = "OK"; 
         button.Height = 20; 
         button.Width = 50; 
         button.Margin = new Thickness(20); 
         stackPanel.Children.Add(button); 
      } 
   } 
~~~

## XAML积木

### 对象

XAML是一种典型的声明性语言，可以创建和实例化对象。即需要创建那些对象以及在执行程序之前如何初始化它们。对象可以是

*   容器（堆叠面板，底座面板）
*   UI元素/控件（按钮，文本框等）
*   资源字典

### 资源

资源通常是与某些对象相关联的定义，将本地储存数据储存到控件或当前窗口或全局应用程序的能力。

### 款式

XAML框架提供了个个性化和定制化的程序外观的几种策略。样式使我们能够灵活地设置对象地某些属性，并在多个对象之间重复使用这些特定地设置以保持一致地外观。

*   在样式中，只能设置对象地现有属性，如高度、宽度、字体大小等。
*   只能指定控件的默认行为。
*   可以将多个属性添加到样式中。

### 模板

模板描述了控件的整体外观。对于每个控件，都有与之相关联的默认模板，该模板给出该控件的外观。在XAML中，可以自定义控件的视觉行为和视觉外观时时轻松创建自己的模板。

### 动画与变形

Windows运行时间内的动画可以通过创建交互的移动来改善XAML应用程序。可以通过使用Windows运行时动画库中的动画轻松继承XAML应用程序中的交互外观。

使用动画

*   以增强用户界面使其更具吸引力
*   吸引用户注意改变

### 控件

XAML用户界面框架提供了一个广泛的控件库，可以支持WIndows的UI开发。他们中的一些具有视觉表示。如Button、Textbox、TextBlock等；而其他控件则用作其他控件或内容的容器，例如图像。所有的XAML控件都是从System.Windows.Controls.Control继承的。

### 布局

控件的布局对于应用程序的可用性是非常重要和关键。需要在应用程序中安排一组GUI元素。选择布局面板时要考虑一些重点

*   子元素的位置
*   子元素的大小
*   重叠的子元素分层

当应用程序在不同的屏幕分辨率上被使用时，控件的固定像素布置不起作用。XAML提供了丰富的内置布局面板，以适当的方式排列GUI元素。

##### StackPanel

堆栈面板，基于取向属性，子元素可以以水平方式或垂直方式排列成一行。

##### WrapPanel

基于orientation属性，子元素按照从左到右或从上到下的顺序排列。

##### DockPanel

定义了一个区域，以排列相对于彼此的子元素，水平或垂直。使用DockPanel，可以使用Dock属性将子元素停靠在顶部，底部，左侧，右侧和居中。

##### CanvasPanel

画布面板是基本布局面板，其中可以使用相对于画布任意一侧（例如左右顶部和底部）的坐标显式定位子元素。

##### GridPanel

网格面本提供了一个由行和列组成的灵活区域。在网格中，子元素可以以表格的形式排列。

## 事件处理

XAML中事件的一半概念类似于其他流行的编程语言中的事件，所有的控件都会公开某些事件。

当事件发生时，应用程序将被通知，并且程序可以对它们做出反应，例如，关闭按钮用于关闭对话框。

*   Click
*   MouseDown
*   MouseInput
*   MouseLeave
*   MouseUp
*   KeyDown
*   KeyUp

~~~ xaml
<Button Click="OnClick"/>
~~~

~~~ C#
private void OnClick(object sender,RoutedEventArgs e){
    MessageBox.Show("按钮被点击了");
}
~~~

## 数据绑定

数据绑定是XAML应用程序中的一种机制，为使用部分类显示和与数据交互的Windows Runtime Apps提供了一种简单的方法。但是数据的管理与此机制中的数据显示方式完全不同。

数据绑定允许用户界面上的UI元素和数据对象之间的数据流。当绑定建立并且数据或业务模型更改时，他将自动将跟新反映到UI元素，反正亦然。亦可以绑定。而不是半丁标准数据源，而是绑定到页面上的另一个元素。数据绑定可以由两种类型：

*   单向数据绑定
*   双向数据绑定

### 单项数据绑定

在单项数据绑定中，数据从其源（即保存数据的对象）绑定到其目标（显示数据的对象）。

### 双向绑定

用户通过用户界面修改数据，并在源中更新数据。如果在用户查看视图时源更改，则 需要更新视图。

