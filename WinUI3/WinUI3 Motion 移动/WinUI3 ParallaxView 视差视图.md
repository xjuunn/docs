# WinUI3 ParallaxView 视差视图

```xml
<Grid>
    <ParallaxView Source="{Binding ElementName=listView}" VerticalShift="500">
        <Image Source="ms-appx:///Assets/SampleMedia/cliff.jpg" />
    </ParallaxView>
    <ListView x:Name="listView" ItemsSource="{x:Bind Items}">
        <ListView.Header>
            <Grid>
                <ParallaxView Source="{x:Bind listView}" VerticalShift="100"
                              VerticalSourceOffsetKind="Absolute" VerticalSourceStartOffset="-50"
                              VerticalSourceEndOffset="250">
                    <Image Source="ms-appx:///Assets/SampleMedia/cliff.jpg" />
                </ParallaxView>
                <TextBlock Text="Scroll the list to see parallaxing of images" />
            </Grid>
        </ListView.Header>
    </ListView>
</Grid>
```
