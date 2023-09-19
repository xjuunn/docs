# WinUI3 AutoSuggestBox 建议框

```xml
<AutoSuggestBox TextChanged="AutoSuggestBox_TextChanged"
                SuggestionChosen="AutoSuggestBox_SuggestionChosen"
                Width="300" AutomationProperties.Name="Basic AutoSuggestBox"/>
```

```csharp
// List of cats
private List<string> Cats = new List<string>()
{
    "Abyssinian",
    "Aegean",
    "American Bobtail",
    ...
};

// Handle text change and present suitable items
private void AutoSuggestBox_TextChanged(AutoSuggestBox sender, AutoSuggestBoxTextChangedEventArgs args)
{
    // Since selecting an item will also change the text,
    // only listen to changes caused by user entering text.
    if(args.Reason == AutoSuggestionBoxTextChangeReason.UserInput)
    {
        var suitableItems = new List<string>();
        var splitText = sender.Text.ToLower().Split(" ");
        foreach(var cat in Cats)
        {
            var found = splitText.All((key)=>
            {
                return cat.ToLower().Contains(key);
            });
            if(found)
            {
                suitableItems.Add(cat);
            }
        }
        if(suitableItems.Count == 0)
        {
            suitableItems.Add("No results found");
        }
        sender.ItemsSource = suitableItems;
    }
}

// Handle user selecting an item, in our case just output the selected item.
private void AutoSuggestBox_SuggestionChosen(AutoSuggestBox sender, AutoSuggestBoxSuggestionChosenEventArgs args)
{
    SuggestionOutput.Text = args.SelectedItem.ToString();
}
```

![Untitled](WinUI3%20AutoSuggestBox%20%E5%BB%BA%E8%AE%AE%E6%A1%86%20d40d4034b5964042a3e88c6584593d3f/Untitled.png)

```xml
<AutoSuggestBox PlaceholderText="Type a control name"
        TextChanged="Control2_TextChanged"
        QueryIcon="Find"
        QuerySubmitted="Control2_QuerySubmitted"
        SuggestionChosen="Control2_SuggestionChosen"/>
```

![Untitled](WinUI3%20AutoSuggestBox%20%E5%BB%BA%E8%AE%AE%E6%A1%86%20d40d4034b5964042a3e88c6584593d3f/Untitled%201.png)
