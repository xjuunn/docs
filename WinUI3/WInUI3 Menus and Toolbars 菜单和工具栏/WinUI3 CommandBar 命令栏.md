# WinUI3 CommandBar 命令栏

```xml
<CommandBar Background="Transparent" IsOpen="True" DefaultLabelPosition="Right" IsSticky="True" >
    <AppBarButton Icon="Add" Label="Add"/>
    <AppBarButton Icon="Edit" Label="Edit"/>
    <AppBarButton Icon="Share" Label="Share"/>
    <CommandBar.SecondaryCommands>
        <AppBarButton Icon="Setting" Label="Settings">
            <AppBarButton.KeyboardAccelerators>
                    <KeyboardAccelerator Modifiers="Control" Key="I" />
            </AppBarButton.KeyboardAccelerators>
        </AppBarButton>
        <AppBarButton Icon="Add" Label="Button 1">
            <AppBarButton.KeyboardAccelerators>
                    <KeyboardAccelerator Modifiers="Control" Key="N" />
            </AppBarButton.KeyboardAccelerators>
        </AppBarButton>
        <AppBarButton Icon="Delete" Label="Button 2">
            <AppBarButton.KeyboardAccelerators>
                    <KeyboardAccelerator Key="Delete" />
            </AppBarButton.KeyboardAccelerators>
        </AppBarButton>
        <AppBarSeparator />
        <AppBarButton Icon="FontDecrease" Label="Button 3">
            <AppBarButton.KeyboardAccelerators>
                    <KeyboardAccelerator Modifiers="Control" Key="Subtract" />
            </AppBarButton.KeyboardAccelerators>
        </AppBarButton>
        <AppBarButton Icon="FontIncrease" Label="Button 4">
            <AppBarButton.KeyboardAccelerators>
                    <KeyboardAccelerator Modifiers="Control" Key="Add" />
            </AppBarButton.KeyboardAccelerators>
        </AppBarButton>
    </CommandBar.SecondaryCommands>
</CommandBar>
```

![Untitled](WinUI3%20CommandBar%20%E5%91%BD%E4%BB%A4%E6%A0%8F%20de615767234b404ab75907312c8106a4/Untitled.png)
