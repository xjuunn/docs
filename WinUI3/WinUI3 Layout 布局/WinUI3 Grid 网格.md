# WinUI3 Grid 网格

```xml
<Grid Width="240" Height="120" Background="Gray" ColumnDefinitions="50, Auto, *" RowDefinitions ="50, Auto, *">
    <Rectangle Fill="Red" Grid.Column="0" Grid.Row="0" />
    <Rectangle Fill="Blue" Grid.Row="1" />
    <Rectangle Fill="Green" Grid.Column="1" />
    <Rectangle Fill="Yellow" Grid.Row="1" Grid.Column="1" />
</Grid>
```

# 属性

- ColumnDefinitions 定义列
- RowDefinitions  定义行
- 元素属性
    - Grid.Column 列
    - Grid.Row 行



定义一个三行二列的表格

~~~ XAML
<Grid>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="3*"/>
            <ColumnDefinition Width="5*"/>
        </Grid.ColumnDefinitions>
        <Grid.RowDefinitions>
            <RowDefinition Height="2*"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>
        <Border Background="#2f5cb6"/>
        <Border Grid.Column ="1" Background="#1f3d7a"/>
        <Border Grid.Row="1" Grid.ColumnSpan="2" Background="#152951"/>
        <Border Grid.Row="2" Grid.Column="1" Background="#ff0000"/>
    </Grid>
~~~

Grid.ColumnSpan 跨列合并单元格

Grid.RowSpan 跨行合并单元格

将元素放入对应单元格

~~~ XAML
<TextBlock Text="文字1" Grid.Column="1" Grid.Row="1"/>
~~~







