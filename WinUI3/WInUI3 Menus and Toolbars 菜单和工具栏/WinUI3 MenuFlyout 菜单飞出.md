# WinUI3 MenuFlyout 菜单飞出

```xml
<AppBarButton Icon="Sort" IsCompact="True" ToolTipService.ToolTip="Sort" AutomationProperties.Name="Sort">
    <AppBarButton.Flyout>
        <MenuFlyout>
            <MenuFlyoutItem Text="By rating" Click="MenuFlyoutItem_Click" Tag="rating"/>
            <MenuFlyoutItem Text="By match" Click="MenuFlyoutItem_Click" Tag="match"/>
            <MenuFlyoutItem Text="By distance" Click="MenuFlyoutItem_Click" Tag="distance"/>
        </MenuFlyout>
    </AppBarButton.Flyout>
</AppBarButton>
```

![Untitled](WinUI3%20MenuFlyout%20%E8%8F%9C%E5%8D%95%E9%A3%9E%E5%87%BA%201d55076222d44cf3a93d32bb5299c1fb/Untitled.png)

# 菜单和切换按钮选项

```xml
<Button Content="Options">
    <Button.Flyout>
        <MenuFlyout>
            <MenuFlyoutItem Text="Reset"/>
            <MenuFlyoutSeparator/>
            <ToggleMenuFlyoutItem Text="Repeat" IsChecked="True"/>
            <ToggleMenuFlyoutItem Text="Shuffle" IsChecked="True"/>
        </MenuFlyout>
    </Button.Flyout>
</Button>
```

![Untitled](WinUI3%20MenuFlyout%20%E8%8F%9C%E5%8D%95%E9%A3%9E%E5%87%BA%201d55076222d44cf3a93d32bb5299c1fb/Untitled%201.png)

# 多级菜单

```xml
<Button Content="File Options">
    <Button.Flyout>
        <MenuFlyout>
            <MenuFlyoutItem Text="Open"/>
            <MenuFlyoutSubItem Text="Send to">
                <MenuFlyoutItem Text="Bluetooth" />
                <MenuFlyoutItem Text="Desktop (shortcut)" />
                <MenuFlyoutSubItem Text="Compressed file">
                    <MenuFlyoutItem Text="Compress and email" />
                    <MenuFlyoutItem Text="Compress to .7z" />
                    <MenuFlyoutItem Text="Compress to .zip" />
                </MenuFlyoutSubItem>
            </MenuFlyoutSubItem>
        </MenuFlyout>
    </Button.Flyout>
</Button>
```

![Untitled](WinUI3%20MenuFlyout%20%E8%8F%9C%E5%8D%95%E9%A3%9E%E5%87%BA%201d55076222d44cf3a93d32bb5299c1fb/Untitled%202.png)

# 带有图标

```xml
<Button Content="Edit Options">
    <Button.Flyout>
        <MenuFlyout>
            <MenuFlyoutItem Text="Share">
                <MenuFlyoutItem.Icon>
                    <FontIcon Glyph="&#xE72D;"/>
                </MenuFlyoutItem.Icon>
            </MenuFlyoutItem>
            <MenuFlyoutItem Text="Copy" Icon="Copy"/>
            <MenuFlyoutItem Text="Delete" Icon="Delete"/>
            <MenuFlyoutSeparator/>
            <MenuFlyoutItem Text="Rename"/>
            <MenuFlyoutItem Text="Select"/>
        </MenuFlyout>
    </Button.Flyout>
</Button>
```

![Untitled](WinUI3%20MenuFlyout%20%E8%8F%9C%E5%8D%95%E9%A3%9E%E5%87%BA%201d55076222d44cf3a93d32bb5299c1fb/Untitled%203.png)

# 带有快捷键

```xml
<Button Content="Edit Options">
    <Button.Flyout>
        <MenuFlyout>
            <MenuFlyoutItem Text="Share">
                <MenuFlyoutItem.Icon>
                    <FontIcon Glyph="&#xE72D;"/>
                </MenuFlyoutItem.Icon>
                <MenuFlyoutItem.KeyboardAccelerators>
                    <KeyboardAccelerator Key="S" Modifiers="Control"/>
                </MenuFlyoutItem.KeyboardAccelerators>
            </MenuFlyoutItem>
            <MenuFlyoutItem Text="Copy" Icon="Copy">
                <MenuFlyoutItem.KeyboardAccelerators>
                    <KeyboardAccelerator Key="C" Modifiers="Control"/>
                </MenuFlyoutItem.KeyboardAccelerators>
            </MenuFlyoutItem>
            <MenuFlyoutItem Text="Delete" Icon="Delete">
                <MenuFlyoutItem.KeyboardAccelerators>
                    <KeyboardAccelerator Key="Delete" />
                </MenuFlyoutItem.KeyboardAccelerators>
            </MenuFlyoutItem>
            <MenuFlyoutSeparator/>
            <MenuFlyoutItem Text="Rename"/>
            <MenuFlyoutItem Text="Select"/>
        </MenuFlyout>
    </Button.Flyout>
</Button>
```

![Untitled](WinUI3%20MenuFlyout%20%E8%8F%9C%E5%8D%95%E9%A3%9E%E5%87%BA%201d55076222d44cf3a93d32bb5299c1fb/Untitled%204.png)
