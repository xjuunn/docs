# WinUI3 ItemsRepeater Item重复器

```xml
<!-- The ItemsRepeater and ScrollViewer used: -->
<ScrollViewer HorizontalScrollBarVisibility="Auto"
        HorizontalScrollMode="Auto"
        IsVerticalScrollChainingEnabled="False"
        MaxHeight="500">
    <ItemsRepeater
        ItemsSource="{x:Bind BarItems}"
        Layout="{StaticResource VerticalStackLayout}"
        ItemTemplate="{StaticResource HorizontalBarTemplate}" />
</ScrollViewer>

<!-- The Layout specifications used: -->

<StackLayout x:Name="VerticalStackLayout" Orientation="Vertical" Spacing="8"/>

<!-- The DataTemplate used: HorizontalBarTemplate-->

<DataTemplate x:Key="HorizontalBarTemplate" x:DataType="l:Bar">
    <Border Background="{ThemeResource SystemChromeLowColor}" Width="{x:Bind MaxLength}" >
        <Rectangle Fill="{ThemeResource SystemAccentColor}" Width="{x:Bind Length}"
                   Height="24" HorizontalAlignment="Left"/> 
    </Border>
</DataTemplate>

<!-- The ItemsSource used is a list of custom-class Bar objects called BarItems. Bar objects have
the following attributes: Height, MaxHeight, Length, MaxLength, Diameter, and MaxDiameter. -->
```

![Untitled](WinUI3%20ItemsRepeater%20Item%E9%87%8D%E5%A4%8D%E5%99%A8%203512d8e69d55403ba7f08bd3a37c2386/Untitled.png)

```xml
<!-- XAML Code -->

<!-- The ItemsRepeater and ScrollViewer used: -->
<ScrollViewer x:Name="scrollViewer"
                Height="400"
                IsVerticalScrollChainingEnabled="False"
                Padding="0,0,16,0">
    <ItemsRepeater
            ItemsSource="{x:Bind NumberedItems}"
            Layout="{StaticResource MyFeedLayout}"
            ItemTemplate="{StaticResource SimpleItemTemplate}" />
<ScrollViewer/>

<!-- The Layout specifications used: -->

<common:ActivityFeedLayout x:Key="MyFeedLayout" ColumnSpacing="12"
                          RowSpacing="12" MinItemSize="80, 108"/>

<!-- The ItemTemplate is bound to a DataTemplateSelector called MyDataTemplateSelector.
MyDataTemplateSelector is defined in the code-behind to return the Accent DataTemplate
for odd-numbered-items, and returns the Normal DataTemplate for even-numbered-items
(shown in C# code-behind section below). The two data templates and the XAML declaration
of MyDataTemplateSelector are below: -->

<MyDataTemplateSelector x:Key="MyDataTemplateSelector"
                            Normal="{StaticResource NormalItemTemplate}"
                            Accent="{StaticResource AccentItemTemplate}"/>

<DataTemplate x:Key="NormalItemTemplate" x:DataType="x:Int32">
    <Button HorizontalAlignment="Stretch" VerticalAlignment="Stretch"
	    Background="{ThemeResource SystemChromeLowColor}">
        <TextBlock Text="{x:Bind}" />
    </Button>
</DataTemplate>

<DataTemplate x:Key="AccentItemTemplate" x:DataType="x:Int32">
    <Button HorizontalAlignment="Stretch" VerticalAlignment="Stretch"
	    Background="{ThemeResource SystemAccentColor}">
        <TextBlock Text="{x:Bind}" />
    </Button>
</DataTemplate>

<!-- The ItemsSource for this ItemsRepeater is a list of integers called NumberedItems.-->

<!-- ActivityFeedLayout is a custom designed virtualizing layout that loads images only as you come
accross them, defined in the code-behind. View the WinUI Gallery source code to see more
details about this custom layout. -->
```

```csharp
// C# Code-behind

public class MyDataTemplateSelector : DataTemplateSelector
{
    public DataTemplate Normal { get; set; }
    public DataTemplate Accent { get; set; }

    protected override DataTemplate SelectTemplateCore(object item)
    {
        if ((int)item % 2 == 0)
        {
            return Normal;
        }
        else
        {
            return Accent;
        }
    }
}
```

![Untitled](WinUI3%20ItemsRepeater%20Item%E9%87%8D%E5%A4%8D%E5%99%A8%203512d8e69d55403ba7f08bd3a37c2386/Untitled%201.png)

```csharp
<!-- XAML Code -->

<!-- The below code shows the XAML for the ItemsRepeater as well as the
color-changing rectangle besides it. -->

<Grid>
    <Grid.ColumnDefinitions>
        <ColumnDefinition Width="1*"/>
        <ColumnDefinition Width="1*"/>
    </Grid.ColumnDefinitions>

    <ScrollViewer x:Name="Animated_ScrollViewer"
                    Grid.Column="0"
                    Height="175"
                    Width="250"
                    ViewChanging="Animated_ScrollViewer_ViewChanging">
        <ItemsRepeater x:Name="animatedScrollRepeater" >
            <ItemsRepeater.ItemTemplate>
                <DataTemplate x:DataType="x:String">
                    <Button Content="{x:Bind}"
                            Background="{x:Bind}"
                            Click="Animated_GotItem"
                            GotFocus="Animated_GotItem"
                            HorizontalAlignment="Stretch"
                            Loaded="GetButtonSize"
                            Foreground="{ThemeResource ButtonForeground}"/>
                </DataTemplate>
            </ItemsRepeater.ItemTemplate>
        </ItemsRepeater>
    </ScrollViewer>

    <Rectangle x:Name="colorRectangle"
                Grid.Column="1"
                Stroke="Black"
                Height="150"
                Width="150"
                Margin="10,0,0,0"/>
</Grid>
```

