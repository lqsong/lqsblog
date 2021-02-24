# lqsblog-frontend-nextjs


[lqsblog-frontend-nextjs](https://github.com/lqsong/lqsblog-frontend-nextjs) [![GitHub stars](https://img.shields.io/github/stars/lqsong/lqsblog-frontend-nextjs.svg?style=social&label=Stars)](https://github.com/lqsong/lqsblog-frontend-nextjs) 是一个PC端、WAP端自适应展示的一个前端网站前台，它基于 [nextjs](https://github.com/vercel/next.js) 结合 [lqsblog-frontend-foreground-template](https://github.com/lqsong/lqsblog-frontend-foreground-template)模板实现。

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
```

## 目录结构

本项目基于nextjs生成，下面是整个项目的目录结构。大部分主体目录结构说明请参照[nextjs文档](https://www.nextjs.cn/docs/getting-started)

```bash
├── @types                     # ts类型定义目录
├── components                 # 组件目录
├── layouts                    # 布局目录
├── pages                      # 页面目录
│   ├── article                # 随笔目录
│   │   ├── detail             # 随笔详情
│   │   └── [cname].tsx        # 随笔（分类）列表
│   ├── search                 # 搜索列表目录
│   ├── tag                    # 标签下内容列表目录
│   ├── topics                 # 专题目录
│   │   ├── detail             # 专题详情
│   │   └── index.tsx          # 专题列表
│   ├── works                  # 作品目录
│   │   ├── detail             # 作品详情
│   │   └── index.tsx          # 作品列表
│   ├── about.tsx              # 关于我
│   ├── index.tsx              # 首页
│   └── links.tsx              # 邻居
├── public                     # 静态文件目录
├── server                     # 服务器配置目录
├── store                      # Store 目录
├── utils                      # 工具包
├── .env.xxx                   # 环境变量配置
├── next.config.js             # nuxt.config.js 文件
└── package.json               # package.json
```

## 安装

```bash
# 克隆项目
git clone https://github.com/lqsong/lqsblog-frontend-nextjs.git

# 进入项目目录
cd lqsblog-frontend-nextjs

# 安装依赖
yarn

# 本地开发 启动项目
yarn dev
```


<br/>

启动完成后会，打开浏览器访问 [http://localhost:3000](http://localhost:3000)，接下来你可以修改代码进行业务开发了。

:::tip
本项目基于 nextjs 搭建，具体开发文档，您可以参考 [nextjs官方文档](https://www.nextjs.cn/docs/getting-started).
:::



## 自定义配置

### **(建议)** 本地或开发模式下，不要直接修改 '.env'
复制 '.env' 重命名为 ' .env.development.local' , 修改对应的参数.

### **(建议)** 生产模式下，不要直接修改 '.env'
复制 '.env' 重命名为 ' .env.production.local' , 修改对应的参数.



## 与服务端交互 & Mock Data

> 本项目 Mock Data 是基于 “[阿里的RAP](http://rap2.taobao.org/)”，方便前后端开发统一接口。具体内容请参照[API文档](/apidocs/)。


## 构建与发布

### 构建

当项目开发完毕，只需要运行一行命令就可以编译构建你的应用：

```sh
// 编译构建
yarn build
```

会生成 `.next` 目录。

### 部署

> 注：**必须先构建**


##### 渲染应用部署

```sh
# 但是此命令，如果关闭命令窗口，服务也会关闭
yarn start

# or

# 你可以利用 pm2 进行管理
pm2 start npm --name "lqsblog" -- run start

```

然后你就可以通过 `IP:端口` 访问你的项目了。

#### 绑定域名，如果你需要绑定域名，你可以利用 nginx 反向代理

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


