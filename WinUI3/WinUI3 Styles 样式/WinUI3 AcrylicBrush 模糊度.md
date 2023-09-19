# WinUI3 AcrylicBrush 模糊度

```xml
<Rectangle Fill="{ThemeResource AcrylicInAppFillColorDefaultBrush}" />
```

![Untitled](WinUI3%20AcrylicBrush%20%E6%A8%A1%E7%B3%8A%E5%BA%A6%2026ca8e87332e4b7f889e9d2ba8a586cc/Untitled.png)

```xml
<Rectangle Fill="{ThemeResource AcrylicBackgroundFillColorDefaultBrush}" />
```

![Untitled](WinUI3%20AcrylicBrush%20%E6%A8%A1%E7%B3%8A%E5%BA%A6%2026ca8e87332e4b7f889e9d2ba8a586cc/Untitled%201.png)

```xml
<Rectangle Fill="{ThemeResource CustomAcrylicInAppBrush}" />

<ResourceDictionary x:Key="Default">
    <media:AcrylicBrush x:Key="CustomAcrylicBrush"
            TintOpacity="0.5600000265985727" TintColor="#FF000000" FallbackColor="#FF008000" />
</ResourceDictionary>
```

![Untitled](WinUI3%20AcrylicBrush%20%E6%A8%A1%E7%B3%8A%E5%BA%A6%2026ca8e87332e4b7f889e9d2ba8a586cc/Untitled%202.png)

```xml
<Rectangle Fill="{ThemeResource CustomAcrylicInAppLuminosity}" />

<ResourceDictionary x:Key="Default">
    <media:AcrylicBrush x:Key="CustomAcrylicInAppLuminosity"
            TintOpacity="0.7200000341981649" TintLuminosityOpacity="0.8" TintColor="SkyBlue" FallbackColor="SkyBlue" />
</ResourceDictionary>
```

![Untitled](WinUI3%20AcrylicBrush%20%E6%A8%A1%E7%B3%8A%E5%BA%A6%2026ca8e87332e4b7f889e9d2ba8a586cc/Untitled%203.png)
