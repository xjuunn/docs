# WInUI3 PasswordBox 密码框

```xml
<PasswordBox Width="300" AutomationProperties.Name="Simple PasswordBox"/>
```

![Untitled](WInUI3%20PasswordBox%20%E5%AF%86%E7%A0%81%E6%A1%86%20f5d15dc149454d489fac9b84ce35b4f8/Untitled.png)

```xml
<PasswordBox Width="300" Header="Password" PlaceholderText="Enter your password" PasswordChar="#" />
```

![Untitled](WInUI3%20PasswordBox%20%E5%AF%86%E7%A0%81%E6%A1%86%20f5d15dc149454d489fac9b84ce35b4f8/Untitled%201.png)

# 可见模式

```xml
<PasswordBox Name="passworBoxWithRevealmode" Width="250" Margin="0,0,8,0"
    PasswordRevealMode="Hidden" AutomationProperties.Name="Sample password box"/>
<CheckBox Name="revealModeCheckBox" Content="Show password" IsChecked="False"
    Checked="RevealModeCheckbox_Changed" Unchecked="RevealModeCheckbox_Changed"/>
```

```csharp
private void RevealModeCheckbox_Changed(object sender, RoutedEventArgs e)
{
    if (revealModeCheckBox.IsChecked == true)
    {
        passworBoxWithRevealmode.PasswordRevealMode = PasswordRevealMode.Visible;
    }
    else
    {
        passworBoxWithRevealmode.PasswordRevealMode = PasswordRevealMode.Hidden;
    }
}
```

![Untitled](WInUI3%20PasswordBox%20%E5%AF%86%E7%A0%81%E6%A1%86%20f5d15dc149454d489fac9b84ce35b4f8/Untitled%202.png)

![Untitled](WInUI3%20PasswordBox%20%E5%AF%86%E7%A0%81%E6%A1%86%20f5d15dc149454d489fac9b84ce35b4f8/Untitled%203.png)
