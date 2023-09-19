# WinUI3 Button 按钮

```jsx
<Button x:Name="myButton">最基本的按钮</Button>
<Button Content="最基本的按钮2"/>
```

![Untitled](WinUI3%20Button%20%E6%8C%89%E9%92%AE%20f1ad40f6e1544403951bd8919bc466a5/Untitled.png)

# 带图标的按钮

```jsx
<Button Content="Button" Click="Button_Click" AutomationProperties.Name="Pie">
    <Image Source="/Assets/Slices.png" AutomationProperties.Name="Slice"/>
</Button>
```

# 高光按钮

```jsx
<Button Style="{StaticResource AccentButtonStyle}" Content="高光按钮" />
```

![Untitled](WinUI3%20Button%20%E6%8C%89%E9%92%AE%20f1ad40f6e1544403951bd8919bc466a5/Untitled%201.png)

# 属性

- content 按钮文本
- click 绑定点击事件
- MaxWidth 最大宽度，值没有单位
- margin 外边距
- style 样式
