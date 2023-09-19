# WinUI3 AutomationProperties 自动化属性

# 图片备用文本

```xml
<!-- This image will be announced as "Image of treetops,Image" -->
<Image Source="/Assets/SampleMedia/treetops.jpg" Height="100"
       AutomationProperties.Name="Image of treetops"/>
```

# 为另一个元素提供标签

```xml
<StackPanel Orientation="Horizontal">
    <TextBlock x:Name="FontSizeLabel" Margin="0,0,8,0" Text="Font size of text"/>

    <!-- This NumberBox is labeled by the TextBlock above -->
    <NumberBox x:Name="FontSizeNumberBox" AutomationProperties.LabeledBy="{x:Bind FontSizeLabel}"
                    Minimum="10" Maximum="32"/>
</StackPanel>
```

# 标题级别

```xml
<StackPanel MaxWidth="500">
    <!-- Here is the main header for the whole text. It gets HeadingLevel 1 -->
    <TextBlock AutomationProperties.HeadingLevel="Level1" FontSize="26">Lorem ipsums</TextBlock>
    <!-- The following TextBlock is the header for the standard lorem ipsum text, thus it is only HeadingLevel 2-->
    <TextBlock AutomationProperties.HeadingLevel="Level2" FontSize="22">Lorem ipsum</TextBlock>
    <TextBlock TextWrapping="WrapWholeWords">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Pellentesque feugiat velit pulvinar, vehicula nisi at, molestie risus.
                    Duis consequat auctor libero vitae consectetur. Nullam efficitur euismod lacinia.</TextBlock>

    <TextBlock AutomationProperties.HeadingLevel="Level2" FontSize="22">Cat ipsum</TextBlock>
    <!-- This is the header for the standard cat ipsum section, which is hierarchically below the cat ipsum header, resulting in HeadingLevel 3 -->
    <TextBlock AutomationProperties.HeadingLevel="3" FontSize="18">Standard</TextBlock>
    <TextBlock TextWrapping="WrapWholeWords">Mice litter kitter kitty litty little kitten big roar roar feed me
                    but i will ruin the couch with my claws and hunt by meowing loudly at 5am next to human.</TextBlock>
    <TextBlock AutomationProperties.HeadingLevel="3" FontSize="18">Cat breeds</TextBlock>
    <TextBlock TextWrapping="WrapWholeWords">Tabby abyssinian for jaguar. Thai russian blue and ragdoll, ocicat.
                    Mouser puma so american bobtail for donskoy balinese . Scottish fold manx so siamese.</TextBlock>

    <TextBlock AutomationProperties.HeadingLevel="2" FontSize="22">Bacon ipsum</TextBlock>
    <TextBlock TextWrapping="WrapWholeWords">Bacon ipsum dolor amet meatball nulla labore,
                    tempor sirloin chicken frankfurter tail drumstick ex cupim ground round.</TextBlock>
</StackPanel>
```

![Untitled](WinUI3%20AutomationProperties%20%E8%87%AA%E5%8A%A8%E5%8C%96%E5%B1%9E%E6%80%A7%2026fa2eadfad143f6a7d01f4dcd748924/Untitled.png)
