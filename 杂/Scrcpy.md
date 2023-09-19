[TOC]



# Scrcpy（v1.22）

***scr**een **c**o**py***

### 运行

~~~ shell
scrcpy
~~~

### 查看帮助

~~~ shell
scrcpy --help
~~~





-----

## 功能

### 采集设置

#### 分辨率

降低镜像的分辨率来提高性能。要同时限制宽度喝高度两个值。

```shell
scrcpy --max-size 1024
scrcpy -m 1024  # 简写
```

另一边会被按比例缩小以保持设备的显示比例。这样，1920×1080 分辨率的设备会以 1024×576 的分辨率进行镜像。

#### 码率

默认为**8Mbps**。

~~~ shell
scrcpy --bit-rate 2M
scrcpy -b 2M  # 简写
~~~

#### 帧率

```shell
scrcpy --max-fps 15
```

#### 画面裁剪

~~~ shell
scrcpy --crop 1224:1440:0:0   # 以 (0,0) 为原点的 1224x1440 像素
~~~

如果同时指定了 `--max-size`，会先进行裁剪，再进行缩放。

#### 锁定屏幕方向

~~~ shell
scrcpy --lock-video-orientation     # 初始（目前）方向
scrcpy --lock-video-orientation=0   # 自然方向
scrcpy --lock-video-orientation=1   # 逆时针旋转 90°
scrcpy --lock-video-orientation=2   # 180°
scrcpy --lock-video-orientation=3   # 顺时针旋转 90°
~~~

#### 编码器

~~~ shell
scrcpy --encoder OMX.qcom.video.encoder.avc
~~~

要列出可用的编码器，可以指定一个不存在的编码器名称，错误信息中会包含所有的编码器：

```shell
scrcpy --encoder _
```

#### 屏幕录制

~~~ shell
scrcpy --record file.mp4
scrcpy -r file.mkv
~~~

仅录制，不显示镜像。

~~~ shell
scrcpy --no-display --record file.mp4
scrcpy -Nr file.mkv
# 按 Ctrl+C 停止录制
~~~

