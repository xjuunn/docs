# AutoHotk

~~~json
^j::
{
    Send "My First Script" 
}
~~~

*   <kbd>\^j::</kbd>是一个热键,\^代表<kbd>ctrl</kbd>键，j是一个字母按键，任何在<kbd>::</kbd>左边的字符表示需要按下的热键。
*   Send “My first script” 表示如何Send按键，Send是函数，任何在空格后面括在引号的内容都会被键入。
*   { }表示热键的开始和结束。

## 热键和热字串

热键是用来触发某些动作的按键或组合键热字串

```
^j::
{
    Send "My First Script"
}
```

主要用于扩展缩写（自动替换），也可以用来启动任何脚本动作

```
::ftw::Free the whales
```

这两个例子的区别在于，当按下ctrl+j时，热键会触发，而热字串会将输入的ftw转换为free the whales

热键时用<kbd>::</kbd>创建的，按键名或组合键名必须在<kbd>::</kbd>的左边，代码则跟在后面，括在大括号里面。

热字串在要触发的文本两边各有一对冒号，替换后的文本在第二对冒号右边

热字串也可以启动脚本动作，和热键一样

```json
::btw::
{
    MsgBox "You typed btw."
}
```

## 键和其神秘符号

| 符号 | 描述                                               |
| :--: | :------------------------------------------------- |
|  #   | Win(Windows 徽标键)                                |
|  !   | Alt                                                |
|  ^   | Ctrl                                               |
|  +   | Shift                                              |
|  &   | 用于连接两个按键(含鼠标按键) 合并成一个自定义热键. |

### &

```json
Numpad0 & Numpad1::
{
    MsgBox "You pressed Numpad1 while holding down Numpad0."
}

Numpad0 & Numpad2::
{
    Run "notepad.exe"
}
```

## 特定窗口的热键/热字串

```json
#HotIf WinActive(窗口标题)
#HotIf WinExist(窗口标题)
```

```json
#HotIf WinActive("Untitled - Notepad")
#Space::
{
    MsgBox "You pressed WIN+SPACE in Notepad."
}
```

要关闭后续热键或热字串的上下文敏感性, 请指定 #HotIf 指令, 但不带参数

```json
; Untitled - Notepad
#HotIf WinActive("Untitled - Notepad")
!q::
{
    MsgBox "You pressed ALT+Q in Notepad."
}

; 任何标题不是无标题 - 记事本的窗口
#HotIf
!q::
{
    MsgBox "You pressed ALT+Q in any window."
}
```

## 一个文件包含读个热键/热字串

```json
#i::
{
    Run "https://www.google.com/"
}

^p::
{
    Run "notepad.exe"
}

~j::
{
    Send "ack"
}

:*:acheiv::achiev
::achievment::achievement
::acquaintence::acquaintance
:*:adquir::acquir
::aquisition::acquisition
:*:agravat::aggravat
:*:allign::align
::ameria::America
```

## eg

```
::btw::by the way  ; 当您按下一个默认的结束符时, 用"by the way"替换掉"btw".
```

```
::btw::by the way  ; 当您按下一个默认的结束符时, 用"by the way"替换掉"btw".
```

```
::btw::by the way  ; 当您按下一个默认的结束符时, 用"by the way"替换掉"btw".
```

```
::btw::by the way  ; 当您按下一个默认的结束符时, 用"by the way"替换掉"btw".
```

## 发送按键

| 符号 | 描述                                                         |
| :--: | :----------------------------------------------------------- |
|  !   | 发送 Alt 键. 例如, `Send "This is text!a"` 将发送按键序列 "This is text" 并接着按下 Alt+A. **注意**: `!A` 在某些程序中产生的效果与 `!a` 不同. 这是因为 `!A` 表示按下 Alt+Shift+A 而 `!a` 表示按下 Alt+A. 如果不确定, 请使用小写字母. |
|  +   | 发送 Shift 键. 例如, `Send "+abC"` 会发送文本 "AbC", 而 `Send "!+a"` 会按下 Alt+Shift+A. |
|  ^   | 发送 Ctrl(Ctrl) 键. 例如, `Send "^!a"` 会按下 Ctrl+Alt+A, 而 `Send "^{Home}"` 则发送 Ctrl+Home. **注意**: `^A` 在某些程序中产生与 `^a` 不同的效果. 这是因为 `^A` 表示按下 Ctrl+Shift+A 而 `^a` 表示按下 Ctrl+A. 如果不确定, 请使用小写字母. |
|  #   | 发送 Win 键(带有 Windows logo 的按键), 因此 `Send "#e"` 会在按住 Win 键时按下字母 "e". |

