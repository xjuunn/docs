# WinUI3 RichEditBox 富文本编辑框

```csharp
<RichEditBox x:Name="editor" AutomationProperties.Name="simple text editor"/
```

![Untitled](WinUI3%20RichEditBox%20%E5%AF%8C%E6%96%87%E6%9C%AC%E7%BC%96%E8%BE%91%E6%A1%86%20fa0520598c3845bfb6d88c74f0ebd5a0/Untitled.png)

# 添加其他按钮

```xml
<RichEditBox x:Name="REBCustom"
    AutomationProperties.Name="editor with custom menu"
    Width="800" Height="200"
    Loaded="REBCustom_Loaded"
    Unloaded="REBCustom_Unloaded"/>
```

```csharp
private void Menu_Opening(object sender, object e)
{
    CommandBarFlyout myFlyout = sender as CommandBarFlyout;
    if (myFlyout.Target == REBCustom)
    {
        AppBarButton myButton = new AppBarButton();
        myButton.Command = new StandardUICommand(StandardUICommandKind.Share);
        myFlyout.PrimaryCommands.Add(myButton);
    }
}

private void REBCustom_Loaded(object sender, RoutedEventArgs e)
{
    REBCustom.SelectionFlyout.Opening += Menu_Opening;
    REBCustom.ContextFlyout.Opening += Menu_Opening;
}

private void REBCustom_Unloaded(object sender, RoutedEventArgs e)
{
    REBCustom.SelectionFlyout.Opening -= Menu_Opening;
    REBCustom.ContextFlyout.Opening -= Menu_Opening;
}
```

# 自定义编辑器

