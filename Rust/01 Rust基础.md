[toc]

# Rust 基础

## 变量

Rust变量默认是不可变的，可以用mut关键字让变量变得可变

``` rust
fn main(){
    let x = 15; // 不可变
    let mut y = 20; // 可变
}
```

>   如果创建了一个变量，但是没有在任何地方使用，Rust会发出一个警告，因为这可能是一个bug。如果希望告诉Rust不要警告这个未使用的变量，可以使用下划线作为变量名的开头。
>
>   ~~~ rust
>   fn main(){
>       let x = 5; // 警告
>       let _y = 5; // 不警告
>   }
>   ~~~

### 变量解构

从一个相对复杂的变量中，匹配出该变量的一部分内容

~~~ rust
fn main(){
    let (a,mut b):(bool,bool) = (true,false);
    println!("a={?},b={?}",a,b);
    
    b = true;
    assert_eq!(a,b);
}
~~~

### 解构赋值

可以在赋值语句左式中使用元组，切片和结构体模式了。

~~~ rust
struct Struct{
    e:i32
}
fn main(){
    let (a,b,c,d,e);
    (a,b) = (1,2);
    // _ 代表匹配一个值，但是不关心具体的值是什么
    [c,..,d,_] = [1,2,3,4,5];
    Struct {e,..} = Struct(e:5);
    assert_eq!([1,2,1,4,5],[a,b,c,d,e]);
}
~~~

>   <kbd>+=</kbd>的赋值语句还不支持解构赋值

 ### 常量

~~~ rust
cosnt MAX_POINTS:u32 = 100_000;
~~~

### 变量遮蔽

Rust允许声明相同的变量名，后面声明的变量会遮蔽掉前面的声明。

~~~ rust
fn main(){
    let x = 5;
    // 在main函数的坐于与内对之前的x进行遮蔽
    let x = x+1;
    {
        let x = x+2;
        println!("{}",x);
    }
    println("{}",x);
}
~~~

输出  12   6

这和mut变量的使用是不同的，使用let生成了一个完全不同的新变量，两个变量只是恰好拥有同样的名称，涉及一次内存对象的再分配。

## 基本类型

*   数值类型：有符号整数(i8,i16,i32,i64,isize)、无符号整数(u8,u16,u32,u64,usize)、浮点数(f32,f64)、以及有理数、复数
*   字符串：字符串字面量和字符串切片&str
*   布尔类型：true和false
*   字符类型：表示单个Unicode字符，存储为四个字节
*   单元类型：即(),其唯一的值也是()

### 类型推导与标注

Rust是一门静态类型的语言，编译器必须在编译期直到所有变量的类型，Rust会根据变量的值和上下文中使用方式，自动推导出变量的类型，但在某些情况下，需要手动介于一个类型标注。

~~~ rust
lst guess = "42".parse().expect("Not a number");
~~~

这段代码的目的是将字符串“42”进行解析，而编译器无法推导出想要什么类型，因此编译器会报错

因此要提供给编译器更多的信息，例如给变量一个显示的类型标注：`let guess:i32 = ...` 或者 `“42.parse::<i32>()”`。

### 数值类型

#### 整数类型

整数是没有小数部分的数字。i32表示有符号的32位整数，Rust默认使用i32

>   isize和usize类型取决于程序运行的计算机CPU类型：若CPU是32位的，则这两个类型是32位的，若CPU是64位的，那么它们则是64位的

#### 浮点类型

浮点类型是带有小数点的数字，默认是f64

#### NaN

对于数学上未定义的结果，例如对负数取平方根，会产生一个特殊的结果：Rust的浮点数类型使用NaN(not a number)来处理这些情况。

所有跟NaN交互的操作都会返回一个NaN，而且NaN不能用来比较，会使代码崩溃。

出于防御性编程的考虑，可以使用is_nan()等方法，可以判断一个数是不是NaN

~~~ rust
fn main(){
    let x = (-42.0_f32).sqrt();
    if x.is_nan() {
        println!("未定义的数字行为");
    }
}
~~~

