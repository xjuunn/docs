# WinUI3 SplitButton 拆分按钮

```xml
<SplitButton x:Name="myColorButton" Click="myColorButton_Click">
    <Border x:Name="CurrentColor" Width="32" Height="32" Background="Green" CornerRadius="4,0,0,4"/>
    <SplitButton.Flyout>
        <Flyout Placement="Bottom">
            <!-- flyout content -->
						<ToggleSwitch AutomationProperties.Name="simple ToggleSwitch"/>
        </Flyout>
    </SplitButton.Flyout>
</SplitButton>
```

![Untitled](WinUI3%20SplitButton%20%E6%8B%86%E5%88%86%E6%8C%89%E9%92%AE%2017762873f40b4f2094f48aaa56184566/Untitled.png)

```xml
<SplitButton x:Name="myColorButton">
    Choose color
    <SplitButton.Flyout>
        <Flyout Placement="Bottom">
            <!-- flyout content -->
        </Flyout>
    </SplitButton.Flyout>
</SplitButton>
```
