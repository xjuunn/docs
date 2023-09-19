# WinUI3 AppBarToggleButton 应用程序栏切换按钮

```xml
<AppBarToggleButton Icon="Shuffle" Label="SymbolIcon" Click="AppBarButton_Click"/>
```

![Untitled](WinUI3%20AppBarToggleButton%20%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F%E6%A0%8F%E5%88%87%E6%8D%A2%E6%8C%89%E9%92%AE%204be6e54f3e974175acdb1be2ae3d0621/Untitled.png)

# 位图

```xml
<AppBarToggleButton Label="BitmapIcon" Click="AppBarButton_Click">
    <AppBarToggleButton.Icon>
        <BitmapIcon UriSource="ms-appx:///Assets/Slices2.png"/>
    </AppBarToggleButton.Icon>
</AppBarToggleButton>
```

# 字体

```xml
<AppBarToggleButton Label="FontIcon" Click="AppBarButton_Click">
    <AppBarToggleButton.Icon>
        <FontIcon FontFamily="Candara" Glyph="Σ"/>
    </AppBarToggleButton.Icon>
</AppBarToggleButton>
```

# 三个状态的切换按钮

```xml
<AppBarToggleButton Label="PathIcon" Click="AppBarButton_Click" IsThreeState="True">
    <AppBarToggleButton.Icon>
        <PathIcon Data="F1 M 20,20L 24,10L 24,24L 5,24"/>
    </AppBarToggleButton.Icon>
</AppBarToggleButton>
```
