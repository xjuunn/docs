# WinUI3 Slider 滑块

```xml
<Slider AutomationProperties.Name="simple slider" Width="200"/>
```

![Untitled](WinUI3%20Slider%20%E6%BB%91%E5%9D%97%2070e6e050733d47a5871feb640e3a815c/Untitled.png)

# 控制范围

```xml
<Slider Width="200" Minimum="500" Maximum="1000" StepFrequency="10"
        SmallChange="10" LargeChange="100" Value="800" />
```

# 带有标记

```xml
<Slider AutomationProperties.Name="Slider with ticks" TickFrequency="10" TickPlacement="Outside" />
```

# 纵向

```xml
<Slider AutomationProperties.Name="vertical slider" Width="100" Orientation="Vertical"
    TickFrequency="10" TickPlacement="Outside" Maximum="50" Minimum="-50"/>
```

# 属性

- width 宽度
- Minimum 最小值
- Maximum 最大值
- StepFrequency 步进距离
- SmallChange 最小变化量
- LargeChange 最大变化量
- Value 值
- TickFrequency 刻度频率
- TickPlacement 刻度位置     Outside
- Orientation 方向    Vertical 纵向