#### 序列（Range）

Rust提供了一个非常简洁的方式，用来生成连续的数值，例如1..5，生成从1到4的连续数字，不包含5；1..=5，生成1到5的连续数字，包含5

~~~ rust
for i in 1..=5 {
    println!("{}",i);
}
~~~

>   序列只允许用于数字火字符的类型，原因是他们连续

### 单元类型

单元类型就是()，唯一的值也是()。

main函数的返回值就是单元类型()，可以用()作为map的值，表示不关注具体的值，只关注key，可以作为一个值用来占位，但是不占用任何内存。

### 表达式

表达式进行求值，然后返回一个值，例如`6+5`，在求值后返回值11，因此他就是一个表达式。

>   表达式不能包含分号
>
>   如果表达式不返回任何值，则隐式返回（）

~~~ rust
fn main() {
    assert_eq!(ret_unit_type(), ())
}

fn ret_unit_type() {
    let x = 1;
    // if 语句块也是一个表达式，因此可以用于赋值，也可以直接返回
    // 类似三元运算符，在Rust里我们可以这样写
    let y = if x % 2 == 1 {
        "odd"
    } else {
        "even"
    };
    // 或者写成一行
    let z = if x % 2 == 1 { "odd" } else { "even" };
}
~~~

### 函数

~~~ rust
fn add(i: i32, j: i32) -> i32 {
   i + j
 }
~~~

*   函数名和变量名使用蛇形命名法，例如fn add_two() -> {}
*   函数的位置可以随便放，Rust不关心在哪里定义了函数，只要定义了即可。
*   每个函数参数都需要标注类型。

#### 返回值

函数的最后一行表达式作为返回值，但是也可以用return关键字提前返回

## 所有权

程序释放内存的方式

*   垃圾回收机制(GC):在程序运行时不断寻找不再使用的内存（java，GO）
*   手动管理内存的分配和释放:在程序中，通过调用的方式来申请和释放内存（C++）
*   通过所有权来管理内存:编译器在编译时会根据一系列规则进行检查（Rust）

所有权原则

1.   Rust中每一个值都被一个变量所拥有，该变量被称为值得所有者
2.   一个值同时只能被一个变量所拥有，或者说一个值只能拥有一个所有者
3.   当所有者(变量)离开作用域范围时，这个值将被丢第

~~~ rust
let s1 = String::from("hello");
let s2 = s1;
~~~

当s1被赋予给s2后，rust认为s1不在有效，因此把所有权从s1转移给了s2，s1马上失效。

### 函数传值与返回

~~~ rust
fn main(){
    let s = String::from("hello"); // s进入作用域
    takes_overship(s); // s 的值移动到函数里。后面s将不再有效
    let x = 5；// x 进入作用域
    makes_copy(x); // 但是i32是copy的，所以后面可以继续使用
} // 这里，x先移出作用域，然后是s，但是s的值已经被移走，所以不会有特殊操作
fn takes_overship(some_string:String){ // some_string
    println!("{}",some_string);
} // 这里some_string 移出作用域并调用drop方法，占用的内存被释放
fn makes_copy(some_integer:i32) { // some_integer进入作用域
    println!("{}",some_integer);
} // some_integer移出作用域，不会有特殊操作
~~~

返回值也有所有权

~~~ rust
fn main() {
    let s1 = gives_ownership(); // gives_ovnership 将返回值移给s1
    let s2 = String::from("hello"); // s2进入作用域
    let s3 = takes_and_gives_back(s2); // s2被移动到takes_and_gives_back 中，将返回值移给s3.
}  // s3移出作用域并被丢弃。s2也移出作用域，但已被移走，所以什么也不会发生。s2移出作用域被丢弃。
fn fives_ownership() -> String { // gives_ownership 将放回置移动给调用它的函数
    let some_string = String::from("hello"); // some_string 进入作用域
    some_string // 返回some_string并移出给调用的函数
}
// takes_and_gives_back 将传入字符串并返回改值
fn takes_and_gives_back(a_string:String) -> String { // a_string 进入作用域
    a_string // 返回a_string并移出给调用函数
}
~~~

