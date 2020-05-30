# lqsblog-backend-java-springboot

[lqsblog-backend-java-springboot](https://github.com/lqsong/lqsblog-backend-java-springboot) [![GitHub stars](https://img.shields.io/github/stars/lqsong/lqsblog-backend-java-springboot.svg?style=social&label=Stars)](https://github.com/lqsong/lqsblog-backend-java-springboot) 是一个基于微服务思想的API后端服务，它基于 [spring-boot](https://spring.io/projects/spring-boot)实现（maven + springboot + mybatis + mybatis plus + shiro + jwt（+ 自动刷新） + restful）。



## 功能


```sh
# 一、api 模块 (admin、pc)
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
# 二、webs 模块,自己自定义扩展
```

## 技术选型

- 核心框架：Sring boot + Spring Framework
- 安全框架：Apache Shiro
- 持久层框架： MyBatis + MyBatis-Plus
- 会话管理: JWT
- 日志管理：SLF4J
- JSON转换: Jackson FastJson
- JAVA库：Lombok
- 工具：Maven
- api风格：restful
- 模板引擎：thymeleaf



## 目录结构

本项目已经为你生成了一个完整的开发框架，下面是整个项目的目录结构。

```bash
├── lqsblog-api                            # api服务
│   │── cc.liqingsong.api.admin            # admin后台api接口
│   └── cc.liqingsong.api.pc               # pc前台api接口
├── lqsblog-api-common                     # api服务公共
├── lqsblog-common                         # 项目公共
├── lqsblog-database                       # 项目数据库(实体类、DTO、VO)
├── lqsblog-service                        # 项目服务类
├── lqsblog-webs                           # jsp Web PC前台
├── lqsblog-webs-common                    # jsp Web 公共
└── pom.xml                                # maven 配置文件
```

## 基础环境

- JDK11 +
- MySQL5.7 +
- maven3.6 +
- Idea 安装 lombok 设置动态编译

## 配置

> 本项目基于springboot框架开发，主体配置请参考[springboot官方文档](https://spring.io/projects/spring-boot)，以下只做扩展内容的说明：

```sh
# lqsblog-api 下  application.yml
# spring 配置
spring:
  profiles:
    # 激活哪个环境配置
    active: local
  # 应用配置
  application:
    name: lqsblog-api
  # 数据库连接池
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://127.0.0.1:3306/lqsblog?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai
    username: root
    password: rot
  mvc:
    # 启用 Not Found
    throw-exception-if-no-handler-found: true
    # 静态资源访问路径，这样可以解决获取不到 NoHandlerFoundException，并此配置也用到自定义资源映射
    static-path-pattern: /statics/**
  servlet:
    # MULTIPART (MultipartProperties)
    multipart:
      # 开启 multipart 上传功能
      enabled: true
      # 单个文件的最大值
      max-file-size: 1MB
      # 上传文件总的最大值(最大请求大小)
      max-request-size: 10MB
# mybatis-plus 配置
mybatis-plus:
  configuration:
    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl
  global-config:
    db-config:
      table-prefix: lqs_
# server 配置
server:
  # 服务器的HTTP端口，默认为8080
  port: 8088
  servlet:
    # 应用的访问路径
    context-path: /
# 自定义博客站点配置
lqsblog:
  # 网址，上传图片返回地址有用到
  weburl: http://127.0.0.1:8088
  # 跨域配置
  access:
    # 允许跨域网址 多个,分割
    origins: http://127.0.0.1:8181,http://127.0.0.1:3000
  # jwt 配置
  jwt:
    config:
      # 签名私钥
      key: lqsblog
      # 签名失效时间 - 毫秒 1800000（0.5小时）
      ttl: 1800000
      # 距离签名失效时间多少内可以重置签名 - 毫秒 900000（0.25小时[15分钟]）
      restttl: 900000
    header:
      # Header头 Token 名称
      tokenkey: lqsblog-token
  # 上传文件 配置
  file:
    # 文件上传目录绑定的自定义网址，可为空(注意如果填写必须 / 结尾)，如下格式：
    # upload-weburl: http://127.0.0.1:3001/
    # 默认为空,则上传文件目录的网址为:自定义映射的静态资源网址（${lqsblog.weburl} + ${spring.mvc.static-path-pattern}}）
    # 参考: cc.liqingsong.api.common.config.MvcConfig.java; cc.liqingsong.common.utils.Upload.java;
    upload-weburl:
    # 文件上传的目录(注意必须 / 结尾) 绝对地址（注意Linux和Windows上的目录结构不同）
    upload-dir: E:/uploads/
    # 允许图片上传的类型
    img-type:
      - image/png
      - image/gif
      - image/jpg
      - image/jpeg
```

:::tip
lqsblog 下的配置为自定义配置，其他配置请参照 [springboot官方文档](https://spring.io/projects/spring-boot)。
这里有以下几点需要注意：
1、 `spring.mvc.static-path-pattern` 必须配置。
2、 针对上次文件，`lqsblog.file.upload-weburl` 与 `lqsblog.weburl`，必须配置一个；如果两者都配置则 `lqsblog.file.upload-weburl` 优先级高。
3、 lqsblog-api.admin 会话管理基于 `JWT`，所以 `lqsblog.jwt` 必须配置，并且失效时间不要配置太大，因为系统会自动刷新jwt（只要用户是一直后台操作），当然也不要配置太小jwt容易过期。
4、.gitignore 过滤了`application-*.yml`，所以开发是`application-*.yml`命名规则的文件不好提交到git，方便开发。
5、`spring.profiles.active` 激活环境配置是`local`，也就是说 `application-local.yml` 级别比 `application.yml` 高。
:::


## 本地开发

```bash
# 克隆项目
git clone https://github.com/lqsong/lqsblog-backend-java-springboot.git

# 下载sql，导入mysql 数据库
https://github.com/lqsong/lqsblog/blob/master/database/lqsblog-backend-java-springboot.sql

# 配置lqsblog-api 下  application.yml 数据库、端口、网址等参数
# idea 导入 允许程序，进行开发
run ApiApplication
```
:::tip
注：数据库后台默认用户名、密码分别是：**admin** / **123456**
:::


## 打包与部署

### 打包

当项目开发完毕，打包项目：

```sh
# cd 到项目根目录下，然后运行
mvn clean package
```
然后每个模块的target下都会生产一个jar包。

### 部署

这里以`lqsblog-api包`部署为例：对于部署来讲，你需要以下几步：

#### 1、把 `lqsblog-api-1.0-SNAPSHOT.jar` 与 `application-local.yml` 上传到你的服务器中，放在同一目录，可以修改 `application-local.yml` 的配置，比如数据库链接、站点端口、网址、跨域等。
```sh
# 自定义博客站点配置
lqsblog:
  # 网址，上传图片返回地址有用到
  weburl: http://127.0.0.1:8088
  # 跨域配置
  access:
    # 允许跨域网址 多个,分割
    origins: http://127.0.0.1:8181,http://127.0.0.1:3000
  # jwt 配置
  jwt:
    config:
      # 签名私钥
      key: lqsblog
      # 签名失效时间 - 毫秒 1800000（0.5小时）
      ttl: 1800000
      # 距离签名失效时间多少内可以重置签名 - 毫秒 900000（0.25小时[15分钟]）
      restttl: 900000
    header:
      # Header头 Token 名称
      tokenkey: lqsblog-token
  # 上传文件 配置
  file:
    # 文件上传目录绑定的自定义网址，可为空(注意如果填写必须 / 结尾)，如下格式：
    # upload-weburl: http://127.0.0.1:3001/
    # 默认为空,则上传文件目录的网址为:自定义映射的静态资源网址（${lqsblog.weburl} + ${spring.mvc.static-path-pattern}}）
    # 参考: cc.liqingsong.api.common.config.MvcConfig.java; cc.liqingsong.common.utils.Upload.java;
    upload-weburl:
    # 文件上传的目录(注意必须 / 结尾) 绝对地址（注意Linux和Windows上的目录结构不同）
    upload-dir: E:/uploads/
    # 允许图片上传的类型
    img-type:
      - image/png
      - image/gif
      - image/jpg
      - image/jpeg
```

#### 2、cd 到项目目录下，应用部署

```sh
# 但是此命令，如果关闭命令窗口，服务也会关闭
java -jar lqsblog-api-1.0-SNAPSHOT.jar
# 若：`lqsblog-api-1.0-SNAPSHOT.jar` 与 `application-local.yml` 不在同一目录：可执行： java -jar lqsblog-api-1.0-SNAPSHOT.jar --spring.config.location=/val/usr/application-local.yml

# or

# 你可以利用 nohup 进行管理
nohup java -jar lqsblog-api-1.0-SNAPSHOT.jar &
# nohup 意思是不挂断运行命令,当账户退出或终端关闭时,程序仍然运行
# 当用 nohup 命令执行作业时，缺省情况下该作业的所有输出被重定向到nohup.out的文件中
# 除非另外指定了输出文件，如：$ nohup java -jar test.jar >temp.txt & ，这种方法会把日志文件输入到你指定的文件中，没有则会自动创建

# jobs 命令：会列出所有后台执行的作业，并且每个作业前面都有个编号

```

然后你api网址就是 `IP:端口` 。


#### 3、绑定域名，如果你需要绑定域名，你可以利用 nginx 反向代理

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

