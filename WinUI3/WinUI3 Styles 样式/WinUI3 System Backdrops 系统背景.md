# WinUI3 System Backdrops 系统背景

```csharp
using System.Runtime.InteropServices; // For DllImport
using WinRT; // required to support Window.As<ICompositionSupportsSystemBackdrop>()

WindowsSystemDispatcherQueueHelper m_wsdqHelper; // See separate sample below for implementation
Microsoft.UI.Composition.SystemBackdrops.MicaController m_micaController;
Microsoft.UI.Composition.SystemBackdrops.SystemBackdropConfiguration m_configurationSource;

bool TrySetMicaBackdrop()
{
    if (Microsoft.UI.Composition.SystemBackdrops.MicaController.IsSupported())
    {
        m_wsdqHelper = new WindowsSystemDispatcherQueueHelper();
        m_wsdqHelper.EnsureWindowsSystemDispatcherQueueController();

        // Hooking up the policy object
        m_configurationSource = new Microsoft.UI.Composition.SystemBackdrops.SystemBackdropConfiguration();
        this.Activated += Window_Activated;
        this.Closed += Window_Closed;
        ((FrameworkElement)this.Content).ActualThemeChanged += Window_ThemeChanged;

        // Initial configuration state.
        m_configurationSource.IsInputActive = true;
        SetConfigurationSourceTheme();

        m_micaController = new Microsoft.UI.Composition.SystemBackdrops.MicaController();

        // Enable the system backdrop.
        // Note: Be sure to have "using WinRT;" to support the Window.As<...>() call.
        m_micaController.AddSystemBackdropTarget(this.As<Microsoft.UI.Composition.ICompositionSupportsSystemBackdrop>());
        m_micaController.SetSystemBackdropConfiguration(m_configurationSource);
        return true; // succeeded
    }

    return false; // Mica is not supported on this system
}

private void Window_Activated(object sender, WindowActivatedEventArgs args)
{
    m_configurationSource.IsInputActive = args.WindowActivationState != WindowActivationState.Deactivated;
}

private void Window_Closed(object sender, WindowEventArgs args)
{
    // Make sure any Mica/Acrylic controller is disposed so it doesn't try to
    // use this closed window.
    if (m_micaController != null)
    {
        m_micaController.Dispose();
        m_micaController = null;
    }
    this.Activated -= Window_Activated;
    m_configurationSource = null;
}

private void Window_ThemeChanged(FrameworkElement sender, object args)
{
    if (m_configurationSource != null)
    {
        SetConfigurationSourceTheme();
    }
}

private void SetConfigurationSourceTheme();
{
    switch (((FrameworkElement)this.Content).ActualTheme)
    {
        case ElementTheme.Dark:    m_configurationSource.Theme = Microsoft.UI.Composition.SystemBackdrops.SystemBackdropTheme.Dark; break;
        case ElementTheme.Light:   m_configurationSource.Theme = Microsoft.UI.Composition.SystemBackdrops.SystemBackdropTheme.Light; break;
        case ElementTheme.Default: m_configurationSource.Theme = Microsoft.UI.Composition.SystemBackdrops.SystemBackdropTheme.Default; break;
    }
}

```

![Untitled](WinUI3%20System%20Backdrops%20%E7%B3%BB%E7%BB%9F%E8%83%8C%E6%99%AF%209080d538d5f64936ae2c15c4fda846d4/Untitled.png)

```csharp
using System.Runtime.InteropServices; // For DllImport
using WinRT; // required to support Window.As<ICompositionSupportsSystemBackdrop>()

WindowsSystemDispatcherQueueHelper m_wsdqHelper; // See separate sample below for implementation
Microsoft.UI.Composition.SystemBackdrops.MicaController m_micaController;
Microsoft.UI.Composition.SystemBackdrops.DesktopAcrylicController m_acrylicController;
Microsoft.UI.Composition.SystemBackdrops.SystemBackdropConfiguration m_configurationSource;

bool TrySetAcrylicBackdrop()
{
    if (Microsoft.UI.Composition.SystemBackdrops.DesktopAcrylicController.IsSupported())
    {
        m_wsdqHelper = new WindowsSystemDispatcherQueueHelper();
        m_wsdqHelper.EnsureWindowsSystemDispatcherQueueController();

        // Hooking up the policy object
        m_configurationSource = new Microsoft.UI.Composition.SystemBackdrops.SystemBackdropConfiguration();
        this.Activated += Window_Activated;
        this.Closed += Window_Closed;
        ((FrameworkElement)this.Content).ActualThemeChanged += Window_ThemeChanged;

        // Initial configuration state.
        m_configurationSource.IsInputActive = true;
        SetConfigurationSourceTheme();

        m_acrylicController = new Microsoft.UI.Composition.SystemBackdrops.DesktopAcrylicController();

        // Enable the system backdrop.
        // Note: Be sure to have "using WinRT;" to support the Window.As<...>() call.
        m_acrylicController.AddSystemBackdropTarget(this.As<Microsoft.UI.Composition.ICompositionSupportsSystemBackdrop>());
        m_acrylicController.SetSystemBackdropConfiguration(m_configurationSource);
        return true; // succeeded
    }

    return false; // Acrylic is not supported on this system
}

private void Window_Activated(object sender, WindowActivatedEventArgs args)
{
    m_configurationSource.IsInputActive = args.WindowActivationState != WindowActivationState.Deactivated;
}

private void Window_Closed(object sender, WindowEventArgs args)
{
    // Make sure any Mica/Acrylic controller is disposed so it doesn't try to
    // use this closed window.
    if (m_acrylicController != null)
    {
        m_acrylicController.Dispose();
        m_acrylicController = null;
    }
    this.Activated -= Window_Activated;
    m_configurationSource = null;
}

private void Window_ThemeChanged(FrameworkElement sender, object args)
{
    if (m_configurationSource != null)
    {
        SetConfigurationSourceTheme();
    }
}

private void SetConfigurationSourceTheme()
{
    switch (((FrameworkElement)this.Content).ActualTheme)
    {
        case ElementTheme.Dark:    m_configurationSource.Theme = Microsoft.UI.Composition.SystemBackdrops.SystemBackdropTheme.Dark; break;
        case ElementTheme.Light:   m_configurationSource.Theme = Microsoft.UI.Composition.SystemBackdrops.SystemBackdropTheme.Light; break;
        case ElementTheme.Default: m_configurationSource.Theme = Microsoft.UI.Composition.SystemBackdrops.SystemBackdropTheme.Default; break;
    }
}
```

![Untitled](WinUI3%20System%20Backdrops%20%E7%B3%BB%E7%BB%9F%E8%83%8C%E6%99%AF%209080d538d5f64936ae2c15c4fda846d4/Untitled%201.png)
