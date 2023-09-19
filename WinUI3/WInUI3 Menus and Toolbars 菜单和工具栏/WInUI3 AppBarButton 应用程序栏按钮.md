# WInUI3 AppBarButton 应用程序栏按钮

```xml
<AppBarButton Icon="Like" Label="SymbolIcon" Click="AppBarButton_Click"/>
```

![Untitled](WInUI3%20AppBarButton%20%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F%E6%A0%8F%E6%8C%89%E9%92%AE%208ecbbf3cdd9f4e14ac4ff168ba26ea39/Untitled.png)

# 位图图标

```xml
<AppBarButton Label="BitmapIcon" Click="AppBarButton_Click">
    <AppBarButton.Icon>
        <BitmapIcon UriSource="ms-appx:///Assets/Slices2.png"/>
    </AppBarButton.Icon>
</AppBarButton>
```

![Untitled](WInUI3%20AppBarButton%20%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F%E6%A0%8F%E6%8C%89%E9%92%AE%208ecbbf3cdd9f4e14ac4ff168ba26ea39/Untitled%201.png)

# 字体

```xml
<AppBarButton Label="FontIcon" Click="AppBarButton_Click">
    <AppBarButton.Icon>
        <FontIcon FontFamily="Candara" Glyph="Σ"/>
    </AppBarButton.Icon>
</AppBarButton>
```

![Untitled](WInUI3%20AppBarButton%20%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F%E6%A0%8F%E6%8C%89%E9%92%AE%208ecbbf3cdd9f4e14ac4ff168ba26ea39/Untitled%202.png)

# Path Icon

```xml
<AppBarButton Label="PathIcon" Click="AppBarButton_Click">
    <AppBarButton.Content>
        <Viewbox Stretch="Uniform">
            <PathIcon Data="F1 M 20,20L 24,10L 24,24L 5,24"/>
        </Viewbox>
    </AppBarButton.Content>
</AppBarButton>
```

![Untitled](WInUI3%20AppBarButton%20%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F%E6%A0%8F%E6%8C%89%E9%92%AE%208ecbbf3cdd9f4e14ac4ff168ba26ea39/Untitled%203.png)

# 定义快捷键

```xml
<AppBarButton Icon="Save" Label="Save" Click="AppBarButton_Click">
    <AppBarButton.KeyboardAccelerators>
        <KeyboardAccelerator Modifiers="Control" Key="S"/>
    <AppBarButton.KeyboardAccelerators/>
</AppBarButton>
```

![Untitled](WInUI3%20AppBarButton%20%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F%E6%A0%8F%E6%8C%89%E9%92%AE%208ecbbf3cdd9f4e14ac4ff168ba26ea39/Untitled%204.png)
