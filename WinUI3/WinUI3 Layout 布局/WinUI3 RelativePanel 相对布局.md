# WinUI3 RelativePanel 相对布局

```xml
<RelativePanel  Width="300">
    <Rectangle x:Name="Rectangle1" Fill="Red" Height="50" Width="50"/>
    <Rectangle x:Name="Rectangle2" Fill="Blue" Height="50" Width="50" RelativePanel.RightOf="Rectangle1" Margin="8,0,0,0"/>
    <Rectangle x:Name="Rectangle3" Fill="Green" Height="50" Width="50" RelativePanel.AlignRightWithPanel="True"/>
    <Rectangle x:Name="Rectangle4" Fill="Yellow" Height="50" Width="50" RelativePanel.Below="Rectangle3" RelativePanel.AlignHorizontalCenterWith="Rectangle3" Margin="0,8,0,0"/>
</RelativePanel>
```

![Untitled](WinUI3%20RelativePanel%20%E7%9B%B8%E5%AF%B9%E5%B8%83%E5%B1%80%20ce5174f7d1f9407ea705784c1b521057/Untitled.png)