所有权避免了内存的不安全性，但是，总把一个值传来传去来使用，让语言表达变得啰嗦。可以使用`引用与借用来解决`

## 引用与借用

获取某个变量的引用，称之为**借用**

### 引用与解引用

常规引用是一个指针类型，指向了对象存储的内存地址

~~~ rust
fn main() {
    let x = 5;
    let y = &x;
    assert_eq(5,x);
    assert_eq(5,*y);
}
~~~

变量x存放了一个i32值5.y是x的一个引用。使用\*y解出来的值(解引用)。一旦解引用了，就可以访问y所指向的整型值并可以与5做比较。

### 不可变引用

~~~ rust
fn main() {
    let s1 = String::from("hello");
    let len = calculate_length(&s1);
    println!("{} {}",s1,len);
}
fn calculate_length(s:&String) -> usize {
    s.len();
}
~~~

1.   无需先通过函数参数传入所有权，然后在通过函数返回传出所有权，代码更加简洁
2.   calculate_length 的参数 s 类型从String 变成 &String

>   [!caution]
>
>   但是无法通过这个引用，来<del>修改借用的变量</del>，因为这是一个不可变引用。
>
>   ~~~ rust
>   fn main() {
>       let s = String::from("hello");
>       change(&s);
>   }
>   fn change(some_string:&String) {
>       some_string.push_str(",world");
>   }
>   ~~~

### 可变引用

~~~ rust
fn main() {
	let mut s = String::from("hello");
    change(&mut s);
}
fn change(some_string:&mut String) {
    some_string.push_str(",world");
}
~~~

首先声明s是可变的类型，其次创建可变引用`&mut s`和接受可变引用参数`some_string:&mut String`的函数

==可变引用只能存在一个==，同一个作用域，特定的数据只能有一个可变引用

>   [!caution] 
>
>   ~~~ rust
>   let mut s = String::from("hello");
>   let r1 = &mut s;
>   let r2 = &mut s;
>   println!("{} {}",r1,r2);
>   ~~~

编译器这样做的原因是为了避免数据竞争

*   两个或更多的指针同时访问同一个数据
*   至少有一个指针被用来写入数据
*   没有同步数据访问的机制

手动限制变量的作用域，来避免数据竞争

~~~ rust
let mut s = String::from("hello");
{
    let r1 = &mut s;
} // 这里r1离开了作用域，所以完全可以创建一个新的引用
let r2 = &mut s;
~~~

==可变引用与不可变引用不能同时存在==

~~~ rust
let mut s = String::from("hello");
let r1 = &s;
let r2 = &s;
let r3 = &mut s; // 报错，无法借用可变，因为它已经被借用不可变
~~~

为了防止数据污染

>   [!tip]
>
>   在新的编译器中，引用作用域的结束未知冲花括号变成最后一次使用的位置。这种编译器优化行为，称为**NLL**(**Non-Lexical Lifetimes**)。因此，在不可变引用最后一次使用后，可以创建可变引用。

### 悬垂引用

悬垂引用也叫做悬垂指针，意思是指针指向某个值后，这个值被释放了，但是指针仍然存在，其指向的内存可能不存在任何值或者已经被其他变量使用。

~~~ rust
fn main() {
    let reference_to_noting = dangle();
}
fn dangle() -> &String {
    let s = String::from("hello");
    &s;
}
~~~

报错：该函数返回了一个借用的值，但是已经找不到它所借用值的来源

解决：

~~~ rust
fn no_dangle() -> String {
    let s = String::from("hello");
    s   // String的所有权被转移给外面的调用者
}
~~~

>   [!tip]
>
>   *   同一时刻，只能拥有要么一个可变引用，要么任意多个不可变引用
>   *   引用必须总是有效
