# Bootstrap响应式开发

### 响应式开发

### 响应式开发原理

就是使用媒体查询针对不同宽度的设备进行布局和样式的设置，从而适配不同设备的目的。

[Untitled](Bootstrap%E5%93%8D%E5%BA%94%E5%BC%8F%E5%BC%80%E5%8F%91%20afcc3dd6f4504484bf6f8cbe9bb90c4b/Untitled%20Database%20d925ca79d41e4e89b8a66ffd13a59b4d.csv)

### 响应式布局容器

响应式需要一个父级作为布局容器，来配合子级元素老实现变化效果。

原理就是在不同屏幕下，通过媒体查询来改变这个布局容器的大小，再改变里面子元素的排列方式和大小，从而实现不同屏幕下，看到不同的页面布局和样式变化。

### 平时的响应式尺寸划分

- 超小屏幕（手机，小于768px）：设置宽度为100%
- 小屏幕（平板，小于等于768px）：设置宽度为750px
- 中等屏幕（桌面显示器，大于等于992px）：宽度设置为970px
- 大屏幕（大桌面显示器，大于等于1200px）：宽度设置为1170px

```css
<style>.container{ 
    height:150px;   
    background-color:pink;   
    margin:0 auto;
}
/*超小屏幕下，小于768，布局容器的宽度为100%*/
@media screen and (max-width:767px){
    .container{     
        width:100%;  
    }}
/*小屏幕下，大于等于768，布局容器改为750px */
@media screen and (min-width:768px){ 
    .container{     
        width:750px;    
    }}
/*中等屏幕下，大于等于992，布局容器修改为970px*/
@media screen and (min-width:992px){ 
    .container{      
        width:970px; 
    }}
/*大屏幕下，大于等于1200px，布局容器修改为1170px*/
@media screen and (min-width:1200px){  
    .container{     
        width:1  
    }}
</style>
```
