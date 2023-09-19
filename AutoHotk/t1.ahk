!f::
{
    Run "Edge"
}
!k::
{
    Run "CMD"
}
!t::
{
    Run "Typora"
}
!y::
{
    Run "网易云音乐"
}
!q::
{
    Run "QQ"
}
!w::
{
    Run "微信"
}
:*:color1::
{
    URL :="www.toptal.com/designers/colourcode/quad-color-builder"
    Run "Chrome.lnk --app=https://" . URL
    URL := StrReplace(URL, "/", "_/",0,,1)
    WinWait URL
    WinMove 100,400,800,550
}
:*:color2::
{
    URL :="www.happyhues.co/"
    Run "Chrome.lnk --app=https://" . URL
    URL := StrReplace(URL, "/", "_/",0,,1)
    WinWait URL
    WinMove 400,400,800,600
}
:*:color3::
{
    URL :="colorsupplyyy.com/app"
    Run "Chrome.lnk --app=https://" . URL
    URL := StrReplace(URL, "/", "_/",0,,1)
    WinWait URL
    WinMove 250,40,800,1000
}
:*:fanyi1::
{
    URL :="fanyi.youdao.com/"
    Run "Chrome.lnk --app=https://" . URL
    URL := StrReplace(URL, "/", "_/",0,,1)
    WinWait URL
    WinMove 60,500,1000,500
}
:*:draw1::
{
    URL :="excalidraw.com/"
    Run "Chrome.lnk --app=https://" . URL
    URL := StrReplace(URL, "/", "_/",0,,1)
    WinWait URL
    WinMove 100,100,1400,800
}




























