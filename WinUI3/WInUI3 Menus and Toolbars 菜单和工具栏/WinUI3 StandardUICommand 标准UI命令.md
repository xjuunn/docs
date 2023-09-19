# WinUI3 StandardUICommand 标准UI命令

```xml
<SwipeItem x:Name="DeleteSwipeItem" Background="Red" Command="{x:Bind Command}" CommandParameter="{x:Bind Text}" />

<AppBarButton x:Name="HoverButton" IsTabStop="False" HorizontalAlignment="Right" Visibility="Collapsed"
 Command="{x:Bind Command}" CommandParameter="{x:Bind Text}" />
```

```csharp
private void ControlExample_Loaded(object sender, RoutedEventArgs e)
{
    var deleteCommand = new StandardUICommand(StandardUICommandKind.Delete);
    deleteCommand.ExecuteRequested += DeleteCommand_ExecuteRequested;

    DeleteFlyoutItem.Command = deleteCommand;

    for (var i = 0; i < 15; i++)
    {
        collection.Add(new ListItemData { Text = "List item " + i.ToString(), Command = deleteCommand });
    }
}

private void ListViewRight_ContainerContentChanging(ListViewBase sender, ContainerContentChangingEventArgs args)
{
    MenuFlyout flyout = new MenuFlyout();
    ListItemData data = (ListItemData)args.Item;
    MenuFlyoutItem item = new MenuFlyoutItem() { Command = data.Command};
    flyout.Items.Add(item);
    args.ItemContainer.ContextFlyout = flyout;
}
```

![Untitled](WinUI3%20StandardUICommand%20%E6%A0%87%E5%87%86UI%E5%91%BD%E4%BB%A4%20a5c4bf3a25bf45be9c9e8787f384e78b/Untitled.png)
