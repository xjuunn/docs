# Bootstrap栅格系统

## 栅格系统

### 栅格系统简介

**栅格系统**英文为“grid systems”，也有人翻译为网格系统，它是指将页面布局划分为等宽的列，然后通过列数的定义来模块化页面布局。

Bootstrap提供了一套响应式、移动设备优先的流式栅格系统，随着屏幕或视口（viewport）尺寸的增加，系统会自动分为最多12列。

Bootstrap里面container宽度式固定的，但是在不同的屏幕下，container的宽度不同。

### 栅格选项参数

栅格系统用于通过一系列的行（row）于列（column）的组合来创建页面布局

[Untitled](Bootstrap%E6%A0%85%E6%A0%BC%E7%B3%BB%E7%BB%9F%205ef7b41a4bbc408387aae4486c42f12a/Untitled%20Database%203939ac5d1b054b2396b5dddf603996aa.csv)

- 行必须放到container布局容器里面
- 实现平均划分，需要给列添加类前缀
- xs-extra small:超小；sm-small:小；md-medium:中等；lg-large:大；
- 列大于12，多余列所在的元素将作为一个整体另起一行排列
- 每一行默认有左右15像素的padding
- 可以同时为一列指定多个设备的类名，以便划分不同分数，例如class=“col-md-4 col-sm-6”

```html
<div class="col-lg-3 col-md-4 col-sm-6">1</div>
```

### 列嵌套

栅格系统内置的栅格系统将内容再次嵌套。简单理解就是一个列内再分成若干小列。我们可以通过添加一个新的.row元素和一系列.col-sm-* 元素到已存在的.col-sm-*元素内

列嵌套最好加一个row ，这样可以取消父元素的padding值，而且高度自动和父级一样高。

```html
<div class="col-sm-4">    <div class="row">        <div class="col-sm-6">小列</div>        <div class="col-sm-6">小列</div>    </div></div>
```

### 列偏移

使用.col-md=offset-* 类可以将列向右侧偏移。这些类世界式通过使用* 选择器为当前元素增加了左侧的边距（margin）。

### 列排序

通过使用.col-md-push-* 和.col-md-pull-* 可以很容易的改变列的顺序

```html
<div class="row">    <div class="col-lg-4 col-lg-push-8">左侧</div>    <div class="col-lg-8 col-lg-pull-4">右侧</div></div>
```

### 响应式工具

为了加快对移动设备友好的页面开发工具，利用媒体查询功能，并使用这些工具类可以方便的针对不同设备展示或隐藏页面的内容。

- hidden-xs 超小屏隐藏
- hidden-sm 小屏隐藏
- hidden-md 中屏隐藏
- hidden-lg 大屏隐藏

与之相反的，是visible-xs visible-sm visible-lg 是显示某个页面内容
