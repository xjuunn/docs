[toc]

<div style="text-align:center">
    <svg class="text-black dark:text-white block w-auto h-6" width="200" height="50" viewBox="0 0 800 200" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M377 200C379.16 200 381 198.209 381 196V103C381 103 386 112 395 127L434 194C435.785 197.74 439.744 200 443 200H470V50H443C441.202 50 439 51.4941 439 54V148L421 116L385 55C383.248 51.8912 379.479 50 376 50H350V200H377Z" fill="currentColor"></path><path d="M726 92H739C742.314 92 745 89.3137 745 86V60H773V92H800V116H773V159C773 169.5 778.057 174 787 174H800V200H783C759.948 200 745 185.071 745 160V116H726V92Z" fill="currentColor"></path><path d="M591 92V154C591 168.004 585.742 179.809 578 188C570.258 196.191 559.566 200 545 200C530.434 200 518.742 196.191 511 188C503.389 179.809 498 168.004 498 154V92H514C517.412 92 520.769 92.622 523 95C525.231 97.2459 526 98.5652 526 102V154C526 162.059 526.457 167.037 530 171C533.543 174.831 537.914 176 545 176C552.217 176 555.457 174.831 559 171C562.543 167.037 563 162.059 563 154V102C563 98.5652 563.769 96.378 566 94C567.96 91.9107 570.028 91.9599 573 92C573.411 92.0055 574.586 92 575 92H591Z" fill="currentColor"></path><path d="M676 144L710 92H684C680.723 92 677.812 93.1758 676 96L660 120L645 97C643.188 94.1758 639.277 92 636 92H611L645 143L608 200H634C637.25 200 640.182 196.787 642 194L660 167L679 195C680.818 197.787 683.75 200 687 200H713L676 144Z" fill="currentColor"></path><path d="M168 200H279C282.542 200 285.932 198.756 289 197C292.068 195.244 295.23 193.041 297 190C298.77 186.959 300.002 183.51 300 179.999C299.998 176.488 298.773 173.04 297 170.001L222 41C220.23 37.96 218.067 35.7552 215 34C211.933 32.2448 207.542 31 204 31C200.458 31 197.067 32.2448 194 34C190.933 35.7552 188.77 37.96 187 41L168 74L130 9.99764C128.228 6.95784 126.068 3.75491 123 2C119.932 0.245087 116.542 0 113 0C109.458 0 106.068 0.245087 103 2C99.9323 3.75491 96.7717 6.95784 95 9.99764L2 170.001C0.226979 173.04 0.00154312 176.488 1.90993e-06 179.999C-0.0015393 183.51 0.229648 186.959 2 190C3.77035 193.04 6.93245 195.244 10 197C13.0675 198.756 16.4578 200 20 200H90C117.737 200 137.925 187.558 152 164L186 105L204 74L259 168H186L168 200ZM89 168H40L113 42L150 105L125.491 147.725C116.144 163.01 105.488 168 89 168Z" fill="#00DC82"></path></svg>
</div>
# Nuxt

## 安装和运行

安装

~~~ shell
npx nuxi@latest init <project-name>
~~~

运行

~~~ shell
npm run dev
~~~

## 配置

nuxt.config.ts

~~~ ts
export default defineNuxtConfig({
    // ...
})
~~~

### 环境覆盖

可以在nuxt.config中配置完全类型化的环境覆盖

~~~ ts
export default defineNuxtConfig({
  $production: {
    routeRules: {
      '/**': { isr: true }
    }
  },
  $development: {
    //
  }
})
~~~

### 环境变量和私有令牌

生成时不确定的变量。

`runtimeConfig`API将环境变量等值公开给应用程序，默认情况下，这些密钥仅在服务器端可以用。其中`runtimeConfig.public`的密钥也可以在客户端使用。

这些值可以在环境变量中定义，并且可以使用环境变量进行覆盖。

nuxt.config.ts

~~~ ts
export default defineNuxtConfig({
    runtimeConfig:{
        apiSecret:"123",
        public: {
            apiBase:'/api'
        }
    }
})
~~~

.env

~~~
NUXT_APP_SECRET=api_secret_token  // 将会覆盖config中的值
~~~

这些变量将使用`useRuntimeConfig()`可组合

~~~ vue
<script>
	const runtimeConfig = useRuntimeConfig();
</script>
~~~

### 应用配置和约定

`app.config.ts`位与源目录中，用于公开可在生成时确定的公共变量。

app.config.ts

~~~ ts
export default defineAppConfig({
    title:'hello',
    theme:{
        dark:true,
        colors:{
            primary:"#ff0000"
        }
    }
})
~~~

~~~ vue
<script>
	const appConfig = useAppConfig();
</script>
~~~

