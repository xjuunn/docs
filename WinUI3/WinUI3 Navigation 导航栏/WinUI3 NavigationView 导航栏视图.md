# WinUI3 NavigationView 导航栏视图

```xml
<NavigationView x:Name="nvSample">
    <NavigationView.MenuItems>
        <NavigationViewItem Icon="Play" Content="Menu Item1" Tag="SamplePage1" />
        <NavigationViewItem Icon="Save" Content="Menu Item2" Tag="SamplePage2" />
        <NavigationViewItem Icon="Refresh" Content="Menu Item3" Tag="SamplePage3" />
        <NavigationViewItem Icon="Download" Content="Menu Item4" Tag="SamplePage4" />
    </NavigationView.MenuItems>
    <Frame x:Name="contentFrame"/>
</NavigationView>
```

![Untitled](WinUI3%20NavigationView%20%E5%AF%BC%E8%88%AA%E6%A0%8F%E8%A7%86%E5%9B%BE%20dd7a0ca189b649ffa0d33bc220d1d5b4/Untitled.png)

![Untitled](WinUI3%20NavigationView%20%E5%AF%BC%E8%88%AA%E6%A0%8F%E8%A7%86%E5%9B%BE%20dd7a0ca189b649ffa0d33bc220d1d5b4/Untitled%201.png)

# 顶部导航栏

```xml
<NavigationView x:Name="nvSample" Header="This is Header Text" PaneDisplayMode="Top">
    <NavigationView.MenuItems>
        <NavigationViewItem  Content="Menu Item1" Tag="SamplePage1" />
        <NavigationViewItem  Content="Menu Item2" Tag="SamplePage2" />
        <NavigationViewItem  Content="Menu Item3" Tag="SamplePage3" />
        <NavigationViewItem  Content="Menu Item4" Tag="SamplePage4" />
    </NavigationView.MenuItems>
    <Frame x:Name="contentFrame"/>
</NavigationView>
```

![Untitled](WinUI3%20NavigationView%20%E5%AF%BC%E8%88%AA%E6%A0%8F%E8%A7%86%E5%9B%BE%20dd7a0ca189b649ffa0d33bc220d1d5b4/Untitled%202.png)

# 根据窗口大小自适应变成方格

```xml
<!-- Put the following VisualStateGroup(s) inside the first component of your Page -->
<VisualStateManager.VisualStateGroups>
    <VisualStateGroup>
        <VisualState>
            <VisualState.StateTriggers>
                <AdaptiveTrigger MinWindowWidth="{x:Bind nvSample.CompactModeThresholdWidth}" />
            </VisualState.StateTriggers>
            <VisualState.Setters>
                <Setter Target="nvSample.PaneDisplayMode" Value="Top" />
            </VisualState.Setters>
        </VisualState>
    </VisualStateGroup>
</VisualStateManager.VisualStateGroups >

<NavigationView x:Name="nvSample">
    <NavigationView.MenuItems>
        <NavigationViewItem Content="Menu Item1" Tag="SamplePage1" />
        <NavigationViewItem Content="Menu Item2" Tag="SamplePage2" />
        <NavigationViewItem Content="Menu Item3" Tag="SamplePage3" />
        <NavigationViewItem Content="Menu Item4" Tag="SamplePage4" />
    </NavigationView.MenuItems>
    <Frame x:Name="contentFrame"/>
</NavigationView>
```

# 数据绑定

```xml
<NavigationView x:Name="nvSample"
                MenuItemTemplateSelector="{StaticResource selector}"
                MenuItemsSource="{x:Bind Categories, Mode=OneWay}" />

<local:MenuItemTemplateSelector x:Key="selector">
    <local:MenuItemTemplateSelector.ItemTemplate>
        <DataTemplate x:DataType="local:Category" >
            <NavigationViewItem Content="{x:Bind Name}" TooltipService.ToolTip="{x:Bind Tooltip}">
                <NavigationViewItem.Icon>
                    <SymbolIcon Symbol="{x:Bind Glyph}" />
                </NavigationViewItem.Icon>
            </NavigationViewItem>
        </DataTemplate>
    </local:MenuItemTemplateSelector.ItemTemplate >
</local:MenuItemTemplateSelector>
```

```csharp
//C# code behind
Categories = new ObservableCollection<CategoryBase>();
Categories.Add(new Category { Name = "Category 1", Glyph = Symbol.Home, Tooltip = "This is category 1" });
Categories.Add(new Category { Name = "Category 2", Glyph = Symbol.Keyboard, Tooltip = "This is category 2" });
Categories.Add(new Category { Name = "Category 3", Glyph = Symbol.Library, Tooltip = "This is category 3" });
Categories.Add(new Category { Name = "Category 4", Glyph = Symbol.Mail, Tooltip = "This is category 4" });

public class CategoryBase { }

public class Category : CategoryBase
{
    public string Name { get; set; }
    public string Tooltip { get; set; }
    public Symbol Glyph { get; set; }
}

public class Separator : CategoryBase { }

public class Header : CategoryBase
{
    public string Name { get; set; }
}

[ContentProperty(Name = "ItemTemplate")]
class MenuItemTemplateSelector : DataTemplateSelector
{
    public DataTemplate ItemTemplate { get; set; }
    protected override DataTemplate SelectTemplateCore(object item)
    {
        return item is Separator ? SeparatorTemplate : item is Header ? HeaderTemplate : ItemTemplate;
    }
}
```

![Untitled](WinUI3%20NavigationView%20%E5%AF%BC%E8%88%AA%E6%A0%8F%E8%A7%86%E5%9B%BE%20dd7a0ca189b649ffa0d33bc220d1d5b4/Untitled%203.png)

# item到导航底部

