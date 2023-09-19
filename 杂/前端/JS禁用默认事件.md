# JS禁用默认事件

```jsx
//禁用右键菜单
document.addEventListener('contextmenu', function(e) {
     e.preventDefault();
});
//禁止选中文字
document.addEventListener('selectstart', function(e) {
      e.preventDefault();
});
```