```xml
<RelativePanel Margin="0,0,0,20" HorizontalAlignment="Stretch">
    <RelativePanel.Resources>
        <Style TargetType="Button">
            <Setter Property="BorderThickness" Value="0" />
            <Setter Property="Background" Value="Transparent"/>
            <Setter Property="Margin" Value="0,0,8,0" />
        </Style>
    </RelativePanel.Resources>
    <Button x:Name="openFileButton" Click="OpenButton_Click" AutomationProperties.Name="Open file" ToolTipService.ToolTip="Open file">
        <Button.Content>
            <FontIcon FontFamily="Segoe MDL2 Assets" Glyph="&#xE8E5;"/>
        </Button.Content>
    </Button>
    <Button Click="SaveButton_Click" AutomationProperties.Name="Save file" ToolTipService.ToolTip="Save file"
            RelativePanel.RightOf="openFileButton">
        <Button.Content>
            <FontIcon FontFamily="Segoe MDL2 Assets" Glyph="&#xE74E;"/>
        </Button.Content>
    </Button>
    <Button AutomationProperties.Name="Bold" ToolTipService.ToolTip="Bold" Click="BoldButton_Click"
            RelativePanel.LeftOf="italicButton" >
        <Button.Content>
            <FontIcon FontFamily="Segoe MDL2 Assets" Glyph="&#xE8DD;"/>
        </Button.Content>
    </Button>
    <Button x:Name="italicButton" Click="ItalicButton_Click" AutomationProperties.Name="Italic" ToolTipService.ToolTip="Italic"
            RelativePanel.LeftOf="fontColorButton">
        <Button.Content>
            <FontIcon FontFamily="Segoe MDL2 Assets" Glyph="&#xE8DB;"/>
        </Button.Content>
    </Button>

    <DropDownButton x:Name="fontColorButton" AutomationProperties.Name="Font color"
                                BorderThickness="0" ToolTipService.ToolTip="Font color"
                                Background="Transparent"
                                RelativePanel.AlignRightWithPanel="True">
        <SymbolIcon Symbol="FontColor"/>
        <DropDownButton.Flyout>
            <Flyout Placement="Bottom">
                <VariableSizedWrapGrid Orientation="Horizontal" MaximumRowsOrColumns="3">
                    <VariableSizedWrapGrid.Resources>
                        <Style TargetType="Rectangle">
                            <Setter Property="Width" Value="32"/>
                            <Setter Property="Height" Value="32"/>
                        </Style>
                        <Style TargetType="Button">
                            <Setter Property="Padding" Value="0"/>
                            <Setter Property="MinWidth" Value="0"/>
                            <Setter Property="MinHeight" Value="0"/>
                            <Setter Property="Margin" Value="6"/>
                        </Style>
                    </VariableSizedWrapGrid.Resources>
                    <Button Click="ColorButton_Click" AutomationProperties.Name="Red">
                        <Button.Content>
                            <Rectangle Fill="Red"/>
                        </Button.Content>
                    </Button>
                    <Button Click="ColorButton_Click" AutomationProperties.Name="Orange">
                        <Button.Content>
                            <Rectangle Fill="Orange"/>
                        </Button.Content>
                    </Button>
                    <Button Click="ColorButton_Click" AutomationProperties.Name="Yellow">
                        <Button.Content>
                            <Rectangle Fill="Yellow"/>
                        </Button.Content>
                    </Button>
                    <Button Click="ColorButton_Click" AutomationProperties.Name="Green">
                        <Button.Content>
                            <Rectangle Fill="Green"/>
                        </Button.Content>
                    </Button>
                    <Button Click="ColorButton_Click" AutomationProperties.Name="Blue">
                        <Button.Content>
                            <Rectangle Fill="Blue"/>
                        </Button.Content>
                    </Button>
                    <Button Click="ColorButton_Click" AutomationProperties.Name="Indigo">
                        <Button.Content>
                            <Rectangle Fill="Indigo"/>
                        </Button.Content>
                    </Button>
                    <Button Click="ColorButton_Click" AutomationProperties.Name="Violet">
                        <Button.Content>
                            <Rectangle Fill="Violet"/>
                        </Button.Content>
                    </Button>
                    <Button Click="ColorButton_Click" AutomationProperties.Name="Gray">
                        <Button.Content>
                            <Rectangle Fill="Gray"/>
                        </Button.Content>
                    </Button>
                </VariableSizedWrapGrid>
            </Flyout>
        </DropDownButton.Flyout>
    </DropDownButton>

    <RichEditBox x:Name="editor" Height="200" AutomationProperties.Name="Custom editor"
                    RelativePanel.Below="openFileButton"
                    RelativePanel.AlignLeftWithPanel="True"
                    RelativePanel.AlignRightWithPanel="True"
                    TextChanged="Editor_TextChanged"
                    GotFocus="Editor_GotFocus"/>
    <StackPanel Orientation="Horizontal"
                RelativePanel.Below="editor"
                RelativePanel.AlignLeftWith="editor"
                Margin="0,10,0,0">
        <TextBlock x:Name="findBoxLabel" Text="Find:" Height="20"/>
        <TextBox x:Name="findBox" Width="150" PlaceholderText="Enter search text" Margin="10,0,0,0"
                TextChanged="{x:Bind FindBoxHighlightMatches}"
                GotFocus="{x:Bind FindBoxHighlightMatches}"
                LostFocus="{x:Bind FindBoxRemoveHighlights}"/>
    </StackPanel>
</RelativePanel>
```

