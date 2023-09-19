# WinUI3 Dialogs and Flyout 对话框和弹出按钮

```xml
<Page
    x:Class="AppUIBasics.ControlPages.ContentDialogContent"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml">

    <StackPanel VerticalAlignment="Stretch" HorizontalAlignment="Stretch">
        <!-- Content body -->
        <TextBlock Text="Lorem ipsum dolor sit amet, adipisicing elit." TextWrapping="Wrap" />
        <CheckBox Content="Upload your content to the cloud."/>
    </StackPanel>

</Page>
```

```csharp
private async void ShowDialog_Click(object sender, RoutedEventArgs e)
{
    ContentDialog dialog = new ContentDialog();

    // XamlRoot must be set in the case of a ContentDialog running in a Desktop app
    dialog.XamlRoot = this.XamlRoot;
    dialog.Style = Application.Current.Resources["DefaultContentDialogStyle"] as Style;
    dialog.Title = "Save your work?";
    dialog.PrimaryButtonText = "Save";
    dialog.SecondaryButtonText = "Don't Save";
    dialog.CloseButtonText = "Cancel";
    dialog.DefaultButton = ContentDialogButton.Primary;
    dialog.Content = new ContentDialogContent();

    var result = await dialog.ShowAsync();
}
```

![Untitled](WinUI3%20Dialogs%20and%20Flyout%20%E5%AF%B9%E8%AF%9D%E6%A1%86%E5%92%8C%E5%BC%B9%E5%87%BA%E6%8C%89%E9%92%AE%20b78725f3aa634443a117d3200f1b6996/Untitled.png)
