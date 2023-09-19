# WinUI3 DropDownButton 下拉菜单

```xml
<DropDownButton Content="Email">
    <DropDownButton.Flyout>
        <MenuFlyout Placement="Bottom">
            <MenuFlyoutItem Text="Send"/>
            <MenuFlyoutItem Text="Reply"/>
            <MenuFlyoutItem Text="Reply All"/>
        </MenuFlyout>
    </DropDownButton.Flyout>
</DropDownButton>
```

![Untitled](WinUI3%20DropDownButton%20%E4%B8%8B%E6%8B%89%E8%8F%9C%E5%8D%95%209c7e2dabc66f4adfa196a41911182a8d/Untitled.png)

# 带图标的下拉菜单

```xml
<DropDownButton AutomationProperties.Name="Email">
    <DropDownButton.Content>
        <FontIcon FontFamily="Segoe MDL2 Assets" Glyph="&#xE715;"/>
    </DropDownButton.Content>
    <DropDownButton.Flyout>
        <MenuFlyout Placement="Bottom">
            <MenuFlyoutItem Text="Send">
                <MenuFlyoutItem.Icon>
                    <FontIcon FontFamily="Segoe MDL2 Assets" Glyph="&#xE725;"/>
                </MenuFlyoutItem.Icon>
            </MenuFlyoutItem>
            <MenuFlyoutItem Text="Reply">
                <MenuFlyoutItem.Icon>
                    <FontIcon FontFamily="Segoe MDL2 Assets" Glyph="&#xE8CA;"/>
                </MenuFlyoutItem.Icon>
            </MenuFlyoutItem>
            <MenuFlyoutItem Text="Reply All">
                <MenuFlyoutItem.Icon>
                    <FontIcon FontFamily="Segoe MDL2 Assets" Glyph="&#xE8C2;"/>
                </MenuFlyoutItem.Icon>
            </MenuFlyoutItem>
        </MenuFlyout>
    </DropDownButton.Flyout>
</DropDownButton>
```

![Untitled](WinUI3%20DropDownButton%20%E4%B8%8B%E6%8B%89%E8%8F%9C%E5%8D%95%209c7e2dabc66f4adfa196a41911182a8d/Untitled%201.png)
