# lqsblog-backend-nodejs-eggjs

[lqsblog-backend-nodejs-eggjs](https://github.com/lqsong/lqsblog-backend-nodejs-eggjs) [![GitHub stars](https://img.shields.io/github/stars/lqsong/lqsblog-backend-nodejs-eggjs.svg?style=social&label=Stars)](https://github.com/lqsong/lqsblog-backend-nodejs-eggjs) 是一个Node.js API后端服务，它基于 [Egg](https://eggjs.org) 实现（Egg + Sequelize + RBAC + Jwt（+ 自动刷新） + Restful）。


## 功能

```sh
- 登录 / 注销 (shiro + jwt 验证，自动刷新jwt)
- 首页 / 统计
- 随笔
- 作品
- 专题
- 左邻右舍
- 设置
  - 关于我
  - 标签
  - 账号
  - 角色
  - 后台菜单
  - 后台API
  - 站点配置
```

## 技术选型

- 核心框架：Koa + Egg 
- 安全框架：自定义 RBAC
- ORM： Sequelize
- 会话管理: JWT
- api风格：restful

## 基础环境

- Node.js 8 +
- MySQL5.7 +



## 目录结构

本项目已经为你生成了一个完整的开发框架，下面是整个项目的目录结构。

```bash
├── app                       # 应用
│   │── controller            # 控制器
│   │   │── admin             # admin后台api接口控制器
│   │   └── pc                # pc前台api接口控制器
│   │── enum                  # 枚举
│   │── extend                # egg框架的扩展
│   │── middleware            # 中间件
│   │── model                 # 模型
│   │── public                # 静态资源
│   │── service               # 业务逻辑层
│   │   │── admin             # admin后台api接口业务逻辑层
│   │   └── pc                # pc前台api接口业务逻辑层
│   │── utils                 # 工具
│   └── router.js             # 路由
├── config                    # 配置
│   │── config.default.js     # 默认配置
│   └── plugin.js             # 插件配置
├── test                      # 测试
├── .autod.conf.js            # Egg调用的配置文件
├── .eslintignore             # eslint 忽略配置项
├── .eslintrc                 # eslint 配置项
├── .gitignore                # Git忽略文件配置
├── .travis.yml               # Travis配置文件
├── appveyor.yml              # appveyor配置文件
├── jsconfig.json             # 编辑器配置
└── package.json              # 项目信息
```

:::tip
你也可以参照 [Egg目录结构](https://eggjs.org/zh-cn/basics/structure.html) 文档。
:::

## 配置

> 本项目基于 `Egg` 框架开发，主体配置参数说明请参考[Egg官方文档](https://eggjs.org/zh-cn/basics/config.html)，以下只做扩展内容的说明：

```js
// config.default.js
'use strict';
const path = require('path');
module.exports = appInfo => {
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_http://liqingsong.cc';

  // cluster
  config.cluster = {
    listen: {
      port: 7001, // 端口
      hostname: '127.0.0.1', // 不建议设置 hostname 为 '0.0.0.0'，它将允许来自外部网络和来源的连接，请在知晓风险的情况下使用
      // path: '/var/run/egg.sock',
    },
  };

  // sequelize 配置
  config.sequelize = {
    dialect: 'mysql', // support: mysql, mariadb, postgres, mssql
    host: '127.0.0.1', // 地址 
    port: '3306', // 端口
    database: 'lqsblog', // 数据库
    tablePre: 'lqs_', // 表前缀
    username: '', // 数据库用户名
    password: '', // 数据库密码
    timezone: '+08:00', // 东八时区
    define: {
      freezeTableName: false, // 当未提供表名时: false, 自动将模型名复数并将其用作表名 |  true,所有表将使用与模型名称相同的名称
      charset: 'utf8mb4', // 编码
      dialectOptions: {
        collate: 'utf8mb4_general_ci',
      },
      timestamps: false, // 是否启用自带时间功能
    },
  };

  // log
  config.logger = {
    // 日志分为 NONE，DEBUG，INFO，WARN 和 ERROR 5 个级别。
    // 默认只会输出 INFO 及以上（WARN 和 ERROR）的日志到文件中。
    level: 'INFO',
    dir: path.join(appInfo.baseDir, 'logs'),
  };

  // add your middleware config here
  config.middleware = [
    'errorHandler',
    'notfoundHandler',
  ];

  // security
  config.security = {
    csrf: {
      enable: false,
      ignoreJSON: false, // 默认为 false，当设置为 true 时，将会放过所有 content-type 为 `application/json` 的请求
    },
    domainWhiteList: [ 'http://127.0.0.1:8081' ], // 运行跨域的白名单
  };  

  // jwt
  config.jwt = {
    secret: 'lqsblog', // 签名私钥
    expiresIn: 3600, // 签名失效时间 - 秒 3600（1小时）
    restExpiresIn: 1800, // 距离签名失效时间多少内可以重置签名- 秒 1800（0.5小时）
    headerTokenKey: 'lqsblog-token', // Header头 Token 名称
  };

  // multipart
  config.multipart = {
    fileSize: '1mb',
    mode: 'stream',
    /**
     * 自定义允许图片上传的类型
     * 注意：此参数是基于 config.multipart.whitelist 与 config.multipart.fileExtensions 配置的基础上进行的限制。
     */
    imgType: [ 'image/png', 'image/gif', 'image/jpg', 'image/jpeg' ],
    /**
     * 自定义文件上传目录绑定的网址,必须设置，(必须 / 结尾)，如下格式：
     * uploadWeburl: 'http://127.0.0.1:7001/public/uploads/'
     * 注意：如果 config.multipart.uploadDir 为空，此项可设置为 http://当前项目域名/public/uploads/
     *      若 config.multipart.uploadDir 不为空，此项设置自定义上传目录绑定的网址
     */
    uploadWeburl: 'http://127.0.0.1:7001/public/uploads/',
    /**
     * 自定义文件上传的目录(注意必须 / 结尾) 绝对地址（注意Linux和Windows上的目录结构不同）
     * uploadDir: 'E:/uploads/'
     * 注意：如果为空，系统默认上传目录 path.join(ctx.app.config.baseDir, 'app/public/uploads/')
     */
    uploadDir: '',
  };

  // customLoader https://github.com/eggjs/egg-core/blob/master/lib/loader/mixin/custom_loader.js
  config.customLoader = {
    // 定义在 ctx 上的属性名 ctx.utils
    utils: {
      // 相对于 app.config.baseDir
      directory: 'app/utils',
      // 如果是 app 则使用 loadToApp
      inject: 'ctx',
      // 是否加载框架和插件的目录
      loadunit: false,
    },
    // 定义在 app 上的属性名 app.enum
    enum: {
      // 相对于 app.config.baseDir
      directory: 'app/enum',
      // 如果是 ctx 则使用 loadToContext
      inject: 'app',
      // 是否加载框架和插件的目录
      loadunit: false,
    },
  };
 

  return {
    ...config,
  };
};


```

:::tip
这里有以下几点需要注意：
- 1、 本地开发时不要直接修改 `config.default.js` 配置文件，新建 `config.local.js` 把需要自定义的参数写入此文件即可，系统会自动合并，参照 [Egg配置文档>合并规则](https://eggjs.org/zh-cn/basics/config.html#合并规则)。
- 2、 生产环境也是如此，新建 `config.prod.js` 文件。
:::


## 本地开发

```bash
# 下载sql，导入mysql 数据库
https://github.com/lqsong/lqsblog/blob/master/database/lqsblog-backend-nodejs-eggjs.sql

# 克隆项目
git clone https://github.com/lqsong/lqsblog-backend-nodejs-eggjs.git

# 进入项目目录
cd lqsblog-backend-nodejs-eggjs

# 新建 `config.local.js` 设置需要重置的参数
'use strict';
module.exports = () => {

  const config = exports = {};
  
  # sequelize 数据库必须重置
  config.sequelize = {
    dialect: 'mysql',
    host: '******',
    port: '3306',
    database: '***',
    tablePre: 'lqs_',
    username: '***',
    password: '***',
  };

  # 进行跨域的白名单必须重置
  config.security = {
    domainWhiteList: [ 'http://127.0.0.1:8081' ],
  };

  # 上传配置，域名必须重置
  # 如果 `uploadDir` 不重置默认在项目'/pulbic/upload/'下，
  # `uploadWeburl` 必须重置为对应域名地址
  config.multipart = {
    uploadWeburl: 'http://127.0.0.1:8082/',
    uploadDir: 'E:/uploads/',
  };

  return {
    ...config,
  };

};

# 安装
npm install

# 本地开发 启动项目
npm run dev

```
:::tip
注：数据库后台默认用户名、密码分别是：**admin** / **123456**
:::


## 应用部署

### 导入数据库

当项目开发完毕，你需要把你的数据库导入到生产环境中的数据库中。

### 部署

部署有两种方式：

#### 一种是先在本地构建，再在生产环境部署，如下操作

```bash
# 克隆项目
git clone https://github.com/lqsong/lqsblog-backend-nodejs-eggjs.git

# 进入项目目录
cd lqsblog-backend-nodejs-eggjs

# 新建 `config.prod.js` 设置需要重置的参数
'use strict';
module.exports = () => {

  const config = exports = {};
  
  # sequelize 数据库必须重置
  config.sequelize = {
    dialect: 'mysql',
    host: '******',
    port: '3306',
    database: '***',
    tablePre: 'lqs_',
    username: '***',
    password: '***',
  };

  # 进行跨域的白名单必须重置
  config.security = {
    domainWhiteList: [ 'http://127.0.0.1:8081' ],
  };

  # 上传配置，域名必须重置
  # 如果 `uploadDir` 不重置默认在项目'/pulbic/upload/'下，
  # `uploadWeburl` 必须重置为对应域名地址
  config.multipart = {
    uploadWeburl: 'http://127.0.0.1:8082/',
    uploadDir: 'E:/uploads/',
  };

  return {
    ...config,
  };

};

# 安装
npm install --production

# 打包
tar -zcvf ../release.tgz

# 上传到生产服务器,解压，进入目录
# 启动命令
$ npm run start  --daemon --title=lqsblog-backend-nodejs-eggjs

# 如果你想关闭站点，停止命令
$ npm run stop [--title=lqsblog-backend-nodejs-eggjs]

```

#### 另一种是直接在生产环境构建再部署，如下操作

```bash
# 生产环境，克隆项目
git clone https://github.com/lqsong/lqsblog-backend-nodejs-eggjs.git

# 进入项目目录
cd lqsblog-backend-nodejs-eggjs

# 新建 `config.prod.js` 设置需要重置的参数
'use strict';
module.exports = () => {

  const config = exports = {};
  
  # sequelize 数据库必须重置
  config.sequelize = {
    dialect: 'mysql',
    host: '******',
    port: '3306',
    database: '***',
    tablePre: 'lqs_',
    username: '***',
    password: '***',
  };

  # 进行跨域的白名单必须重置
  config.security = {
    domainWhiteList: [ 'http://127.0.0.1:8081' ],
  };

  # 上传配置，域名必须重置
  # 如果 `uploadDir` 不重置默认在项目'/pulbic/upload/'下，
  # `uploadWeburl` 必须重置为对应域名地址
  config.multipart = {
    uploadWeburl: 'http://127.0.0.1:8082/',
    uploadDir: 'E:/uploads/',
  };

  return {
    ...config,
  };

};

# 安装
npm install --production

# 启动命令
$ npm run start  --daemon --title=lqsblog-backend-nodejs-eggjs

# 如果你想关闭站点，停止命令
$ npm run stop [--title=lqsblog-backend-nodejs-eggjs]

```
:::tip
详细规则你可以参照 [Egg应用部署](https://eggjs.org/zh-cn/core/deployment.html)。
:::

#### 绑定域名，如果你需要绑定域名，你可以利用 nginx 反向代理

```bash
http {
    # 内部添加以下内容
    server {
        # 监听 80 端口 ，你也可以设置其他端口但是访问域名时需要加上端口访问
        listen       80;
        # 你的网址，如果是本地测试，也可以设置你本地的ip
        server_name  api.liqingsong.cc;
        location / {
          # 代理地址，你本地 springboot 的访问地址
          proxy_pass  http://x.x.x.x:8080;
          index  index.html index.htm;
            
        }  
    }
}