录制时会包含“被跳过的帧”，即使它们由于性能原因没有实时显示。设备会为每一帧打上 *时间戳* ，所以 [包时延抖动](https://en.wikipedia.org/wiki/Packet_delay_variation) 不会影响录制的文件。

#### 缓冲

可以加入缓冲，会增加延迟，但可以减少抖动

对于显示缓冲：

```shell
scrcpy --display-buffer=50  # 为显示增加 50 毫秒的缓冲
```

### 连接

#### TCP/IP

*Scrcpy* 使用 `adb` 与设备通信，并且 `adb` 支持通过 TCP/IP [连接](https://developer.android.com/studio/command-line/adb.html#wireless)到设备（设备必须连接与电脑相同的网络）。

~~~ shell
scrcpy --tcpip=192.168.1.1       # 默认端口是5555
scrcpy --tcpip=192.168.1.1:5555
~~~

如果adb TCP/IP（无线） 模式在某些设备上不被启用（或者你不知道IP地址），用USB连接设备，然后运行：

~~~ shell
scrcpy --tcpip    # 无需其他参数
~~~

这将会自动寻找设备IP地址，启用TCP/IP模式，然后在启动之前连接到设备。

或者，可以通过 `adb` 使用手动启用 TCP/IP 连接：

1.  将设备和电脑连接至同一 Wi-Fi。

2.  打开 设置 → 关于手机 → 状态信息，获取设备的 IP 地址，也可以执行以下的命令：

    ```shell
    adb shell ip route | awk '{print $9}'
    ```

3.  启用设备的网络 adb 功能：`adb tcpip 5555`。

4.  断开设备的 USB 连接。

5.  连接到您的设备：`adb connect DEVICE_IP:5555` *(将 `DEVICE_IP` 替换为设备 IP)*。

6.  正常运行 `scrcpy`。

### 多设备

如果 `adb devices` 列出了多个设备，您必须指定设备的 *序列号* ：

~~~ shell
scrcpy --serial 0123456789abcdef
scrcpy -s 0123456789abcdef  # 简写
~~~

如果设备通过 TCP/IP 连接：

~~~ shell
scrcpy --serial 192.168.0.1:5555
scrcpy -s 192.168.0.1:5555  # 简写
~~~

可以同时启动多个 *scrcpy* 实例以同时显示多个设备的画面。

#### 在设备连接时自动启动

可以使用 [AutoAdb](https://github.com/rom1v/autoadb):

```shell
autoadb scrcpy -s '{}'
```

### 远程



### 窗口设置

#### 标题

~~~ shell
scrcpy --window-title "我的设备"
~~~

#### 位置和大小

~~~ shell
scrcpy --window-x 100 --window-y 100 --window-width 800 --window-height 600
~~~

#### 无边框

~~~ shell
scrcpy --window-borderless
~~~

#### 置顶

~~~ shell
scrcpy --always-on-top
~~~

#### 全屏启动

~~~ shell
scrcpy --fullscreen
scrcpy -f  # 简写
~~~

全屏状态可以通过 MOD+f 随时切换。

#### 旋转窗口

~~~ shell
scrcpy --rotation 1
~~~

-   `0`: 无旋转
-   `1`: 逆时针旋转 90°
-   `2`: 旋转 180°
-   `3`: 顺时针旋转 90°

### 其他

#### 只读模式

禁用电脑对设备的控制（键盘输入，鼠标事件，文件拖放等）

~~~ shell
scrcpy --no-control
scrcpy -n
~~~

#### 显示屏

如果有多个显示屏，可以选择要镜像的显示屏：

~~~ shell
scrcpy --display 1
~~~

列出所有显示屏的id：

~~~ shell
adb shell dumpsys display   # 在输出中搜索 “mDisplayId=”
~~~

#### 保持常亮

~~~ shell
scrcpy --stay-awake
scrcpy -w
~~~

#### 关闭设备屏幕

~~~ shell
scrcpy --turn-screen-off
scrcpy -S
~~~

#### 退出时息屏

~~~ shell
scrcpy --turn-screen-off --stay-awake
scrcpy -Sw
~~~

#### 显示触摸

~~~ shell
scrcpy --show-touches
scrcpy -t
~~~

只能显示物理触摸（手指在屏幕上触摸）

#### 关闭屏保

~~~ shell
scrcpy --disable-screensaver
~~~

## 输入控制

### 复制粘贴

 ### 双指缩放

### 文件拖放

#### 安装APK

拖放的scrcpy窗口安装

#### 文件推送至设备

`/sdcard/Download/`

修改文件保存目录

~~~ shell
scrcpy --push-target=/sdcard/Movies/
~~~

## 快捷键

在以下列表中, MOD 是快捷键的修饰键。 默认是 (左) Alt 或 (左) Super。

您可以使用 `--shortcut-mod` 来修改。可选的按键有 `lctrl`、`rctrl`、`lalt`、`ralt`、`lsuper` 和 `rsuper`。例如：

```
# 使用右 Ctrl 键
scrcpy --shortcut-mod=rctrl

# 使用左 Ctrl 键 + 左 Alt 键，或 Super 键
scrcpy --shortcut-mod=lctrl+lalt,lsuper
```

*[Super](https://en.wikipedia.org/wiki/Super_key_(keyboard_button)) 键通常是指 Windows 或 Cmd 键。*

| 操作                              | 快捷键                                                       |
| --------------------------------- | ------------------------------------------------------------ |
| 全屏                              | MOD+f                                                        |
| 向左旋转屏幕                      | MOD+← *(左箭头)*                                             |
| 向右旋转屏幕                      | MOD+→ *(右箭头)*                                             |
| 将窗口大小重置为1:1 (匹配像素)    | MOD+g                                                        |
| 将窗口大小重置为消除黑边          | MOD+w \| *双击左键¹*                                         |
| 点按 `主屏幕`                     | MOD+h \| *中键*                                              |
| 点按 `返回`                       | MOD+b \| *右键²*                                             |
| 点按 `切换应用`                   | MOD+s \| *第4键³*                                            |
| 点按 `菜单` (解锁屏幕)⁴           | MOD+m                                                        |
| 点按 `音量+`                      | MOD+↑ *(上箭头)*                                             |
| 点按 `音量-`                      | MOD+↓ *(下箭头)*                                             |
| 点按 `电源`                       | MOD+p                                                        |
| 打开屏幕                          | *鼠标右键²*                                                  |
| 关闭设备屏幕 (但继续在电脑上显示) | MOD+o                                                        |
| 打开设备屏幕                      | MOD+Shift+o                                                  |
| 旋转设备屏幕                      | MOD+r                                                        |
| 展开通知面板                      | MOD+n \| *第5键³*                                            |
| 展开设置面板                      | MOD+n+n \| *双击第5键³*                                      |
| 收起通知面板                      | MOD+Shift+n                                                  |
| 复制到剪贴板⁵                     | MOD+c                                                        |
| 剪切到剪贴板⁵                     | MOD+x                                                        |
| 同步剪贴板并粘贴⁵                 | MOD+v                                                        |
| 注入电脑剪贴板文本                | MOD+Shift+v                                                  |
| 打开/关闭FPS显示 (至标准输出)     | MOD+i                                                        |
| 捏拉缩放                          | Ctrl+*按住并移动鼠标*                                        |
| 拖放 APK 文件                     | 从电脑安装 APK 文件                                          |
| 拖放非 APK 文件                   | [将文件推送至设备](https://github.com/Genymobile/scrcpy/wiki/README.zh-Hans#push-file-to-device) |

*¹双击黑边可以去除黑边。*
*²点击鼠标右键将在屏幕熄灭时点亮屏幕，其余情况则视为按下返回键 。*
*³鼠标的第4键和第5键。*
*⁴对于开发中的 react-native 应用程序，`MENU` 触发开发菜单。*
*⁵需要安卓版本 Android >= 7。*

有重复按键的快捷键通过松开再按下一个按键来进行，如“展开设置面板”：

1.  按下 MOD 不放。
2.  双击 n。
3.  松开 MOD。

所有的 Ctrl+*按键* 的快捷键都会被转发到设备，所以会由当前应用程序进行处理。





































