# WinUI3 InfoBar 信息条

```xml
<InfoBar
    IsOpen="True"
    Severity="Informational"
    Title="Title"
    Message="Essential app message for your users to be informed of, acknowledge, or take action on." />
```

Severity 等级

![Untitled](WinUI3%20InfoBar%20%E4%BF%A1%E6%81%AF%E6%9D%A1%20beda7246b86e4fd49c4e72ea72754401/Untitled.png)

# 可长可短，带开关和按钮

```xml
<InfoBar
    IsOpen="True"
    Title="Title"
    Message="A long essential app message..." >
		<!-- 按钮-->
    <InfoBar.ActionButton>
            <HyperlinkButton Content="Informational link" NavigateUri="https://www.example.com" />
    </InfoBar.ActionButton>
</InfoBar>
```

# 图标和关闭按钮

```xml
<InfoBar
    IsOpen="True"
    IsIconVisible="True"
    IsClosable="True"
    Title="Title"
    Message="Essential app message for your users to be informed of, acknowledge, or take action on." />
```

![Untitled](WinUI3%20InfoBar%20%E4%BF%A1%E6%81%AF%E6%9D%A1%20beda7246b86e4fd49c4e72ea72754401/Untitled%201.png)
