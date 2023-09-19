# WinUI3 ToolTip 工具提示

# 鼠标悬浮提示文本

```xml
<Button Content="Button with a simple ToolTip." ToolTipService.ToolTip="Simple ToolTip"/>
```

![Untitled](WinUI3%20ToolTip%20%E5%B7%A5%E5%85%B7%E6%8F%90%E7%A4%BA%20e784c0439372421b956b557b360af9b3/Untitled.png)

# 文字提示

```xml
<TextBlock Text="TextBlock with an offset ToolTip.">
    <ToolTipService.ToolTip>
        <ToolTip Content="Offset ToolTip." VerticalOffset="-80"/>
    </ToolTipService.ToolTip>
</TextBlock>
```

# 图片提示

```xml
<Image Source="/Assets/SampleMedia/cliff.jpg" Width="400" Height="266">
    <ToolTipService.ToolTip>
        <ToolTip Content="Non-occluding ToolTip." PlacementRect="0,0,400,266"/>
    </ToolTipService.ToolTip>
</Image>
```