```csharp
private async void OpenButton_Click(object sender, RoutedEventArgs e)
{
    // Open a text file.
    Windows.Storage.Pickers.FileOpenPicker open =
        new Windows.Storage.Pickers.FileOpenPicker();
    open.SuggestedStartLocation =
        Windows.Storage.Pickers.PickerLocationId.DocumentsLibrary;
    open.FileTypeFilter.Add(".rtf");

    Windows.Storage.StorageFile file = await open.PickSingleFileAsync();

    if (file != null)
    {
        using (Windows.Storage.Streams.IRandomAccessStream randAccStream =
            await file.OpenAsync(Windows.Storage.FileAccessMode.Read))
        {
            // Load the file into the Document property of the RichEditBox.
            editor.Document.LoadFromStream(Microsoft.UI.Text.TextSetOptions.FormatRtf, randAccStream);
        }
    }
}

private async void SaveButton_Click(object sender, RoutedEventArgs e)
{
    FileSavePicker savePicker = new FileSavePicker();
    savePicker.SuggestedStartLocation = PickerLocationId.DocumentsLibrary;

    // Dropdown of file types the user can save the file as
    savePicker.FileTypeChoices.Add("Rich Text", new List<string>() { ".rtf" });

    // Default file name if the user does not type one in or select a file to replace
    savePicker.SuggestedFileName = "New Document";

    StorageFile file = await savePicker.PickSaveFileAsync();
    if (file != null)
    {
        // Prevent updates to the remote version of the file until we
        // finish making changes and call CompleteUpdatesAsync.
        CachedFileManager.DeferUpdates(file);
        // write to file
        using (Windows.Storage.Streams.IRandomAccessStream randAccStream =
            await file.OpenAsync(Windows.Storage.FileAccessMode.ReadWrite))
        {
            editor.Document.SaveToStream(Microsoft.UI.Text.TextGetOptions.FormatRtf, randAccStream);
        }

        // Let Windows know that we're finished changing the file so the
        // other app can update the remote version of the file.
        FileUpdateStatus status = await CachedFileManager.CompleteUpdatesAsync(file);
        if (status != FileUpdateStatus.Complete)
        {
            Windows.UI.Popups.MessageDialog errorBox =
                new Windows.UI.Popups.MessageDialog("File " + file.Name + " couldn't be saved.");
            await errorBox.ShowAsync();
        }
    }
}

private void BoldButton_Click(object sender, RoutedEventArgs e)
{
    editor.Document.Selection.CharacterFormat.Bold = FormatEffect.Toggle;
}

private void ItalicButton_Click(object sender, RoutedEventArgs e)
{
    editor.Document.Selection.CharacterFormat.Italic = FormatEffect.Toggle;
}

private void ColorButton_Click(object sender, RoutedEventArgs e)
{
    // Extract the color of the button that was clicked.
    Button clickedColor = (Button)sender;
    var rectangle = (Microsoft.UI.Xaml.Shapes.Rectangle)clickedColor.Content;
    var color = ((Microsoft.UI.Xaml.Media.SolidColorBrush)rectangle.Fill).Color;

    editor.Document.Selection.CharacterFormat.ForegroundColor = color;

    fontColorButton.Flyout.Hide();
    editor.Focus(Microsoft.UI.Xaml.FocusState.Keyboard);
}

private void FindBoxHighlightMatches()
{
    FindBoxRemoveHighlights();

    Color highlightBackgroundColor = (Color)App.Current.Resources["SystemColorHighlightColor"];
    Color highlightForegroundColor = (Color)App.Current.Resources["SystemColorHighlightTextColor"];

    string textToFind = findBox.Text;
    if (textToFind != null)
    {
        ITextRange searchRange = editor.Document.GetRange(0, 0);
        while (searchRange.FindText(textToFind, TextConstants.MaxUnitCount, FindOptions.None) > 0)
        {
            searchRange.CharacterFormat.BackgroundColor = highlightBackgroundColor;
            searchRange.CharacterFormat.ForegroundColor = highlightForegroundColor;
        }
    }
}

private void FindBoxRemoveHighlights()
{
    ITextRange documentRange = editor.Document.GetRange(0, TextConstants.MaxUnitCount);
    SolidColorBrush defaultBackground = editor.Background as SolidColorBrush;
    SolidColorBrush defaultForeground = editor.Foreground as SolidColorBrush;

    documentRange.CharacterFormat.BackgroundColor = defaultBackground.Color;
    documentRange.CharacterFormat.ForegroundColor = defaultForeground.Color;
}

private void Editor_GotFocus(object sender, RoutedEventArgs e)
{
    editor.Document.GetText(TextGetOptions.UseCrlf, out string currentRawText);

    // reset colors to correct defaults for Focused state
    ITextRange documentRange = editor.Document.GetRange(0, TextConstants.MaxUnitCount);
    SolidColorBrush background = (SolidColorBrush)App.Current.Resources["TextControlBackgroundFocused"];

    if (background != null)
    {
        documentRange.CharacterFormat.BackgroundColor = background.Color;
    }
}

private void Editor_TextChanged(object sender, RoutedEventArgs e)
{
    editor.Document.Selection.CharacterFormat.ForegroundColor = currentColor;
}
```

![Untitled](WinUI3%20RichEditBox%20%E5%AF%8C%E6%96%87%E6%9C%AC%E7%BC%96%E8%BE%91%E6%A1%86%20fa0520598c3845bfb6d88c74f0ebd5a0/Untitled%201.png)
