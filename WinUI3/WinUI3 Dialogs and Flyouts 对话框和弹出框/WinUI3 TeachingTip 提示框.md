# WinUI3 TeachingTip 提示框

```xml
<Button Content="Show TeachingTip" Click="TestButtonClick1" />

<TeachingTip x:Name="ToggleThemeTeachingTip1"
    Target="{x:Bind ThemeButton}"
    Title="Change themes without hassle"
    Subtitle="It's easier than ever to see control samples in both light and dark theme!">
    <TeachingTip.IconSource>
        <SymbolIconSource Symbol="Refresh" />
    </TeachingTip.IconSource>
</TeachingTip>
```

```csharp
private void TestButtonClick1(object sender, RoutedEventArgs e)
{
    ToggleThemeTeachingTip1.IsOpen = true;
}
```

![Untitled](WinUI3%20TeachingTip%20%E6%8F%90%E7%A4%BA%E6%A1%86%2051d613ca98e24451ab39c797fb71ac8e/Untitled.png)

```xml
<Button Content="Show TeachingTip" Click="TestButtonClick2" />

<TeachingTip x:Name="ToggleThemeTeachingTip2"
	Title="Change themes without hassle"
	Subtitle="It's easier than ever to see control samples in both light and dark theme!"
	PreferredPlacement="Auto"
	PlacementMargin="20"
	IsLightDismissEnabled="True"
	ActionButtonClick="ToggleThemeTeachingTip2_ActionButtonClick"
	ActionButtonContent="Toggle theme now"
	CloseButtonContent="Got it!">
</TeachingTip>
```

```csharp
private void TestButtonClick2(object sender, RoutedEventArgs e)
{
    ToggleThemeTeachingTip2.IsOpen = true;
}
```

![Untitled](WinUI3%20TeachingTip%20%E6%8F%90%E7%A4%BA%E6%A1%86%2051d613ca98e24451ab39c797fb71ac8e/Untitled%201.png)

```xml
<Button Content="Show TeachingTip" Click="TestButtonClick3" />

<TeachingTip x:Name="ToggleThemeTeachingTip3"
    Target="{x:Bind ThemeButton}"
    Title="Change themes without hassle"
    Subtitle="It's easier than ever to see control samples in both light and dark theme!"
    PreferredPlacement="LeftEdgeAlignedBottom">
    <TeachingTip.HeroContent>
        <Image Source="/Assets/SampleMedia/sunset.jpg" AutomationProperties.Name="Sunset" />
    </TeachingTip.HeroContent>
    <TeachingTip.Content>
        <TextBlock TextWrapping="WrapWholeWords" Margin="0,16,0,0">To change your desktop theme visit the <Hyperlink NavigateUri="ms-settings:colors">Settings app</Hyperlink>.</TextBlock>
    </TeachingTip.Content>
</TeachingTip>
```

```csharp
private void TestButtonClick3(object sender, RoutedEventArgs e)
{
    ToggleThemeTeachingTip3.IsOpen = true;
}
```

![Untitled](WinUI3%20TeachingTip%20%E6%8F%90%E7%A4%BA%E6%A1%86%2051d613ca98e24451ab39c797fb71ac8e/Untitled%202.png)
