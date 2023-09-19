# WinUI3 Page Transitions 翻页动画

```xml
<Frame x:Name="ContentFrame">
    <Frame.ContentTransitions>
        <TransitionCollection>
            <NavigationThemeTransition  />
        </TransitionCollection>
    </Frame.ContentTransitions>
</Frame>
```

```csharp
ContentFrame.Navigate(typeof(SamplePage), null, new DrillInNavigationTransitionInfo());
```

![Untitled](WinUI3%20Page%20Transitions%20%E7%BF%BB%E9%A1%B5%E5%8A%A8%E7%94%BB%208d04677fc80043d8ada703ff5c28f7ae/Untitled.png)
