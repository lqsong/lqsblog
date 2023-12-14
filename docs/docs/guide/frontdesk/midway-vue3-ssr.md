# lqsblog-frontend-midway-vue3-ssr

[lqsblog-frontend-midway-vue3-ssr](https://github.com/lqsong/lqsblog-frontend-midway-vue3-ssr) [![GitHub stars](https://img.shields.io/github/stars/lqsong/lqsblog-frontend-midway-vue3-ssr.svg?style=social&label=Stars)](https://github.com/lqsong/lqsblog-frontend-midway-vue3-ssr) 是一个PC端、WAP端自适应展示的一个前端网站前台，它基于 [midway-vue3-ssr](http://midway-vue3-ssr.liqingsong.cc/)实现。

## 功能

```
- 首页
  -- 随笔作品列表
- 关于
- 随笔
- 作品
- 专题
- 邻居

- 音乐
- 主题
- 百度统计
```


## 安装

```bash
# 克隆项目
git clone https://github.com/lqsong/lqsblog-frontend-midway-vue3-ssr.git

# 进入项目目录
cd lqsblog-frontend-midway-vue3-ssr

# 安装依赖
pnpm i

# 本地开发 启动项目
pnpm dev
```

> 请使用 pnpm , **[pnpm的安装与使用](http://liqingsong.cc/article/detail/26)** 。



<br/>

启动完成后会，打开浏览器访问 [http://localhost:8002](http://localhost:8002)，接下来你可以修改代码进行业务开发了。

:::tip
本项目基于 midway-vue3-ssr 搭建，具体开发文档，您可以参考  [midway-vue3-ssr官方文档](http://midway-vue3-ssr.liqingsong.cc/) .
:::


## 部署

### 服务器环境

- node 14.18 +
- pnpm 6+
- pm2  **[PM2的安装与使用](http://liqingsong.cc/article/detail/3)** 。

### 配置

- 1、复制 `/src/config/config.default.ts` 并重命名 `/src/config/config.prod.ts`;

- 2、修改 `/src/config/config.prod.ts` 中对应参数

```ts
import { MidwayConfig } from '@midwayjs/core';

export default {
  koa: {
    port: 8002, // 端口
  },
} as MidwayConfig;

```

- 3、复制 `/web/.env.production` 并重命名 `/web/.env.production.local`;

- 4、修改 `/web/.env.production.local` 中对应参数

```sh
#api接口域名
VITE_APP_APIHOST = http://rap2api.taobao.org/app/mock/247994/pc
```

### 运行


```bash
# 安装开发期依赖
$ pnpm i 

# 构建项目
$ pnpm build 

# 启动项目
$ pnpm start 

# 或者 pm2 命令为: 
$ NODE_ENV=production pm2 start ./bootstrap.js --name lqsblog -i 2
# 在 Docker 容器中，后台启动的代码都会被退出，达不到预期效果。pm2 使用另一个命令来支持容器启动。
$ NODE_ENV=production pm2-runtime start ./bootstrap.js --name lqsblog -i 2

```

然后你就可以通过 `IP:端口` 访问你的项目了。

### 绑定域名，如果你需要绑定域名，你可以利用 nginx 反向代理

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
          proxy_pass  http://x.x.x.x:8002;
          index  index.html index.htm;
            
        }  
    }
}
```


## 界面展示

![index](/img/midway-vue3-ssr/index1.png) 
![index](/img/midway-vue3-ssr/index2.png) 
![index](/img/midway-vue3-ssr/index3.png) 
![index](/img/midway-vue3-ssr/index4.png) 
![index](/img/midway-vue3-ssr/index5.png) 
![index](/img/midway-vue3-ssr/index6.png) 
![index](/img/midway-vue3-ssr/index7.png) 
![index](/img/midway-vue3-ssr/m_index_nav.png) 
![index](/img/midway-vue3-ssr/m_index1.png) 
![index](/img/midway-vue3-ssr/m_index2.png) 
![index](/img/midway-vue3-ssr/m_index3.png) 
![index](/img/midway-vue3-ssr/m_index4.png) 
![index](/img/midway-vue3-ssr/m_index5.png) 
![index](/img/midway-vue3-ssr/m_index6.png) 
![index](/img/midway-vue3-ssr/m_index7.png) 

