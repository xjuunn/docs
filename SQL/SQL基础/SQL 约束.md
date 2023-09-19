# SQL 约束

### 约束

- 检查约束：定义取值范围 check
- 主键约束：唯一、非空 primary key
- 非空约束：不能为空值 not null
- 默认约束：添加新纪录，default 如果没有指定值的时候自动填充默认值
- 唯一约束：限定值必须是唯一，unique可以为空值
- 外键约束：两个表之间的约束关系 foreign key
    
    A int FOREIGN KEY REFERENCES B(C)，表示 A字段 依赖于B表的 C字段
