# ASP 杂

为表格第七列添加点击事件 
~~~ C#
//在数据表的RowDataBound事件中 
if(e.Row.RowType == DataControlRowType.DataRow){
    //判断当前行是否是数据行的类型 
    e.Row.Cells[7].Attributes.Add(“onclick”,“return confirm(‘确认删除吗？’)”)
}

~~~
