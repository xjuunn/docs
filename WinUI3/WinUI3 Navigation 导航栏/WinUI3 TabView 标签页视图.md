# WinUI3 TabView 标签页视图

```
<TabView AddTabButtonClick="TabView_AddButtonClick" TabCloseRequested="TabView_TabCloseRequested" Loaded="TabView_Loaded" />

```

```
private void TabView_Loaded(object sender, RoutedEventArgs e)
{
    for (int i = 0; i < 3; i++)
    {
        (sender as TabView).TabItems.Add(CreateNewTab(i));
    }
}

private void TabView_AddButtonClick(TabView sender, object args)
{
    sender.TabItems.Add(CreateNewTab(sender.TabItems.Count));
}

private void TabView_TabCloseRequested(TabView sender, TabViewTabCloseRequestedEventArgs args)
{
    sender.TabItems.Remove(args.Tab);
}

private TabViewItem CreateNewTab(int index)
{
    TabViewItem newItem = new TabViewItem();

    newItem.Header = $"Document {index}";
    newItem.IconSource = new Microsoft.UI.Xaml.Controls.SymbolIconSource() { Symbol = Symbol.Document };

    // The content of the tab is often a frame that contains a page, though it could be any UIElement.
    Frame frame = new Frame();

    switch (index % 3)
    {
        case 0:
            frame.Navigate(typeof(SamplePage1));
            break;
        case 1:
            frame.Navigate(typeof(SamplePage2));
            break;
        case 2:
            frame.Navigate(typeof(SamplePage3));
            break;
    }

    newItem.Content = frame;

    return newItem;
}

```

![WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled.png](WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled.png)

# 标记

```
<TabView AddTabButtonClick="TabView_AddButtonClick" TabCloseRequested="TabView_TabCloseRequested">
    <TabView.TabItems>
        <TabViewItem Header="Document 0">
            <TabViewItem.IconSource>
                <SymbolIconSource Symbol="Placeholder" />
            </TabViewItem.IconSource>
            <samplepages:SamplePage1 />
        </TabViewItem>
        <TabViewItem Header="Document 1">
            <TabViewItem.IconSource>
                <SymbolIconSource Symbol="Placeholder" />
            </TabViewItem.IconSource>
            <samplepages:SamplePage2 />
        </TabViewItem>
        <TabViewItem Header="Document 2">
            <TabViewItem.IconSource>
                <SymbolIconSource Symbol="Placeholder" />
            </TabViewItem.IconSource>
            <samplepages:SamplePage3 />
        </TabViewItem>
    </TabView.TabItems>
</TabView>

```

![WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%201.png](WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%201.png)

# 绑定到MyData对象

```
<TabView TabItemsSource="{x:Bind myDatas, Mode=OneWay}" AddTabButtonClick="TabViewItemsSourceSample_AddTabButtonClick" TabCloseRequested="TabViewItemsSourceSample_TabCloseRequested" />

```

# 支持键盘操作

```
<TabView AddTabButtonClick="TabView_AddButtonClick" TabCloseRequested="TabView_TabCloseRequested" Loaded="TabView_Loaded">
    <TabView.KeyboardAccelerators>
        <KeyboardAccelerator Key="T" Modifiers="Control" Invoked="NewTabKeyboardAccelerator_Invoked" />
        <KeyboardAccelerator Key="W" Modifiers="Control" Invoked="CloseSelectedTabKeyboardAccelerator_Invoked" />
        <KeyboardAccelerator Key="Number1" Modifiers="Control" Invoked="NavigateToNumberedTabKeyboardAccelerator_Invoked" />
        <KeyboardAccelerator Key="Number2" Modifiers="Control" Invoked="NavigateToNumberedTabKeyboardAccelerator_Invoked" />
        <KeyboardAccelerator Key="Number3" Modifiers="Control" Invoked="NavigateToNumberedTabKeyboardAccelerator_Invoked" />
        <KeyboardAccelerator Key="Number4" Modifiers="Control" Invoked="NavigateToNumberedTabKeyboardAccelerator_Invoked" />
        <KeyboardAccelerator Key="Number5" Modifiers="Control" Invoked="NavigateToNumberedTabKeyboardAccelerator_Invoked" />
        <KeyboardAccelerator Key="Number6" Modifiers="Control" Invoked="NavigateToNumberedTabKeyboardAccelerator_Invoked" />
        <KeyboardAccelerator Key="Number7" Modifiers="Control" Invoked="NavigateToNumberedTabKeyboardAccelerator_Invoked" />
        <KeyboardAccelerator Key="Number8" Modifiers="Control" Invoked="NavigateToNumberedTabKeyboardAccelerator_Invoked" />
        <KeyboardAccelerator Key="Number9" Modifiers="Control" Invoked="NavigateToNumberedTabKeyboardAccelerator_Invoked" />
    </TabView.KeyboardAccelerators>
</TabView>

```

