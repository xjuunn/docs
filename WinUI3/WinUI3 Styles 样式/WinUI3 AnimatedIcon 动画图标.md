# WinUI3 AnimatedIcon 动画图标

```xml
<Button PointerEntered="Button_PointerEntered" PointerExited="Button_PointerExited" Width="75">
    <AnimatedIcon x:Name="SearchAnimatedIcon">
        <AnimatedIcon.Source>
            <animatedvisuals:AnimatedFindVisualSource/>
        </AnimatedIcon.Source>
        <AnimatedIcon.FallbackIconSource>
            <SymbolIconSource Symbol="Find"/>
        </AnimatedIcon.FallbackIconSource>
    </AnimatedIcon>
</Button>
```

```csharp
private void Button_PointerEntered(object sender, PointerRoutedEventArgs e)
{
    AnimatedIcon.SetState(this.SearchAnimatedIcon, "PointerOver");
}

private void Button_PointerExited(object sender, PointerRoutedEventArgs e)
{
    AnimatedIcon.SetState(this.SearchAnimatedIcon, "Normal");
}
```

![Untitled](WinUI3%20AnimatedIcon%20%E5%8A%A8%E7%94%BB%E5%9B%BE%E6%A0%87%20abcaa4f863ff4bd68745b58f185e19ca/Untitled.png)

```xml
<NavigationView>
    <NavigationView.MenuItems>
        <NavigationViewItem Content = "Game Settings">
            <NavigationViewItem.Icon>
                <AnimatedIcon x:Name='AnimatedIcon'>
                    <AnimatedIcon.Source>
                        <animatedvisuals:AnimatedSettingsVisualSource/>
                    </AnimatedIcon.Source>
                    <AnimatedIcon.FallbackIconSource>
                        <FontIconSource FontFamily="Segoe MDL2 Assets" Glyph="&#xE713;"/>
                    </AnimatedIcon.FallbackIconSource>
                </AnimatedIcon>
            </NavigationViewItem.Icon>
        </NavigationViewItem>
    </NavigationView.MenuItems>
</NavigationView>

```

![Untitled](WinUI3%20AnimatedIcon%20%E5%8A%A8%E7%94%BB%E5%9B%BE%E6%A0%87%20abcaa4f863ff4bd68745b58f185e19ca/Untitled%201.png)
