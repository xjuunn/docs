# WinUI3 Reveal Focus 显示焦点

```xml
<Application FocusVisualKind="HighVisibility"/>
```

![Untitled](WinUI3%20Reveal%20Focus%20%E6%98%BE%E7%A4%BA%E7%84%A6%E7%82%B9%20fb945ab9843b498dadeca859cd46275e/Untitled.png)

![Untitled](WinUI3%20Reveal%20Focus%20%E6%98%BE%E7%A4%BA%E7%84%A6%E7%82%B9%20fb945ab9843b498dadeca859cd46275e/Untitled%201.png)

```xml
<Grid.Resources>
          <SolidColorBrush x:Key="SystemControlFocusVisualPrimaryBrush" Color="#FFFFFFFF" />
          <SolidColorBrush x:Key="SystemControlFocusVisualSecondaryBrush" Color="#FF000000" />
</Grid.Resources>
<Button Width="100" Height="100"
          FocusVisualPrimaryThickness="2"
          FocusVisualSecondaryThickness="1"
          FocusVisualMargin="-3"
          FocusVisualPrimaryBrush="{StaticResource SystemControlFocusVisualPrimaryBrush}"
          FocusVisualSecondaryBrush="{StaticResource SystemControlFocusVisualSecondaryBrush}" />
```

![Untitled](WinUI3%20Reveal%20Focus%20%E6%98%BE%E7%A4%BA%E7%84%A6%E7%82%B9%20fb945ab9843b498dadeca859cd46275e/Untitled%202.png)
