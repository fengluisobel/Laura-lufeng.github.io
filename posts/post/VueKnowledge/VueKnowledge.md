@import "/echarts.min.js"

## Vue是什么？为什么要学习他

### Vue是什么？

Vue是前端优秀框架， 是一套用于构建用户界面的**渐进式框架**

### 为什么要学习Vue

1. Vue是目前前端最火的框架之一
2. Vue是目前企业技术栈中要求的知识点
3. Vue可以提升开发体验
4. Vue学习难度较低

## Vue开发前的准备

### 安装Vue工具 `Vue CLI`

`Vue CLI` Vue.js 开发的标准工具，`Vue CLI ` 是一个基于 Vue.js 进行快速开发的完整系统

```js
npm install -g @vue/cli
```

安装之后，你就可以在命令行中访问 `vue` 命令。你可以通过简单运行 `vue`，看看是否展示出了一份所有可用命令的帮助信息，来验证它是否安装成功。

```js
vue --version
```



### 创建一个项目

运行以下命令来创建一个新项目

```js
vue create vue-demo
```

> **温馨提示**
>
> 在控制台中，可以用上下按键调整选择项
>
> 在控制台中，可以用空格(spacebar)选择是否选中和取消选中

可以选择默认项目模板，或者选“手动选择特性”来选取需要的特性。

我们选择`Babel`和`Progressive Web App (PWA) Support` 两个选项即可

> **温馨提示**
>
> 在学习期间，不要选中 `Linter / Formatter` 以避免不必要的错误提示

Vue目前有两个主流大版本`vue2`和`vue3`，我们本套课程选择`vue3`最新版本

配置放在哪里? `In dedicated config files ` 专用配置文件或者 `In package.json `在package.json文件

将其保存为未来项目的预置? `y`代表保存，并添加名字，`n`不保存

项目创建成功如下提示信息

### 运行项目

第一步：进入项目根目录`cd vue-demo`

第二步：运行`npm run serve` 启动项目

### 安装Vue高亮插件

VSCode中安装`vetur`或者`volar`都可，前者针对Vue2版本，后者针对Vue3版本

## 模板语法

### 文本

数据绑定最常见的形式就是使用“Mustache” (双大括号) 语法的文本插值

```html
<span>Message: {{ msg }}</span>
```
一般配合`js` 中的`data()`设置数据

```js
export default {
  name: 'HelloWorld',
  data(){
    return{
      msg:"消息提示"
    }
  }
}
```
### 原始 HTML

双大括号会将数据解释为普通文本，而非 HTML 代码。为了输出真正的 HTML，你需要使用`v-html` 指令

```html
<p>Using mustaches: {{ rawHtml }}</p>
<p>Using v-html directive: <span v-html="rawHtml"></span></p>
```

```js
data(){
    return{
        rawHtml:"<a href='网络链接'>这是一个网络链接</a>"
    }
}
```



### 属性 Attribute

Mustache 语法不能在 HTML 属性中使用，然而，可以使用 `v-bind` 指令

```html
<div v-bind:id="dynamicId"></div>
```

```js
data(){
    return{
        dynamicId:1001
    }
}
```

> **温馨提示**
>
> `v-bind:` 可以简写成 `:`

  ### 使用 JavaScript 表达式

在我们的模板中，我们一直都只绑定简单的 property 键值，Vue.js 都提供了完全的 JavaScript 表达式支持
```js
{{ number + 1 }}

{{ ok ? 'YES' : 'NO' }}

{{ message.split('').reverse().join('') }}
```
这些表达式会在当前活动实例的数据作用域下作为 JavaScript 被解析。有个限制就是，每个绑定都只能包含**单个表达式**











