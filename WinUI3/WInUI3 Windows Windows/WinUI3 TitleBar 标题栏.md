# WinUI3 TitleBar 标题栏

```csharp
// UIElement set as titlebar
<Border x:Name="AppTitleBar" Grid.Column="1" VerticalAlignment="Top">
    <TextBlock x:Name="AppTitle" Text="{StaticResource AppTitleName}" VerticalAlignment="Top" Margin="0,8,0,0" />
</Border>

// C# code to set AppTitleBar uielement as titlebar
Window window = App.MainWindow;
window.ExtendsContentIntoTitleBar = true;  // enable custom titlebar
window.SetTitleBar(AppTitleBar);      // set user ui element as titlebar
```

```csharp
// no UIElement is set for titlebar, fallback titlebar is created
Window window = App.MainWindow;
window.ExtendsContentIntoTitleBar = true;
window.SetTitleBar(null);  // this line is optional as by it is null by default
```