[其他配置](https://nuxt.com/docs/getting-started/configuration)

### Views

*   app.vue 
*   组件 (components/)
*   页面 (pages/)
*   布局 (layouts/) [布局配置](https://nuxt.com/docs/guide/directory-structure/layouts)

### 扩展HTML模板

server/plugins/extend-html.ts

~~~ ts
export default defineNitroPlugin((nitroApp) => {
  nitroApp.hooks.hook('render:html', (html, { event }) => {
    console.log(html)
    html.head.push(`<meta name="description" content="My custom description" />`)
  })
  nitroApp.hooks.hook('render:response', (response, { event }) => { console.log(response) })
})

~~~

## 资源

Nuxt使用两个目录来处理样式表，字体或图像等资源

*   `public/`目录内容按照原样在服务器根目录下提供
*   `assets/`按照惯例，目录包含希望构建的工具(vite或wegbpack)处理的每个资源

### public/

`public/`目录作为静态资源公共服务器，这些资源在应用程序的自定义URL上公开可用。

例如，引用`public/img/`目录中的图像文件`img/nuxt.png`可以在静态URL上找到

~~~ vue
<template>
	<img src="/img/nuxt.png" alt="test"/>
</template>
~~~

### 资源目录

使用`assets/`目录来存储样式表、字体或SVG，但此目录没有自动扫描功能，可以为其使用任何其他名称

可以使用`~/assets/`来引用`assets/`目录

~~~ vue
<template>
	<img src="~/assets/img/nuxt.png" alt="test"/>
</template>
~~~

>   无法在静态资源中访问`/assets/`

### 全局样式引入

使用sass   assets/_colors.sass

~~~ scss
$primary: #49240F
$secondary: #E4A79D
~~~

nuxt.config

~~~ ts
export default defineNuxtConfig({
    vite: {
        css: {
            preprocessorOptions: {
                sass: {
                    additionalData:'@use "~/assets/_colors.sass" as *\n'
                }
            }
        }
    }
})
~~~

## 样式

### 本地样式

放置在`assets/`目录

### 在组件导入

~~~ vue
<script>
	import '~/assets/css/first.css';  // 静态导入
    import('~/assets/css/first.css');  // 动态导入
</script>
<style>
	@import url('~/assets/css/second.css')
</style>
~~~

>   样式表将内嵌在Nuxt呈现的HTML中

### 使用配置引入

将样式表放入`asstes/`目录中，可以在配置中引用其路径，Nuxt会自动将其包含在所有页面中

~~~ ts
export default defineNuxtConfig({
	css: ['~/assets/css/main.css']
})
~~~

>   全局注入，包含在所有页面中

### 使用字体

将字体放在`~/public/`目录中，使用`~/public/fonts`来引用他们

~~~ css
@font-face {
  font-family: 'FarAwayGalaxy';
  src: url('/fonts/FarAwayGalaxy.woff') format('woff');
  font-weight: normal;
  font-style: normal;
  font-display: swap;
}
~~~

使用

~~~ css
<style>
h1 {
  font-family: 'FarAwayGalaxy', sans-serif;
}
</style>
~~~

### 使用npm分发的样式表

~~~ shell
npm install animate.css
~~~

直接在页面中使用

~~~ vue
<script>
	import 'animate.css'
</script>
<style>
	@import url('animate.css')
</style>
~~~

也可以作为配置引入

~~~ ts
export default defineNuxtConfig({
    css: ['animate.css']
})
~~~

### 外部样式表

通过在nuxt.config文件的head部分添加link元素，可以在应用程序中包含外部样式表。

nuxt.config.ts

~~~ ts
export default defineNuxtConfig({
    app: {
        head: {
            link: [{rel: 'stylesheet',href:"https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"}]
        }
    }
})
~~~

### 动态添加样式表

可以使用useHead可组合项在代码中动态设置head中的值

~~~ ts
useHead({
    link: [{rel:'stylesheet',href:"https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"}]
})
~~~

### 使用Nitro插件修改渲染的头部

`~/server/plugins/my-plugin.ts`

~~~ ts
export default defineNitroPlugin((nitro)=>{
    nitro.hooks.hook('reder:html',(html)=>{
        html.head.push('<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">')
    })
})
~~~

### 使用预处理器

~~~ shell
npm install -D sass
~~~

编写样式的位置是`assets`，可以使用预处理器的语法将元文件导入到app.vue中

~~~ vue
<style lang="scss">
	@use "~/assets/scss/main.scss";
</style>
~~~

或者可以使用nuxt配置的属性

nuxt.config.ts

~~~ ts
export default defineNuxtConfig({
    css: ["~/assets/scss/main.scss"]
})
~~~

如果需要在预处理文件中注入代码，例如带有颜色的变量，可以使用vite预处理器选项来实现

assets/_colors.sass

~~~scss
$primary: #49240F
$secondary: #E4A79D
~~~

nuxt.config 

~~~ ts
export default defineNuxtConfig({
  vite: {
    css: {
      preprocessorOptions: {
        sass: {
          additionalData: '@use "~/assets/_colors.sass" as *\n'
        }
      }
    }
  }
})
~~~

## 路由

Nuxt文件系统为`pages/`目录中的每个文件创建一个路由。

### 导航

pages/app.vue

~~~vue
<template>
  <header>
    <nav>
      <ul>
        <li><NuxtLink to="/about">About</NuxtLink></li>
        <li><NuxtLink to="/posts/1">Post 1</NuxtLink></li>
        <li><NuxtLink to="/posts/2">Post 2</NuxtLink></li>
      </ul>
    </nav>
  </header>
</template>
~~~

### 路由参数

使用`useRoute()`选项可以在Vue组件的快或方法中使用，可以访问当前路由的详细信息

pages/posts/[id].vue

~~~ vue
<script setup lang="ts">
const route = useRoute()
console.log(route.params.id)
</script>
~~~

### 路由中间件

路由中间件由三种

1.   匿名(内联)路由中间件，直接在使用他们的页面中定义。
2.   命名路由中间件，它们放置在`middleware/`目录中，并在页面上使用时通过异步导入自动加载。（路由中间件名称已规范化为大小写，因此 someMiddleware 变成了 some-middleware）
3.   全局路由中间件，它们放置在`middleware/`目录，带`.global`后缀，每次路由更改都会调用

保护页面的中间件示例

middleware/auth.ts

~~~ ts
export default defineNuxtRouteMiddleware((to,form)=>{
    if(isAuthenticated() === false) {
        return navigateTo('/login');
    }
})
~~~

### 路由验证

pages/posts/[id].vue

~~~ vue
<script setup lang='ts'>
	definePageMeta({
        validate: async router => {
            return typeof route.params.id === 'string' &&  /^\d+$/.test(route.params.id)
        }
    })
</script>
~~~

## SEO 和 Meta

### 默认

nuxt.config.ts

~~~ ts
export default defineNuxtConfig({
  app: {
    head: {
      charset: 'utf-8',
      viewport: 'width=device-width, initial-scale=1',
    }
  }
})
~~~

### useHead

~~~ vue
<script setup lang="ts">
useHead({
  title: 'My App',
  meta: [
    { name: 'description', content: 'My amazing site.' }
  ],
  bodyAttrs: {
    class: 'test'
  },
  script: [ { innerHTML: 'console.log(\'Hello world\')' } ]
})
</script>
~~~

### useSeoMeta

~~~ vue
<script setup lang="ts">
useSeoMeta({
  title: 'My Amazing Site',
  ogTitle: 'My Amazing Site',
  description: 'This is my amazing site, let me tell you all about it.',
  ogDescription: 'This is my amazing site, let me tell you all about it.',
  ogImage: 'https://example.com/image.png',
  twitterCard: 'summary_large_image',
})
</script>
~~~

### 组件

Nuxt提供`Title`、`Base`、`NoScript`、`Style`、`Meta`、`Link`、`Body`、`Html`、`Head`组件，一遍可以直接与组件中的元数据进行交互

由于这些组件的名称与本机元素匹配，因此必须在模板中将其大写

>   `<Head>`接收嵌套标记(出于美观原因)，但这不会影响嵌套的元标记在最终的HTML中的呈现位置

~~~vue
<script setup lang="ts">
const title = ref('Hello World')
</script>

<template>
  <div>
    <Head>
      <Title>{{ title }}</Title>
      <Meta name="description" :content="title" />
      <Style type="text/css" children="body { background-color: green; }" ></Style>
    </Head>

    <h1>{{ title }}</h1>
  </div>
</template>
~~~

### 类型

~~~ ts
interface MetaObject {
  title?: string
  titleTemplate?: string | ((title?: string) => string)
  templateParams?: Record<string, string | Record<string, string>>
  base?: Base
  link?: Link[]
  meta?: Meta[]
  style?: Style[]
  script?: Script[]
  noscript?: Noscript[];
  htmlAttrs?: HtmlAttributes;
  bodyAttrs?: BodyAttributes;
}
~~~

### 特征

#### 响应式

通过提供计算值，getter，或者响应对象，所有属性都支持响应式。

~~~ vue
<script setup lang="ts">
const description = ref('My amazing site.')

useHead({
  meta: [
    { name: 'description', content: description }
  ],
})
</script>
~~~

### 标题模板

可以使用该选项提供动态模板，用于自定义网站的标题。

~~~ vue
<script setup lang="ts">
useHead({
  titleTemplate: (titleChunk) => {
    return titleChunk ? `${titleChunk} - Site Title` : 'Site Title';
  }
})
</script>
~~~

### 正文标签

将标签追加到末尾

~~~ vue
<script setup lang="ts">
useHead({
  script: [
    {
      src: 'https://third-party-script.com',
      // valid options are: 'head' | 'bodyClose' | 'bodyOpen'
      tagPosition: 'bodyClose'
    }
  ]
})
</script>
~~~



