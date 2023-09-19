# WInUI3 RichTextBlock 富文本框

```xml
<RichTextBlock>
    <Paragraph>I am a RichTextBlock.</Paragraph>
</RichTextBlock>
```

![Untitled](WInUI3%20RichTextBlock%20%E5%AF%8C%E6%96%87%E6%9C%AC%E6%A1%86%20b9eb0a960ff64fe5a64066666723088d/Untitled.png)

```xml
<RichTextBlock SelectionHighlightColor="Green">
    <Paragraph>RichTextBlock provides a rich text display container that supports
        <Run FontStyle="Italic" FontWeight="Bold">formatted text</Run>,
        <Hyperlink NavigateUri="https://docs.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.Documents.Hyperlink">hyperlinks</Hyperlink>, inline images, and other rich content.</Paragraph>
    <Paragraph>RichTextBlock also supports a built-in overflow model.</Paragraph>
</RichTextBlock>
```

![Untitled](WInUI3%20RichTextBlock%20%E5%AF%8C%E6%96%87%E6%9C%AC%E6%A1%86%20b9eb0a960ff64fe5a64066666723088d/Untitled%201.png)

```xml
<Grid>
    <Grid.ColumnDefinitions>
        <ColumnDefinition/>
        <ColumnDefinition/>
        <ColumnDefinition/>
    <Grid.ColumnDefinitions>
    <RichTextBlock Grid.Column="0" OverflowContentTarget="{x:Bind firstOverflowContainer}" TextAlignment="Justify" Margin="12,0">
        <Paragraph>
            Linked text containers allow text which does not fit in one element to overflow into a different element on the page.
            Creative use of linked text containers enables basic multicolumn support and other advanced page layouts.
        </Paragraph>
    <!-- Additional content not shown. -->
    </RichTextBlock>
    <RichTextBlockOverflow x:Name="firstOverflowContainer" OverflowContentTarget="{x:Bind secondOverflowContainer}" Grid.Column="1" Margin="12,0"/>
    <RichTextBlockOverflow x:Name="secondOverflowContainer" Grid.Column="2" Margin="12,0"/>
</Grid>
```

![Untitled](WInUI3%20RichTextBlock%20%E5%AF%8C%E6%96%87%E6%9C%AC%E6%A1%86%20b9eb0a960ff64fe5a64066666723088d/Untitled%202.png)

```xml
<RichTextBlock x:Name="TextHighlightingRichTextBlock">
    <Paragraph>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua
    </Paragraph>
</RichTextBlock>
```

```csharp
private void HighlightColorCombobox_SelectionChanged(object sender, SelectionChangedEventArgs e)
{
    // Get color to use
    var selectedItem = (sender as ComboBox).SelectedItem as ComboBoxItem;
    var color = Colors.Yellow;
    switch (selectedItem.Content as string)
    {
        case "Yellow":
            color = Colors.Yellow;
            break;
        case "Red":
            color = Colors.Red;
            break;
        case "Blue":
            color = Colors.Blue;
            break;
    }

    // Get text range and highlighter
    TextRange textRange = new TextRange()
    {
        StartIndex = 28,
        Length = 11
    };
    TextHighlighter highlighter = new TextHighlighter()
    {
        Background = new SolidColorBrush(color),
        Ranges = { textRange }
    };

    // Switch texthighlighter
    TextHighlightingRichTextBlock.TextHighlighters.Clear();
    TextHighlightingRichTextBlock.TextHighlighters.Add(highlighter);
}
```

![Untitled](WInUI3%20RichTextBlock%20%E5%AF%8C%E6%96%87%E6%9C%AC%E6%A1%86%20b9eb0a960ff64fe5a64066666723088d/Untitled%203.png)
