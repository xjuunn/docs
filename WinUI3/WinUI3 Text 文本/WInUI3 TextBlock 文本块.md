# WInUI3 TextBlock 文本块

```xml
<TextBlock Text="I am a TextBlock"/>
```

![Untitled](WInUI3%20TextBlock%20%E6%96%87%E6%9C%AC%E5%9D%97%202c0d5c28e58a4e61b1416453cc4ea544/Untitled.png)

```xml
<Page.Resources>
    <Style TargetType="TextBlock" x:Key="CustomTextBlockStyle">
        <Setter Property="FontFamily" Value="Comic Sans MS"/>
        <Setter Property="FontStyle" Value="Italic"/>
    </Style>
<Page.Resources>

<TextBlock Text="I am a styled TextBlock" Style="{StaticResource CustomTextBlockStyle}"/>
```

![Untitled](WInUI3%20TextBlock%20%E6%96%87%E6%9C%AC%E5%9D%97%202c0d5c28e58a4e61b1416453cc4ea544/Untitled%201.png)

```xml
<TextBlock Text="I am super excited to be here!" FontFamily="Arial"
    FontSize="24" FontStyle="Italic" TextWrapping="WrapWholeWords"
    CharacterSpacing="200" Foreground="CornflowerBlue" />
```

![Untitled](WInUI3%20TextBlock%20%E6%96%87%E6%9C%AC%E5%9D%97%202c0d5c28e58a4e61b1416453cc4ea544/Untitled%202.png)

```xml
<TextBlock>
    <Run FontFamily="Times New Roman" Foreground="DarkGray">
        Text in a TextBlock doesn't have to be a simple string.</Run>
    <LineBreak/>
    <Span>Text can be <Bold>bold</Bold>,
        <Italic>italic</Italic>, or <Underline>underlined</Underline>. </Span>
</TextBlock>
```

![Untitled](WInUI3%20TextBlock%20%E6%96%87%E6%9C%AC%E5%9D%97%202c0d5c28e58a4e61b1416453cc4ea544/Untitled%203.png)
