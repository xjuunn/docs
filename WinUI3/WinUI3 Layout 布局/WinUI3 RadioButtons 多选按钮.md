# WinUI3 RadioButtons 多选按钮

```xml
<RadioButtons x:Name="BackgroundRadioButtons" SelectedIndex="2"  MaxColumns="3" Header="Background" SelectionChanged="BackgroundColor_SelectionChanged">
    <x:String>Green</x:String>
    <x:String>Yellow</x:String>
    <x:String>White</x:String>
</RadioButtons>
<RadioButtons x:Name="BorderRadioButtons" SelectedIndex="2" MaxColumns="3" Header="Border" SelectionChanged="BorderBrush_SelectionChanged">
    <x:String>Green</x:String>
    <x:String>Yellow</x:String>
    <x:String>White</x:String>
</RadioButtons>

<Border x:Name="ControlOutput" BorderThickness="10" BorderBrush="#FFFFD700" Background="#FFFFFFFF"
        Height="50" Margin="0,10,0,10" />
```

```csharp
private void BackgroundColor_SelectionChanged(object sender, SelectionChangedEventArgs e)
{
    if (ControlOutput != null && sender is RadioButtons rb)
    {
        string colorName = rb.SelectedItem as string;
        switch (colorName)
        {
            case "Yellow":
                ControlOutput.Background = new SolidColorBrush(Colors.Yellow);
                break;
            case "Green":
                ControlOutput.Background = new SolidColorBrush(Colors.Green);
                break;
            case "White":
                ControlOutput.Background = new SolidColorBrush(Colors.White);
                break;
        }
    }
}

private void BorderBrush_SelectionChanged(object sender, SelectionChangedEventArgs e)
{
    if (ControlOutput != null && sender is RadioButtons rb)
    {
        string colorName = rb.SelectedItem as string;
        switch (colorName)
        {
            case "Yellow":
                ControlOutput.BorderBrush = new SolidColorBrush(Colors.Gold);
                break;
            case "Green":
                ControlOutput.BorderBrush = new SolidColorBrush(Colors.DarkGreen);
                break;
            case "White":
                ControlOutput.BorderBrush = new SolidColorBrush(Colors.White);
                break;
        }
    }
}
```

![Untitled](WinUI3%20RadioButtons%20%E5%A4%9A%E9%80%89%E6%8C%89%E9%92%AE%2088b35777c1e249f7a302157600dcf643/Untitled.png)
