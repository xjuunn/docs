# WinUI3 RadialGradientBrush 径向渐变笔刷

```xml
<Rectangle Width="200" Height="200">
    <Rectangle.Fill>
        <media:RadialGradientBrush
                MappingMode="RelativeToBoundingBox"
                Center="0.5,0.5"
                RadiusX="0.5"
                RadiusY="0.5"
                GradientOrigin="0.5,0.5"
                SpreadMethod="Pad">
            <GradientStop Color="Yellow" Offset="0.0" />
            <GradientStop Color="Blue" Offset="1" />
        </media:RadialGradientBrush>
    </Rectangle.Fill>
</Rectangle>
```

![Untitled](WinUI3%20RadialGradientBrush%20%E5%BE%84%E5%90%91%E6%B8%90%E5%8F%98%E7%AC%94%E5%88%B7%20c2f46937afb64122b20796640fb0a074/Untitled.png)