```
private void NewTabKeyboardAccelerator_Invoked(KeyboardAccelerator sender, KeyboardAcceleratorInvokedEventArgs args)
{
    var senderTabView = args.Element as TabView;
    senderTabView.TabItems.Add(CreateNewTab(senderTabView.TabItems.Count));

	args.Handled = true;
}

private void CloseSelectedTabKeyboardAccelerator_Invoked(KeyboardAccelerator sender, KeyboardAcceleratorInvokedEventArgs args)
{
    var InvokedTabView = (args.Element as TabView);

    // Only close the selected tab if it is closeable
    if (((TabViewItem)InvokedTabView.SelectedItem).IsClosable)
    {
        InvokedTabView.TabItems.Remove(InvokedTabView.SelectedItem);
    }

	args.Handled = true;
}

private void NavigateToNumberedTabKeyboardAccelerator_Invoked(KeyboardAccelerator sender, KeyboardAcceleratorInvokedEventArgs args)
{
    var InvokedTabView = (args.Element as TabView);

    int tabToSelect = 0;

    switch (sender.Key)
    {
        case Windows.System.VirtualKey.Number1:
            tabToSelect = 0;
            break;
        case Windows.System.VirtualKey.Number2:
            tabToSelect = 1;
            break;
        case Windows.System.VirtualKey.Number3:
            tabToSelect = 2;
            break;
        case Windows.System.VirtualKey.Number4:
            tabToSelect = 3;
            break;
        case Windows.System.VirtualKey.Number5:
            tabToSelect = 4;
            break;
        case Windows.System.VirtualKey.Number6:
            tabToSelect = 5;
            break;
        case Windows.System.VirtualKey.Number7:
            tabToSelect = 6;
            break;
        case Windows.System.VirtualKey.Number8:
            tabToSelect = 7;
            break;
        case Windows.System.VirtualKey.Number9:
            // Select the last tab
            tabToSelect = InvokedTabView.TabItems.Count - 1;
            break;
    }

    // Only select the tab if it is in the list
    if (tabToSelect < InvokedTabView.TabItems.Count)
    {
        InvokedTabView.SelectedIndex = tabToSelect;
    }

	args.Handled = true;
}

```

![WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%202.png](WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%202.png)

# 图标

```
<TabView TabWidthMode="SizeToContent" />

```

![WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%203.png](WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%203.png)

![WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%204.png](WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%204.png)

# 关闭按钮

```
<TabView CloseButtonOverlayMode="Always" />

```

![WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%205.png](WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%205.png)

# 彩色icon

```
<TabView>
    <TabView.TabItems>
        <TabViewItem Header="CMD Prompt">
            <TabViewItem.IconSource>
                <BitmapIconSource UriSource="/Assets/TabViewIcons/cmd.png" ShowAsMonochrome="False" />
            </TabViewItem.IconSource>
        </TabViewItem>
        <TabViewItem Header="PowerShell">
            <TabViewItem.IconSource>
                <BitmapIconSource UriSource="/Assets/TabViewIcons/powershell.png" ShowAsMonochrome="False" />
            </TabViewItem.IconSource>
        </TabViewItem>
        <TabViewItem Header="Windows Subsystem for Linux">
            <TabViewItem.IconSource>
                <BitmapIconSource UriSource="/Assets/TabViewIcons/linux.png" ShowAsMonochrome="False" />
            </TabViewItem.IconSource>
        </TabViewItem>
    </TabView.TabItems>
</TabView>

```

![WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%206.png](WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%206.png)

# 背景颜色

```
<TabView>
    <TabView.Resources>
        <ResourceDictionary>
            <ResourceDictionary.ThemeDictionaries>
                <ResourceDictionary x:Key="Light">
                    <SolidColorBrush x:Key="TabViewBackground" Color="{ThemeResource SystemAccentColorLight2}"/>
                </ResourceDictionary>
                <ResourceDictionary x:Key="Dark">
                    <SolidColorBrush x:Key="TabViewBackground" Color="{ThemeResource SystemAccentColorDark2}"/>
                </ResourceDictionary>
            </ResourceDictionary.ThemeDictionaries>
        </ResourceDictionary>
    </TabView.Resources>
</TabView>

```

![WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%207.png](WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%207.png)

# 新的窗口打开

Check out the TabViewWindowingSamplePage.xaml and *.cs files to see the complete code.

![WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%208.png](WinUI3%20TabView%20%E6%A0%87%E7%AD%BE%E9%A1%B5%E8%A7%86%E5%9B%BE%20bc3e4c9f56a14b3dadddb53495838755/Untitled%208.png)