```csharp
// C# Code

// Initialization code

private double AnimatedBtnHeight;
private Microsoft.UI.Xaml.Thickness AnimatedBtnMargin;

private void InitializeData()
{

    IList<string> colors = new List<String>()
    {
        "Blue",
        "BlueViolet",
        "Crimson",
        "DarkCyan",
        "DarkGoldenrod",
        "DarkMagenta",
        "DarkOliveGreen",
        "DarkRed",
        "DarkSlateBlue",
        "DeepPink",
        "IndianRed",
        "MediumSlateBlue",
        "Maroon",
        "MidnightBlue",
        "Peru",
        "SaddleBrown",
        "SteelBlue",
        "OrangeRed",
        "Firebrick",
        "DarkKhaki"
    };

    animatedScrollRepeater.ItemsSource = colors;
    animatedScrollRepeater.ElementPrepared += OnElementPrepared;
}

// Animation code

private void Animated_GotItem(object sender, RoutedEventArgs e)
{
    var item = sender as FrameworkElement;
    // When the clicked item has been recieved, bring it to the middle of the viewport.
    item.StartBringIntoView(new BringIntoViewOptions()
    {
        VerticalAlignmentRatio = 0.5,
        AnimationDesired = true,
    });

    // Update corresponding rectangle with selected color
    Button senderBtn = sender as Button;
    colorRectangle.Fill = senderBtn.Background;
}

/* This function occurs each time an element is made ready for use.
* This is necessary for virtualization. */
private void OnElementPrepared(Microsoft.UI.Xaml.Controls.ItemsRepeater sender,
                               Microsoft.UI.Xaml.Controls.ItemsRepeaterElementPreparedEventArgs args)
{
    var item = ElementCompositionPreview.GetElementVisual(args.Element);
    var svVisual = ElementCompositionPreview.GetElementVisual(Animated_ScrollViewer);
    var scrollProperties = ElementCompositionPreview.GetScrollViewerManipulationPropertySet(Animated_ScrollViewer);

    var scaleExpresion = scrollProperties.Compositor.CreateExpressionAnimation();
    scaleExpresion.SetReferenceParameter("svVisual", svVisual);
    scaleExpresion.SetReferenceParameter("scrollProperties", scrollProperties);
    scaleExpresion.SetReferenceParameter("item", item);

    // Scale the item based on the distance of the item relative to the center of the viewport.
    scaleExpresion.Expression = "1 - abs((svVisual.Size.Y/2 - scrollProperties.Translation.Y)
                                   - (item.Offset.Y + item.Size.Y/2))*(.25/(svVisual.Size.Y/2))";

    // Animate the item based on its distance to the center of the viewport.
    item.StartAnimation("Scale.X", scaleExpresion);
    item.StartAnimation("Scale.Y", scaleExpresion);
    var centerPointExpression = scrollProperties.Compositor.CreateExpressionAnimation();
    centerPointExpression.SetReferenceParameter("item", item);
    centerPointExpression.Expression = "Vector3(item.Size.X/2, item.Size.Y/2, 0)";
    item.StartAnimation("CenterPoint", centerPointExpression);
}

/* This function identifies the item that's currently in the middle of the viewport,
and sets the rectangle to match its color. */
private void Animated_ScrollViewer_ViewChanging(object sender, ScrollViewerViewChangingEventArgs e)
{
     Button SelectedItem = GetSelectedItemFromViewport() as Button;
     // Update corresponding rectangle with selected color
     colorRectangle.Fill = SelectedItem.Background;
}

// The remainder of these functions are helper functions for the ViewChanging function:

// Find centerpoint of ScrollViewer
private double CenterPointOfViewportInExtent()
{
    return Animated_ScrollViewer.VerticalOffset + Animated_ScrollViewer.ViewportHeight / 2;
}

// Find index of the item that's at the center of the viewport
private int GetSelectedIndexFromViewport()
{
    int selectedItemIndex = (int)Math.Floor(CenterPointOfViewportInExtent()
                              / ((double)AnimatedBtnMargin.Top + AnimatedBtnHeight));
    selectedItemIndex %= animatedScrollRepeater.ItemsSourceView.Count;
    return selectedItemIndex;
}

// Return item that's at the center of the viewport.
private object GetSelectedItemFromViewport()
{
    var selectedIndex = GetSelectedIndexFromViewport();
    var selectedElement = animatedScrollRepeater.TryGetElement(selectedIndex) as Button;
    return selectedElement;
}
```

![Untitled](WinUI3%20ItemsRepeater%20Item%E9%87%8D%E5%A4%8D%E5%99%A8%203512d8e69d55403ba7f08bd3a37c2386/Untitled%202.png)
