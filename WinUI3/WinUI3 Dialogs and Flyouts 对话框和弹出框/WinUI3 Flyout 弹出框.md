# WinUI3 Flyout 弹出框

```csharp
<Button Content="Empty cart">
    <Button.Flyout>
        <Flyout>
            <StackPanel>
                <TextBlock Style="{ThemeResource BaseTextBlockStyle}" Text="All items will be removed. Do you want to continue?" Margin="0,0,0,12" />
                <Button Click="DeleteConfirmation_Click" Content="Yes, empty my cart" />
            </StackPanel>
        </Flyout>
    </Button.Flyout>
</Button>
```

![Untitled](WinUI3%20Flyout%20%E5%BC%B9%E5%87%BA%E6%A1%86%2056bb020984ab4faf9f701ee2039aa837/Untitled.png)
