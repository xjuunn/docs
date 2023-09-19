# WinUI3 Implicit Transitions 渐变

# 透明度渐变

```xml
<!-- Automatically animate changes to Opacity -->
<Rectangle x:Name="rectangle" Width="50" Height="50" Opacity="0.5">
    <Rectangle.OpacityTransition>
        <ScalarTransition />
    </Rectangle.OpacityTransition>
</Rectangle>
```

```csharp
private void button_Click(object sender, RoutedEventArgs e)
{
    rectangle.Opacity = 1;
}
```

# 旋转

```xml
<!-- Automatically animate changes to Rotation -->
<Rectangle x:Name="rectangle" Width="50" Height="50" Rotation="0" >
    <Rectangle.RotationTransition>
        <ScalarTransition />
    </Rectangle.RotationTransition>
</Rectangle>
```

```csharp
private void button_Click(object sender, RoutedEventArgs e)
{
    rectangle.Rotation = 45;  // Clockwise, in degrees
}
```

# 缩放

```xml
<!-- Automatically animate changes to Scale -->
<Rectangle x:Name="rectangle" Width="50" Height="50" Scale="1,1,1" >
    <Rectangle.ScaleTransition>
        <Vector3Transition />
    </Rectangle.ScaleTransition>
</Rectangle>
```

```csharp
using System.Numerics;
private void button_Click(object sender, RoutedEventArgs e)
{
    rectangle.Scale = new Vector3(2, 2, 2);
}
```

# 位移

```xml
<!-- Automatically animate changes to Translation -->
<Rectangle x:Name="rectangle" Width="50" Height="50" Translation="0,0,0" >
    <Rectangle.TranslationTransition>
        <Vector3Transition />
    </Rectangle.TranslationTransition>
</Rectangle>
```

```csharp
using System.Numerics;
private void button_Click(object sender, RoutedEventArgs e)
{
    rectangle.Translation = new Vector3(200, 200, 200);
}
```

# 背景色

```xml
<ContentPresenter x:Name="BrushPresenter" Background="Blue" Width="50" Height="50">
    <ContentPresenter.BackgroundTransition>
        <BrushTransition />
    </ContentPresenter.BackgroundTransition>
</ContentPresenter>
```

```csharp
private void button_Click(object sender, RoutedEventArgs e)
{
    // Note that this is a new brush instance, not a new color on the same brush.
    if (HasBlueBackground(BrushPresenter))
    {
        BrushPresenter.Background = new SolidColorBrush(Yellow);
    }
    else
    {
        BrushPresenter.Background = new SolidColorBrush(Blue);
    }
}
```

# 夜间模式开关

```xml
<Grid x:Name="ThemeExampleGrid" Background="{ThemeResource ApplicationPageBackgroundThemeBrush}" >
    <Grid.BackgroundTransition>
        <BrushTransition />
    </Grid.BackgroundTransition>
    <StackPanel Margin="12" Spacing="6">
        <TextBlock Text="Lorem Ipsum" Style="{ThemeResource SubheaderTextBlockStyle}" />
        <TextBlock Text="The background of this grid animates when the theme changes." TextWrapping="WrapWholeWords" />
        <Button Content="Button" />
        <CheckBox Content="CheckBox" />
    </StackPanel>
</Grid>
```

```csharp
private void ThemeButton_Click(object sender, RoutedEventArgs e)
{
    ThemeExampleGrid.RequestedTheme = ThemeExampleGrid.RequestedTheme == ElementTheme.Dark ? ElementTheme.Light : ElementTheme.Dark;
}
```
