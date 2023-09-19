# WinUI3 SplitView 切割视图

```xml
<SplitView x:Name="splitView" PaneBackground="{ThemeResource SystemControlBackgroundChromeMediumLowBrush}"
           IsPaneOpen="False" OpenPaneLength="144" CompactPaneLength="56" DisplayMode="CompactOverlay">
    <SplitView.Pane>
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="Auto"/>
            </Grid.RowDefinitions>
            <TextBlock Text="PANE CONTENT" x:Name="PaneHeader" Margin="60,12,0,0" Style="{StaticResource BaseTextBlockStyle}"/>
            <ListView x:Name="NavLinksList" Margin="0,12,0,0" SelectionMode="Single" Grid.Row="1" VerticalAlignment="Stretch"
                    ItemClick="NavLinksList_ItemClick" IsItemClickEnabled="True"
                    ItemsSource="{x:Bind NavLinks}" ItemTemplate="{StaticResource NavLinkItemTemplate}"/>
            <StackPanel Orientation="Horizontal" Grid.Row="2" Margin="14,24,0,24" >
                <SymbolIcon Symbol="Setting" />
                <TextBlock Text="Settings" Margin="24,0,0,0" VerticalAlignment="Center"/>
            </StackPanel>
        </Grid>
    </SplitView.Pane>

    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>
        <TextBlock Text="SPLITVIEW CONTENT" Margin="12,12,0,0" Style="{StaticResource BaseTextBlockStyle}"/>
        <TextBlock x:Name="content" Grid.Row="1" Margin="12,12,0,0" Style="{StaticResource BodyTextBlockStyle}" />
    </Grid>
</SplitView>
```

![Untitled](WinUI3%20SpoitView%20%E5%88%87%E5%89%B2%E8%A7%86%E5%9B%BE%200d1fa38069404ed8babf9dbca8715df7/Untitled.png)

IsOpen 当先打开状态

DisplayMode 关闭模式 

*   CompactInlie 保留图标区域
*   Inlie 完全关闭
*   CompactOverlay
*   Overlay  浮动式 失去焦点自动关闭



