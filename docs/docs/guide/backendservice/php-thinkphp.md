# lqsblog-backend-php-thinkphp

[lqsblog-backend-php-thinkphp](https://github.com/lqsong/lqsblog-backend-php-thinkphp) [![GitHub stars](https://img.shields.io/github/stars/lqsong/lqsblog-backend-php-thinkphp.svg?style=social&label=Stars)](https://github.com/lqsong/lqsblog-backend-php-thinkphp) 是一个PHP API后端服务，它基于 [ThinkPHP 6.x](https://www.kancloud.cn/manual/thinkphp6_0/content) 实现（Composer + thinkphp6 + RBAC + Jwt（+ 自动刷新） + Restful）。

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

- 核心框架：ThinkPHP 6.x
- 安全框架：自定义 RBAC
- 会话管理: JWT
- api风格：restful

## 运行环境要求

- PHP7.1+，兼容PHP8.0
- MySQL5.7 +


## 目录结构

本项目已经为你生成了一个完整的开发框架，下面是整个项目的目录结构。

```bash
├── app                       # 应用
│   │── controller            # 控制器
│   │   │── admin             # admin后台api接口控制器
│   │   └── pc                # pc前台api接口控制器
│   │── middleware            # 中间件目录
│   │── model                 # 模型
│   │── service               # 业务逻辑层
│   │   │── admin             # admin后台api接口业务逻辑层
│   │   └── pc                # pc前台api接口业务逻辑层
│   │── validate              # 验证器
│   │── AppService.php        # 应用服务类
│   │── common.php            # 应用公共文件
│   │── event.php             # 事件定义文件
│   │── ExceptionHandle.php   # 应用异常处理类
│   │── middleware.php        # 全局中间件定义文件
│   │── provider.php          # 容器Provider定义文件
│   │── Request.php           # 应用请求对象类
│   └── service.php           # 系统服务定义文件
├── config                    # 配置目录
│   ├─app.php                 # 应用配置
│   ├─cache.php               # 缓存配置
│   ├─console.php             # 控制台配置
│   ├─cookie.php              # Cookie配置
│   ├─database.php            # 数据库配置
│   ├─filesystem.php          # 文件磁盘配置
│   ├─lang.php                # 多语言配置
│   ├─log.php                 # 日志配置
│   ├─middleware.php          # 中间件配置
│   ├─route.php               # URL和路由配置
│   ├─session.php             # Session配置
│   ├─trace.php               # Trace配置
│   └─view.php                # 视图配置
├── extend                    # 自定义扩展目录
├── public                    # WEB目录（对外访问目录）
├── route                     # 路由定义目录
│   ├─route.php               # 路由定义文件
│   └─ ...   
├── runtime                   # 应用的运行时目录（可写，可定制）
├── vendor                    # Composer类库目录
├── view                      # 视图目录
├── .example.env              # 环境变量示例文件
├── composer.json             # composer 定义文件
├── README.md                 # README 文件
└── think                     # 命令行入口文件
```

:::tip
你也可以参照 [thinkphp目录结构](https://www.kancloud.cn/manual/thinkphp6_0/1037483) 文档。
:::

## 本地开发

```bash
# 下载sql，导入mysql 数据库
https://github.com/lqsong/lqsblog/blob/master/database/lqsblog-backend-php-thinkphp.sql

# 克隆项目
git clone https://github.com/lqsong/lqsblog-backend-php-thinkphp.git

# 进入项目目录
cd lqsblog-backend-php-thinkphp

# 复制 `.example.env` 重命名为`.env` 并修改对应参数
APP_DEBUG = false

[APP]
DEFAULT_TIMEZONE = Asia/Shanghai

[DATABASE]
TYPE = mysql
HOSTNAME = 127.0.0.1
DATABASE = test
USERNAME = username
PASSWORD = password
HOSTPORT = 3306
CHARSET = utf8mb4
PREFIX = lqs_
DEBUG = true

[CROSS]
allow_origin = *
allow_methods = GET, POST, PATCH, PUT, DELETE, OPTIONS
allow_credentials = 'true'
allow_headers = lqsblog-token, Content-Type
max_age = 0

[FILESYSTEM]
upload_weburl = http://127.0.0.1:8088/uploads

[LANG]
default_lang = zh-cn

# 安装
composer install

```
:::tip
注：数据库后台默认用户名、密码分别是：**admin** / **123456**
:::

