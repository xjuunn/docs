# WinUI3 FlipView 翻页视图

```xml
<FlipView MaxWidth="400" Height="270">
    <Image Source="ms-appx:///Assets/SampleMedia/cliff.jpg" AutomationProperties.Name="Cliff"/>
    <Image Source="ms-appx:///Assets/SampleMedia/grapes.jpg" AutomationProperties.Name="Grapes"/>
    <Image Source="ms-appx:///Assets/SampleMedia/rainier.jpg" AutomationProperties.Name="Rainier"/>
    <Image Source="ms-appx:///Assets/SampleMedia/sunset.jpg" AutomationProperties.Name="Sunset"/>
    <Image Source="ms-appx:///Assets/SampleMedia/valley.jpg" AutomationProperties.Name="Valley"/>
</FlipView>
```

# 数据绑定

```xml
<FlipView MaxWidth="400" Height="180" BorderBrush="Black" BorderThickness="1" ItemsSource="{x:Bind Items, Mode=OneWay}">
    <FlipView.ItemTemplate>
        <DataTemplate x:DataType="data:ControlInfoDataItem">
            <Grid>
                <Image Height="120" Source="{x:Bind ImagePath}" Stretch="Uniform" VerticalAlignment="Top"/>
                <Border Background="#A5FFFFFF" Height="60" VerticalAlignment="Bottom">
                <TextBlock Text="{x:Bind Title}" Foreground="#CCFFFFFF" Padding="12,12" Style="{StaticResource TitleTextBlockStyle}" HorizontalAlignment="Center"/>
                </Border>
            </Grid>
        </DataTemplate>
    </FlipView.ItemTemplate>
</FlipView>
```

# 纵向的

```xml
<FlipView MaxWidth="400" Height="270">
    <Image Source="ms-appx:///Assets/SampleMedia/cliff.jpg" AutomationProperties.Name="Cliff"/>
    <Image Source="ms-appx:///Assets/SampleMedia/grapes.jpg" AutomationProperties.Name="Grapes"/>
    <Image Source="ms-appx:///Assets/SampleMedia/rainier.jpg" AutomationProperties.Name="Rainier"/>
    <Image Source="ms-appx:///Assets/SampleMedia/sunset.jpg" AutomationProperties.Name="Sunset"/>
    <Image Source="ms-appx:///Assets/SampleMedia/valley.jpg" AutomationProperties.Name="Valley"/>
        <FlipView.ItemsPanel >
            <ItemsPanelTemplate>
                <VirtualizingStackPanel Orientation="Vertical"/>
            </ItemsPanelTemplate>
        </FlipView.ItemsPanel>
<FlipView>
```
