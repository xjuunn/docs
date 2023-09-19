# 表格控件DataGridView

### 常用属性

- AutoSizeColumnsMode 可见行自适应大小
- AutoSizeRowsMode 可见列自适应大小
- ColumnHeaderDefaultCellStyle 设置默认列标题样式
- Columns 获取一个集合，包含控件中的所有列
- DataSource 控件加载数据
- DefaultCellStyle 默认单元格样式
- MultiSelect 多选
- ReadOnly 只读
- RowHeadersDefaultCellStyle 行单元格样式
- SelectionMode用户选择模式 整行/整列

### 常用事件

- CellClick 单击单元格事件

```C#
dgv.Rows[i].Cell[j].Value;//选中第i行j列
DataGridView1[j,i].Value;//选中第i行j列
//获取选中行
int index = dev1.SelectedRows[0].Index;
int index2 = e.RowIndex;int row = dgv1.Rows[index];
var row = dgv1.CurrentRow;
row.Cells[i].Value.ToString();
```