```xml
<NavigationView x:Name="nvSample9"
                            Header="This is Header Text"
                            PaneDisplayMode="Left"
                            SelectionChanged="NavigationView_SelectionChanged9"
                            IsSettingsVisible="False">
        <NavigationView.MenuItems>
            <NavigationViewItem Content="Browse" Tag="SamplePage1" Icon="Library" />
            <NavigationViewItem Content="Track an Order" Tag="SamplePage2" Icon="Map" />
            <NavigationViewItem Content="Order History" Tag="SamplePage3" Icon="Tag" />
        </NavigationView.MenuItems>
        <NavigationView.FooterMenuItems>
            <NavigationViewItem Content="Account" Tag="SamplePage4" Icon="Contact" />
            <NavigationViewItem Content="Your Cart" Tag="SamplePage5" Icon="Shop" />
            <NavigationViewItem Content="Help" Tag="SamplePage5" Icon="Help" />
        </NavigationView.FooterMenuItems>
    <Frame x:Name="contentFrame9" />
</NavigationView>
```

![Untitled](WinUI3%20NavigationView%20%E5%AF%BC%E8%88%AA%E6%A0%8F%E8%A7%86%E5%9B%BE%20dd7a0ca189b649ffa0d33bc220d1d5b4/Untitled%204.png)

# 分级导航栏

```xml
<NavigationView x:Name="nvSample8" Grid.Row="1" Height="460"
                        PaneDisplayMode="Left"
                        IsTabStop="False"
                        SelectionChanged="NavigationView_SelectionChanged8">
    <NavigationView.MenuItems>
        <NavigationViewItem Content="Home" Icon="Home" ToolTipService.ToolTip="Home" Tag="SamplePage1"/>
        <NavigationViewItem Content="Account" Icon="Contact" ToolTipService.ToolTip="Account" Tag="SamplePage2">
            <NavigationViewItem.MenuItems>
                <NavigationViewItem Content="Mail" Icon="Mail" ToolTipService.ToolTip="Mail" Tag="SamplePage3"/>
                <NavigationViewItem Content="Calendar" Icon="Calendar" ToolTipService.ToolTip="Calendar" Tag="SamplePage4"/>
            </NavigationViewItem.MenuItems>
        </NavigationViewItem>
        <NavigationViewItem Content="Document options" Icon="Page2" ToolTipService.ToolTip="Document options" SelectsOnInvoked="False">
            <NavigationViewItem.MenuItems>
                <NavigationViewItem Content="Create new" Icon="NewFolder" ToolTipService.ToolTip="Create new" Tag="SamplePage5"/>
                <NavigationViewItem Content="Upload file" Icon="OpenLocal" ToolTipService.ToolTip="Upload file" Tag="SamplePage6"/>
            </NavigationViewItem.MenuItems>
        </NavigationViewItem>
    </NavigationView.MenuItems>
    <Frame x:Name="contentFrame8" />
</NavigationView>
```

![Untitled](WinUI3%20NavigationView%20%E5%AF%BC%E8%88%AA%E6%A0%8F%E8%A7%86%E5%9B%BE%20dd7a0ca189b649ffa0d33bc220d1d5b4/Untitled%205.png)

![Untitled](WinUI3%20NavigationView%20%E5%AF%BC%E8%88%AA%E6%A0%8F%E8%A7%86%E5%9B%BE%20dd7a0ca189b649ffa0d33bc220d1d5b4/Untitled%206.png)

```xml
<NavigationView x:Name="nvSample"
    IsSettingsVisible="True"
    IsBackButtonVisible="Auto"
    IsBackEnabled="True"
    SelectionChanged="NavigationView_SelectionChanged"
    Header="Sample Page 1"
    AlwaysShowHeader="False"
    PaneTitle="Pane Title"
    PaneDisplayMode="Left"
    ExpandedModeThresholdWidth="500"
    SelectionFollowsFocus="Disabled"
    IsTabStop="False">

    <NavigationView.MenuItems>
        <NavigationViewItem Content="Menu Item1" Tag="SamplePage1" x:Name="SamplePage1Item">
            <NavigationViewItem.Icon>
                <SymbolIcon Symbol="Play" />
            </NavigationViewItem.Icon>
        </NavigationViewItem>
        <NavigationViewItemHeader Content="Actions"/>
        <NavigationViewItem Content="Menu Item2" Tag="SamplePage2" x:Name="SamplePage2Item" SelectsOnInvoked="True">
            <NavigationViewItem.Icon>
                <SymbolIcon Symbol="Save" />
            </NavigationViewItem.Icon>
        </NavigationViewItem>
        <NavigationViewItem Content="Menu Item3" Tag="SamplePage3" x:Name="SamplePage3Item">
            <NavigationViewItem.Icon>
                <SymbolIcon Symbol="Refresh" />
            </NavigationViewItem.Icon>
        </NavigationViewItem>
    </NavigationView.MenuItems>

    <NavigationView.PaneCustomContent>
        <HyperlinkButton x:Name="PaneHyperlink" Content="More info" Margin="12,0" Visibility="Visible" />
    </NavigationView.PaneCustomContent>
    
    <NavigationView.AutoSuggestBox> 
        <AutoSuggestBox QueryIcon="Find" AutomationProperties.Name="Search" /> 
    </NavigationView.AutoSuggestBox> 

    <NavigationView.PaneFooter>
        <StackPanel x:Name="FooterStackPanel" Orientation="Vertical" Visibility="Visible">
            <NavigationViewItem Icon="Download" AutomationProperties.Name="download" />
            <NavigationViewItem Icon="Favorite" AutomationProperties.Name="favorite" />
        </StackPanel>
    </NavigationView.PaneFooter>

    <Frame x:Name="contentFrame" />
</NavigationView>
```
