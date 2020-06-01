# lqsblog-frontend-nuxt

[lqsblog-frontend-nuxt](https://github.com/lqsong/lqsblog-frontend-nuxt) [![GitHub stars](https://img.shields.io/github/stars/lqsong/lqsblog-frontend-nuxt.svg?style=social&label=Stars)](https://github.com/lqsong/lqsblog-frontend-nuxt) 是一个PC端、WAP端自适应展示的一个前端网站前台，它基于 [nuxtjs](https://zh.nuxtjs.org/)实现。

## 功能

```
- 首页
  -- 最新推荐
  -- 随笔作品列表
  -- 友情链接
- 关于
- 随笔
- 作品
- 专题
- 邻居

- 百度SEO推送
- CNZZ统计
```

## 目录结构

本项目基于nuxtjs生成，下面是整个项目的目录结构。大部分主体目录结构说明请参照[nuxtjs目录结构](https://zh.nuxtjs.org/guide/directory-structure)

```bash
├── assets                     # 资源目录
│   │── images                 # 图片目录
├── components                 # 组件目录
├── layouts                    # 布局目录
├── middleware                 # 中间件目录
├── pages                      # 页面目录
│   ├── article                # 随笔目录
│   │   ├── detail             # 随笔详情
│   │   └── _cname.vue         # 随笔（分类）列表
│   ├── search                 # 搜索列表目录
│   ├── tag                    # 标签下内容列表目录
│   ├── topics                 # 专题目录
│   │   ├── detail             # 专题详情
│   │   └── index.vue          # 专题列表
│   ├── works                  # 作品目录
│   │   ├── detail             # 作品详情
│   │   └── index.vue          # 作品列表
│   ├── about.vue              # 关于我
│   ├── index.vue              # 首页
│   └── links.vue              # 邻居
├── plugins                    # 插件目录
├── server                     # 服务器配置目录
├── static                     # 静态文件目录
├── store                      # Store 目录（server Api目录）
├── test                       # 测试
├── utils                      # 工具包
├── .babelrc                   # .babelrc配置
├── .editorconfig              # 编辑器配置
├── .env.xxx                   # 环境变量配置
├── .eslintrc.js               # eslint 配置项
├── ava.config.cjs             # ava.config.cjs 配置
├── jsconfig.json              # vscode js配置
├── nuxt.config.js             # nuxt.config.js 文件
└── package.json               # package.json
```

## 安装

```bash
# 克隆项目
git clone https://github.com/lqsong/lqsblog-frontend-nuxt.git

# 进入项目目录
cd lqsblog-frontend-nuxt

# 安装依赖
npm install

# 建议不要用 cnpm 安装  可以通过如下操作解决 npm 下载速度慢的问题
npm install --registry=https://registry.npm.taobao.org

# 本地开发 启动项目
npm run dev
```


<br/>

启动完成后会，打开浏览器访问 [http://localhost:3000](http://localhost:3000)，接下来你可以修改代码进行业务开发了。

:::tip
本项目基于 nuxtjs 搭建，具体开发文档，您可以参考 [nutxjs官方文档](https://zh.nuxtjs.org/guide/configuration).
:::


## 配置

> 配置主体内容你可以参考 [nutxjs官方文档](https://zh.nuxtjs.org/guide/configuration)。以下只做扩展内容的说明：

```js
/**
 * 此为自定义扩展内容 S 
 * 此功能的主要作用是扩展.env文件，可以设置不同环境的文件方便开发、部署，如：
 * .env.development  / .env.production
 */
const env = require('./server/env')
const envFileName = env.getEnvFileName()
env.setEnv(envFileName)
// 此为自定义扩展内容 E

module.exports = {
  server: {
    port: 3000,
    host: '0.0.0.0' // 此内容不要改动，因为Nodejs部署时必须这样设置，外网才能访问服务器
  },
  modules: [
    // Doc: https://axios.nuxtjs.org/usage
    '@nuxtjs/axios',
    // Doc: https://github.com/nuxt-community/dotenv-module
    ['@nuxtjs/dotenv', { filename: envFileName }] // 对应上面扩展
  ],
}
```


## 与服务端交互 & Mock Data

> 本项目 Mock Data 是基于 “[阿里的RAP](http://rap2.taobao.org/)”，方便前后端开发统一接口。具体内容请参照[API文档](/apidocs/)。

### 前端请求

为了方便管理维护，统一的请求处理都放在 @/store 中，并且一般按照 页面模块 纬度进行拆分文件，如

```bash
 - about.js
 - article.js
 - home.js
 - ...
```

### axios

 `axios` 用了 `@nuxtjs/axios` modules，并在 `plugins` 目录中的 `axios.js` 插件文件中进行了统一的处理。 


## 构建与发布

### 构建

当项目开发完毕，只需要运行一行命令就可以编译构建你的应用：

```sh
// 编译构建
npm run build
```

会生成 `.nuxt` 目录。

### 发布部署

> 注：**必须先构建**

对于发布来讲，你需要以下几步：

#### 1、把以下目录和文件打包上传到你的服务器中。

```bash
├── .nuxt
├── server
├── static
├── .env
├── nuxt.config.js
└── package.json
```

##### 2、cd 到项目目录下，执行安装

```sh
npm install
```

##### 3、如果有需要你可以修改配置[nuxt.config.js]（端口）、[.env]（请求api地址）

```js
// nuxt.config.js
module.exports = {
  server: {
    port: 3000, // 可以修改需要的端口
    host: '0.0.0.0'
  }
}
```
```sh
# .env
# 接口地址
APP_API_HOST=http://rap2.taobao.org:38080/app/mock/247994/pc
```

##### 4、渲染应用部署

```sh
# 但是此命令，如果关闭命令窗口，服务也会关闭
npm run start

# or

# 你可以利用 pm2 进行管理
pm2 start npm --name "lqsblog" -- run start

```

然后你就可以通过 `IP:端口` 访问你的项目了。

#### 5、绑定域名，如果你需要绑定域名，你可以利用 nginx 反向代理

```bash
http {
    # 内部添加以下内容
    server {
        # 监听 80 端口 ，你也可以设置其他端口但是访问域名时需要加上端口访问
        listen       80;
        # 你的网址，如果是本地测试，也可以设置你本地的ip
        server_name  liqingsong.cc;
        location / {
          # 代理地址，你本地 nuxt 的访问地址
          proxy_pass  http://x.x.x.x:3000;
          index  index.html index.htm;
            
        }  
    }
}
```



## 界面展示

![index](https://gitee.com/lqsong/lqsblog/raw/master/images/lqsblog-frontend-nuxt/index.png) 

