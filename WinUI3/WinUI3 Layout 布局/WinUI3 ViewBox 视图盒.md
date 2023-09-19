# WinUI3 ViewBox 视图盒

```xml
<Viewbox Height="165" Width="165" Stretch="Uniform" StretchDirection="DownOnly">
    <Border BorderBrush="Gray" BorderThickness="15">
        <StackPanel Background="DarkGray">
            <StackPanel Orientation="Horizontal">
                <Rectangle Fill="Blue" Height="10" Width="40"/>
                <Rectangle Fill="Green" Height="10" Width="40"/>
                <Rectangle Fill="Red" Height="10" Width="40"/>
                <Rectangle Fill="Yellow" Height="10" Width="40"/>
            </StackPanel>
            <Image Source="ms-appx:///Assets/Slices.png"/>
            <TextBlock Text="This is text." HorizontalAlignment="Center"/>
        </StackPanel>
    </Border>
</Viewbox>
```

![Untitled](WinUI3%20ViewBox%20%E8%A7%86%E5%9B%BE%E7%9B%92%2069c4dfb9eaae4aa4a3513d8a0c124561/Untitled.png)
