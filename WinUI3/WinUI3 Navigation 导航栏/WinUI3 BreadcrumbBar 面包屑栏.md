# WinUI3 BreadcrumbBar 面包屑栏

```xml
<BreadcrumbBar x:Name="BreadcrumbBar1"/>
```

![Untitled](WinUI3%20BreadcrumbBar%20%E9%9D%A2%E5%8C%85%E5%B1%91%E6%A0%8F%2009387eb6e1ba4301b64f10eaf9a744de/Untitled.png)

# 自定义数据模板

```xml
<BreadcrumbBar x:Name="BreadcrumbBar1">
    <BreadcrumbBar.ItemTemplate>
        <DataTemplate x:DataType="l:Folder">
            <BreadcrumbBarItem Content="{Binding}" AutomationProperties.Name="{Binding Name}">
                <BreadcrumbBarItem.ContentTemplate>
                    <DataTemplate>
                        <TextBlock Text="{Binding Name}" />
                    </DataTemplate>
                </BreadcrumbBarItem.ContentTemplate>
            </BreadcrumbBarItem>
        </DataTemplate>
    </BreadcrumbBar.ItemTemplate>
</BreadcrumbBar>
```

```xml
public class Folder
    {
        public string Name { get; set; }
    }

BreadcrumbBar2.ItemsSource = new List<Folder>
{
    new Folder { Name = "Home"},
    new Folder { Name = "Folder1" },
    new Folder { Name = "Folder2" }
};
```

![Untitled](WinUI3%20BreadcrumbBar%20%E9%9D%A2%E5%8C%85%E5%B1%91%E6%A0%8F%2009387eb6e1ba4301b64f10eaf9a744de/Untitled%201.png)
