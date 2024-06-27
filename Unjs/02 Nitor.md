[toc]

# Nitor

Nitor基于H3和许多内置功能构建Web服务器。

## 安装、运行和部署

~~~ shell
npx giget@latest nitro nitro-app --install
~~~

运行

~~~ shell
npm run dev
~~~

部署

~~~ shell
npm run build
~~~

预览

~~~ shell
npm run preview
~~~

## 目录结构

*   routers 路由文件，文件名是路由路径
*   api 带有api/前缀的路由
*   utils 自动导入的应用实用程序
*   plugins 自定义的nitro插件
*   nitro.config.ts Nitro配置
*   tsconfig.json TypeScript 配置

## 服务器 Utils

>   自动导入

#### H3 Utils

utils/sum.ts

~~~ ts
export function useSum(a:number,b:number) {return a+b}
~~~

在文件直接使用，不用导入

router/index.ts

~~~ ts
export default defineEventHandler(()=>{
	const sum = useSum(1,3);
    return { sum };
})
~~~

#### Nitro Utils

内置的Nitro Util

*   defineCacheFunction(fn,options) / cachedFunction(fn,options)
*   defineCachedEventHandler(handler,options) / cachedEventHandler(handler,options)
*   defineRenderHandler(handler)
*   defineRouteMeta(options) *(实验性的)*
*   useRuntimeConfig(event?)
*   useAppConfig(event?)
*   useStorage(base?)
*   useNitroApp()
*   defineNitroPlugin(plugin)
*   nitroPlugin(plugin)
*   getRouteRules(event)

#### 手动导入

对于某些情况(IDE支持和库),不可能依赖自动导入

可以从虚拟文件中显式导入 <kbd>#imports</kbd>

~~~ ts
import { useStorage } from '#imports'
~~~

#### 异步上下文  （实验性）

将应用程序拆分为更小的“可组合”程序，并且可以直接评估到共享上下文(请求事件)，而无需传递它。

为了启用异步上下文功能，需要启动标志：<kbd>asyncContext</kbd>

nitro.config.ts

~~~ ts
export default defineNitroConfig({
    experimental: {
        asyncContext:true
    }
})
~~~

如果使用的是Nuxt： nuxt.config.ts

~~~ ts
export default defineNuxtConfig({
    nitro:{
		experimental:{
            asyncContext:true
        }
    }
})
~~~

启用后，可以在任何程序或组合项中使用(自动导入)访问请求事件，而无需手动传递它: <kbd>useEvent()</kbd>

没有异步上下文

~~~ ts
// routes/index.ts
export default defineEventHandler(async event=>{
    const user = await useAuth(event);
})

// utils/auth.ts
export function useAuth(event) {
    return useSession(event);
}
~~~

使用异步上下文

~~~ ts
// routes/index.ts
export default defineEventHandler(async ()=>{
    const user = await useAuth();
})

// utils/auth.ts
export function useAuth() {
    return useSession(useEvent())
}
~~~

## 服务器路由

Nitro 支持文件系统路由，自动将文件映射到h3路由。

### 事件处理程序

事件处理程序是一个函数，将绑定到路由，并在路由器与传入请求的路由匹配时执行。

### 文件系统路由

~~~ 
api/
	test.ts     /api/test
routes/
	hello.get.ts      GET /hello
	hello.post.ts     POST /hello
nitro.config.ts
~~~

>   如果使用的nuxt，需要移动到server/api/ 和 server/routes 中。
>
>   一些提供商(如Vercel)使用顶级目录作为功能，因此，放置在其中的路由不起作用，只能将api放入routes/api/中。

#### 简单路由

在routes中创建一个文件，文件名是路由路径

/routes/test.ts

~~~ ts
export default defineEventHandler(()=>{
    return {hello:"hello"}
})
~~~

#### 带参数路由

##### 一个参数

/routes/hello/[name].ts

~~~ ts
export default defineEventHandler(event=>{
    const name = getRouterParam(event,'name');
    return name;
})
~~~

调用 /hello/test 将返回 test

##### 多个参数

/routes/[name]/[age].ts

