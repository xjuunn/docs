# jQuery发送AJAX请求

## jQuery中发送AJAX请求

```js
$('button').eq(0).click(function(){
    $.get('http://127.0.0.1:8080/jquery-server',{a:100,b:200},function(data){
        console.log(data);
    },'json');
});
```

```js
$('button').eq(1).click(function)(){
    $.ajax({
        url:'',//url
        data:{a:100,b:200},//参数
        type:'GET',//请求类型
        dataType:'json',//响应结果
        success:function(data){//成功的回调
            console.log(data);
        },
        timeout:2000,//超时时间
        error:function(){}//失败的回调
    });
}
```
