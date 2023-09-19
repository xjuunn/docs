# ASP 验证控件

- 必须项验证控件
- 比较验证控件
- 范围验证控件
- 正则表达式验证控件
- 自定义验证控件
- 验证摘要控件
- 指定验证组
- 禁用验证控件

---

验证控件包括5种用于进行比较的控件和一种用于显示所有验证控件错误信息的摘要控件。

[Untitled](ASP%20%E9%AA%8C%E8%AF%81%E6%8E%A7%E4%BB%B6%200e601d2dc48e499c868119d54a3aa302/Untitled%20Database%2051b7f4bc2bbd4a3a99dd76ecc337b9fa.csv)

[Untitled](ASP%20%E9%AA%8C%E8%AF%81%E6%8E%A7%E4%BB%B6%200e601d2dc48e499c868119d54a3aa302/Untitled%20Database%207d53a5f4c1a14185b39e13d7f5d9dd58.csv)

### RequiredFieldValldator控件常用的属性

[Untitled](ASP%20%E9%AA%8C%E8%AF%81%E6%8E%A7%E4%BB%B6%200e601d2dc48e499c868119d54a3aa302/Untitled%20Database%207ace7ae1dd194f06b7004ddf8a6c4e0a.csv)

*验证控件被放在界面上，属性值就不能为空*

---

### 比较验证控件

[Untitled](ASP%20%E9%AA%8C%E8%AF%81%E6%8E%A7%E4%BB%B6%200e601d2dc48e499c868119d54a3aa302/Untitled%20Database%20c20d80ef2eb148a7a5d96bcb1a90f029.csv)

### 验证摘要控件

将页面中所有验证控件的提示信息集中起来

- 所有的验证控件，当设置Text属性，不管有没有设置ErrotMessage时，在验证控件新题提示的地方为Text的值
- 所有的验证控件，当没有设置Text属性，不管有没有设置ErrotMessage时，在验证控件新题提示的地方为ErrorMessage的值
- 所有的验证控件，当同设置Text属性和ErrorMessage属性时，页面有ValidationSummary，则该验证控件只显示所有验证控件的ErrorMessage的值

### 指定验证组

- 所有的验证控件，和按钮都具备同样的属性VaslidationGroup，如果要分组验证，只需要将此属性设置为同一组即可

### 禁用验证控件

1. CauseValidation false
2. 禁用验证控件 Enable false
3. 禁用客户端验证 EnableClientScript false