~~~ ts
export default defineEventHandler(event=>{
    const name = getRouterParam(event,'name');
    const age = getRouterParam(event,'age');
    return { anme,age }
})
~~~

##### 捕获所有参数

/routes/[…name].ts

~~~ ts
export default defineEventHandler(event=>{
    const name = getRouterParam(Event,'name');
    return name;
})
~~~

调用 /hello/world/test 响应：hello/world/test

#### 请求方式

hello.post.ts

~~~ts
export default defineEventHandler(async event=>{
    const body = await readBody(event);
    return { updated:true }
})
~~~

#### 全部捕获路由

与任何其他路由不匹配的所有路由匹配

/routes/[…].ts

~~~ ts
export defalut defineEventHandler(event=>{
    const url = getRequestURL(event);
    return url;
})
~~~

#### 特定于环境的路由

>   只能在夜间频道使用

*   .dev
*   .prod
*   .prerender

/routes/test.get.dev.ts

/routes/test.get.prod.ts

## 中间件

Nitro中间件可以挂钩到请求的生命周期中

中间件在 <kbd>middleware/</kbd>中自动注册

### 简单的中间件

中间件的定义和路由的定义相同，但是中间件不返回任何内容。

server/middleware/auth.ts

~~~ ts
export default defineEventHandler(event=>{
    event.context.user = {name:"Nitro"}
})
~~~

目录中的中间件自动注册所有的路由。

### 路由 meta 元数据

可以生成时使用micro在事件处理程序文件中定义路由处理程序

>   只能在夜间模式中使用

/api/test.ts

~~~ ts
defineRouteMeta({
    openAPI:{
        tags:["test"],
        description:"Test route description",
        parametes:[{in:"query",name:'test',required:true}],
    }
})
export default defineEventHandler(()=>"OK");
~~~

>   此功能目前可以用于指定OpenAPI的元数据，[参阅swagger规范](https://swagger.io/specification/v3/)

### 执行顺序

中间件按目录列表顺序执行，中间件前加上一个数字，可以控制其执行顺序

1.logger.ts

>   执行顺序是按字符串的顺序排列的，所以1.test.ts执行完将会执行10.test.ts，为了避免这种情况，可以使用01.test.ts来作为文件名

### 请求筛选

中间件在每个请求上执行，应用自定义逻辑以将其分为限定为特定条件

middleware/auth.ts

~~~ ts
export default defineEventHandler(event=>{
    if(getRequestURL(event).pathname.startsWith('/auth')){
        event.context.user = {name:'Nitro'}
    }
})
~~~

### 路由规则

在每条路由的顶层添加逻辑，可以用于重定向、代理、缓存和向路由添加标头。

>   swr: true|number 是 cache: {swr: true,maxAge: number}的简便写法

nitro.config.ts

~~~ ts
export default defineNitroConfig({
  routeRules: {
    '/blog/**': { swr: true },
    '/blog/**': { swr: 600 },
    '/blog/**': { static: true },
    '/blog/**': { cache: { /* cache options*/ } },
    '/assets/**': { headers: { 'cache-control': 's-maxage=0' } },
    '/api/v1/**': { cors: true, headers: { 'access-control-allow-methods': 'GET' } },
    '/old-page': { redirect: '/new-page' },
    '/old-page/**': { redirect: '/new-page/**' },
    '/proxy/example': { proxy: 'https://example.com' },
    '/proxy/**': { proxy: '/api/**' },
  }
})
~~~

next.config.ts

~~~ ts
export default defineNuxtConfig({
  routeRules: {
    '/blog/**': { swr: true },
    '/blog/**': { swr: 600 },
    '/blog/**': { static: true },
    '/blog/**': { cache: { /* cache options*/ } },
    '/assets/**': { headers: { 'cache-control': 's-maxage=0' } },
    '/api/v1/**': { cors: true, headers: { 'access-control-allow-methods': 'GET' } },
    '/old-page': { redirect: '/new-page' },
    '/old-page/**': { redirect: '/new-page/**' },
    '/proxy/example': { proxy: 'https://example.com' },
    '/proxy/**': { proxy: '/api/**' },
  }
})
~~~

