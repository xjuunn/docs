# WinUi3 PipSpager 轮播指示器

```xml
<StackPanel>
    <FlipView x:Name="Gallery" MaxWidth="400" Height="270" ItemsSource="{x:Bind Pictures}">
        <FlipView.ItemTemplate>
            <DataTemplate x:DataType="x:String">
                <Image Source="{x:Bind Mode=OneTime}" />
            </DataTemplate>
        </FlipView.ItemTemplate>
    </FlipView>
    <PipsPager x:Name="FlipViewPipsPager"
        HorizontalAlignment="Center"
        Margin="0, 12, 0, 0"
        NumberOfPages="{x:Bind Pictures.Count}"
        SelectedPageIndex="{x:Bind Path=Gallery.SelectedIndex, Mode=TwoWay}" />
</StackPanel>
```

![Untitled](WinUi3%20PipSpager%20%E8%BD%AE%E6%92%AD%E6%8C%87%E7%A4%BA%E5%99%A8%204b88c546555447d99a9c1ee7db34d1d6/Untitled.png)

```xml
<PipsPager
    Orientation="Horizontal"
    PreviousButtonVisibility="Visible"
    NextButtonVisibility="Visible" />
```

![Untitled](WinUi3%20PipSpager%20%E8%BD%AE%E6%92%AD%E6%8C%87%E7%A4%BA%E5%99%A8%204b88c546555447d99a9c1ee7db34d1d6/Untitled%201.png)

![Untitled](WinUi3%20PipSpager%20%E8%BD%AE%E6%92%AD%E6%8C%87%E7%A4%BA%E5%99%A8%204b88c546555447d99a9c1ee7db34d1d6/Untitled%202.png)

![Untitled](WinUi3%20PipSpager%20%E8%BD%AE%E6%92%AD%E6%8C%87%E7%A4%BA%E5%99%A8%204b88c546555447d99a9c1ee7db34d1d6/Untitled%203.png)
