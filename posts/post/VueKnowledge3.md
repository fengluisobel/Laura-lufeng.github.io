## 表单输入绑定





你可以用 `v-model` 指令在表单 `<input>`、`<textarea>` 及 `<select>` 元素上创建双向数据绑定。它会根据控件类型自动选取正确的方法来更新元素。尽管有些神奇，但 `v-model` 本质上不过是语法糖。它负责监听用户的输入事件来更新数据，并在某种极端场景下进行一些特殊处理。

```html
<input v-model="message" placeholder="edit me" />
<p>Message is: {{ message }}</p>
```

```js
data() {
    return {
        message:""
    }
}
```



### 修饰符

#### `.lazy`

在默认情况下，`v-model` 在每次 `input` 事件触发后将输入框的值与数据进行同步 。你可以添加 `lazy` 修饰符，从而转为在 `change` 事件之后进行同步

```html
<input v-model.lazy="message" />
<p>Message is: {{ message }}</p>
```

```js
data() {
    return {
        message:""
    }
}
```



#### `.trim`

如果要自动过滤用户输入的首尾空白字符，可以给 `v-model` 添加 `trim` 修饰符

```html
<input v-model.trim="message" />
```

```js
data() {
    return {
        message:""
    }
}
```









## 组件基础


### 单文件组件

Vue 单文件组件（又名 `*.vue` 文件，缩写为 **SFC**）是一种特殊的文件格式，它允许将 Vue 组件的模板、逻辑 **与** 样式封装在单个文件中

```vue
<template>
    <h3>单文件组件</h3>
</template>

<script>
export default {
    name:"MyComponent"
}
</script>

<style scoped>
h3{
    color: red;
}
</style>
```



### 加载组件

第一步：引入组件 `import MyComponentVue from './components/MyComponent.vue'`

第二步：挂载组件 `components: { MyComponentVue }`

第三步：显示组件 `<my-componentVue />`



### 组件的组织

通常一个应用会以一棵嵌套的组件树的形式来组织



# 











## Props组件交互







组件与组件之间是需要存在交互的，否则完全没关系，组件的意义就很小了

`Prop` 是你可以在组件上注册的一些自定义 attribute

```vue
<my-componentVue title="标题"/>
```

```vue
<template>
    <h3>单文件组件</h3>
    <p>{{ title }}</p>
</template>

<script>
export default {
    name:"MyComponent",
    props:{
        title:{
            type:String,
            default:""
        }
    }
}
</script>
```



### Prop 类型

Prop传递参数其实是没有类型限制的

```vue
props: {
  title: String,
  likes: Number,
  isPublished: Boolean,
  commentIds: Array,
  author: Object,
  callback: Function
}
```

> **温馨提示**
>
> 数据类型为数组或者对象的时候，默认值是需要返回工厂模式













## 自定义事件组件交互






自定义事件可以在组件中反向传递数据，`prop` 可以将数据从父组件传递到子组件，那么反向如何操作呢，就可以利用自定义事件实现 `$emit`

```vue
<template>
    <h3>单文件组件</h3>
    <button @click="sendHandle">发送数据</button>
</template>

<script>
export default {
    name: "MyComponent",
    methods:{
        sendHandle(){
            this.$emit("onCustom","数据")
        }
    }
}
</script>

<style scoped>
h3 {
    color: red;
}
</style>
```

```vue
<template>
  <my-componentVue @onCustom="getData" />
</template>

<script>

import MyComponentVue from './components/MyComponent.vue'

export default {
  name: 'App',
  components: {
    MyComponentVue
  },
  methods: {
    getData(data) {
      console.log(data);
    }
  }
}
</script>
```









## 组件生命周期






每个组件在被创建时都要经过一系列的初始化过程——例如，需要设置数据监听、编译模板、将实例挂载到 DOM 并在数据变化时更新 DOM 等。同时在这个过程中也会运行一些叫做**生命周期钩子**的函数，这给了用户在不同阶段添加自己的代码的机会







为了方便记忆，我们可以将他们分类：

创建时：`beforeCreate`、`created`

渲染时：`beforeMount`、`mounted`

更新时：`beforeUpdate`、`updated`

卸载时：`beforeUnmount`、`unmounted`


