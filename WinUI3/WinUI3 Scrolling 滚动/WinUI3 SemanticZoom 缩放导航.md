# WinUI3 SemanticZoom 缩放导航

```xml
<SemanticZoom Height="500">
    <SemanticZoom.ZoomedInView>
        <GridView ItemsSource="{x:Bind cvsGroups.View}" SelectionMode="None"
                  ItemTemplate="{StaticResource ZoomedInTemplate}">
            <GridView.GroupStyle>
                <GroupStyle HeaderTemplate="{StaticResource ZoomedInGroupHeaderTemplate}" />
            </GridView.GroupStyle>
        </GridView>
    </SemanticZoom.ZoomedInView>

    <SemanticZoom.ZoomedOutView>
        <ListView ItemsSource="{x:Bind cvsGroups.View.CollectionGroups}" HorizontalAlignment="Stretch"
                  SelectionMode="None" ItemTemplate="{StaticResource ZoomedOutTemplate}" />
    </SemanticZoom.ZoomedOutView>
</SemanticZoom>
```
