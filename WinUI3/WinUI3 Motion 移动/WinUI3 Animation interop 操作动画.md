# WinUI3 Animation interop 操作动画

```csharp
Compositor _compositor = App.CurrentWindow.Compositor;
SpringVector3NaturalMotionAnimation _springAnimation;

private void CreateOrUpdateSpringAnimation(float finalValue)
{
    if (_springAnimation == null)
    {
        _springAnimation = _compositor.CreateSpringVector3Animation();
        _springAnimation.Target = "Scale";
    }

    _springAnimation.FinalValue = new Vector3(finalValue);
}

private void element_PointerEntered(object sender, PointerRoutedEventArgs e)
{
    // Scale up to 1.5
    CreateOrUpdateSpringAnimation(1.5f);

    (sender as UIElement).StartAnimation(_springAnimation);
}

private void element_PointerExited(object sender, PointerRoutedEventArgs e)
{
    // Scale back down to 1.0
    CreateOrUpdateSpringAnimation(1.0f);

    (sender as UIElement).StartAnimation(_springAnimation);
}
```

# 在其他元素上表现动画

```xml
// NOTE: The rectangle scales up and down using the same element_PointerEntered/Exited events as the prior sample.

// Set up the relationship between the rectangle and the ellipse.
private void ExpressionSample_Loaded(object sender, RoutedEventArgs e)
{
    var expressionAnim = _compositor.CreateExpressionAnimation();

    // The ellipse's scale is inversely proportional to the rectangle's scale
    expressionAnim.Expression = "Vector3(1/scaleElement.Scale.X, 1/scaleElement.Scale.Y, 1)";
    expressionAnim.Target = "Scale";

    // Use SetExpressionReferenceParameter to alias a UIElement into the expression string
    expressionAnim.SetExpressionReferenceParameter("scaleElement", rectangle);

    // Start the animation on the ellipse
    ellipse.StartAnimation(expressionAnim);
}
```

![Untitled](WinUI3%20Animation%20interop%20%E6%93%8D%E4%BD%9C%E5%8A%A8%E7%94%BB%208b490a7353ba45ed866ef693fb1d88a1/Untitled.png)

# 使用表现力动画将几个相关动画一起驱动

```csharp
// NOTE: Each of the buttons scale up and down using the same element_PointerEntered/Exited events as the prior samples.

private void StackedButtonsExample_Loaded(object sender, RoutedEventArgs e)
{
    // Animate the translation of each button relative to the scale and translation of the button above.
    var anim = _compositor.CreateExpressionAnimation();
    anim.Expression = "(above.Scale.Y - 1) * 50 + above.Translation.Y % (50 * index)";
    anim.Target = "Translation.Y";

    // Animate the second button relative to the first.
    anim.SetExpressionReferenceParameter("above", ExpressionButton1);
    anim.SetScalarParameter("index", 1);
    ExpressionButton2.StartAnimation(anim);

    // Animate the third button relative to the second.
    anim.SetExpressionReferenceParameter("above", ExpressionButton2);
    anim.SetScalarParameter("index", 2);
    ExpressionButton3.StartAnimation(anim);

    // Animate the fourth button relative to the third.
    anim.SetExpressionReferenceParameter("above", ExpressionButton3);
    anim.SetScalarParameter("index", 3);
    ExpressionButton4.StartAnimation(anim);
}
```

![Untitled](WinUI3%20Animation%20interop%20%E6%93%8D%E4%BD%9C%E5%8A%A8%E7%94%BB%208b490a7353ba45ed866ef693fb1d88a1/Untitled%201.png)
