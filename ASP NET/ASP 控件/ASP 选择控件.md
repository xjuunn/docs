# ASP 选择控件

### 选择控件

- RadioButton
- checkbox
- DropDownLise
- ListBox
- RadioButtonList
- CheckBoxList

### RadioButton

AutoPostBack 自动回发到服务器

### RadioButtonList

设置选中项 rbData.SelectedIndex = 4;

获取选中项 Button1.Text = rbDate.SelectedItem.Text;

获取选中项的值 Button1.Text = rbDate.SelectedValue;

添加和移除

itemrbDate.Items.Add(ListBox1.SelectedItem); rbDate.Items.Remove(ListBox1.SelectedItem);