大括号中的！表示！

```
Send "This text has been typed{!}" ;  注意大括号中的感叹号? 这是因为, 如果没有 {}, AHK 将按下 Alt 键.
```

```
; 跟上面的例子类似, 只是这次是 Enter 键. AHK 将会输出 "Enter"
; 如果 Enter 没有加上 {} 的话.
Send "Multiple Enter lines have Enter been sent." ; 错误的
Send "Multiple{Enter}lines have{Enter}been sent." ; 正确的
```

想要表示按住或松开某个按键, 可以将这个键用花括号围起来, 同时加上单词 UP 或 DOWN.

```json
; 下面这个例子表示按下一个键的时候再按下另一个键(或多个键)..
; 如果其中一个方法不奏效, 试试另一个.
Send "^s"                     ; 表示发送 CTRL+S
Send "{Ctrl down}s{Ctrl up}"  ; 表示发送 CTRL+S
Send "{Ctrl down}c{Ctrl up}"
Send "{b down}{b up}"
Send "{Tab down}{Tab up}"
Send "{Up down}"  ; 按下向上键.
Sleep 1000        ; 保持 1 秒.
Send "{Up up}"    ; 然后松开向上键.
```

### 发送多行文本

```
Send "
(
Line 1
Line 2
Apples are a fruit.
)"
```

## 打开程序/网页

```
; 运行一个程序. 注意, 大部分的程序可能需要完整路径:
Run A_ProgramFiles "\Some_Program\Program.exe"

; 打开一个网址:
Run "https://www.autohotkey.com"
```

## 调用函数

典型的函数

```
Function(Parameter1, Parameter2, Parameter3) ; 带括号
Function Parameter1, Parameter2, Parameter3  ; 不带括号
```

参数支持任何类型的表达式

```
SubStr(37 * 12, 1, 2)
SubStr(A_Hour - 12, 2)
```

也可以在函数里面调用函数（这些函数调用必须用括号置顶，因为他们不在首行）

将函数的返回值赋给变量，最常见

~~~ 
MyVar := SubStr("I'm scripting, awesome!", 16)
~~~

<kbd>:=</kbd>赋值

## 变量

### 文本赋值

>   myVar := “Test”

### 获取用户输入

```
OutputVar := InputBox("What is your first name?", "Question 1").Value
if (OutputVar = "Bill")
    MsgBox "That's an awesome name, " OutputVar "."

OutputVar2 := InputBox("Do you like AutoHotkey?", "Question 2").Value
if (OutputVar2 = "yes")
    MsgBox "Thank you for answering " OutputVar2 ", " OutputVar "! We will become great friends."
else
    MsgBox OutputVar ", That makes me sad."
```

```
Var := "text"  ; 赋值一些文本给一个变量.
Num := 6  ; 赋值一个数字给一个变量.
Var2 := Var  ; 赋值一个变量给另一个.
Var3 .= Var  ; 追加一个变量到另一个的末尾.
Var4 += Num  ; 将变量的值与另一个相加.
Var4 -= Num  ; 将变量的值减去另一个.
Var5 := SubStr(Var, 2, 2)  ; 变量在函数中.
Var6 := Var "Text"  ; 赋值一个变量给另一个变量并带有一些额外的文本.
MsgBox(Var)  ; 变量在函数中.
MsgBox Var  ; 同上.
Var := StrSplit(Var, "x")  ; 变量在函数中, 用作 InputVar 和 OutputVar.
if (Num = 6)  ; 检查变量是否等于一个数字.
if Num = 6  ; 同上.
if (Var != Num)  ; 检查变量是否等于另一个.
if Var1 < Var2  ; 检查一个变量是否小于另一个变量.
```







