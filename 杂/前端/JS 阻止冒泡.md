# JS 阻止冒泡

```jsx
function maop(ele){
    if (ele.addEventListener) {
        ele.addEventListener('click', function () {
        });
    } else if (ele.attachEvent) {
        ele.attachEvent('onclick', function () {
        });
    }
}
```
