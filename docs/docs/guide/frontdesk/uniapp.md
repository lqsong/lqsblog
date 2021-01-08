# lqsblog-frontend-uniapp

它（[Github](https://github.com/lqsong/lqsblog-frontend-uniapp) 、 [Gitee](https://gitee.com/lqsong/lqsblog-frontend-uniapp)）是一个手机端展示前台，它基于 [uni-app](https://uniapp.dcloud.io)实现。

## 快速体验

| 微信小程序 | 支付宝小程序  | 字节跳动小程序  |
| --- | --- |--- |
| ![微信小程序](http://uploads.liqingsong.cc/20200531/583057e8-8bab-4eee-b5a0-bec915089c0c.jpg)  | ![支付宝小程序](http://uploads.liqingsong.cc/20210106/fd8662ce-8f8a-4bca-8bf0-170a3fb30a31.jpg) |![字节跳动小程序](http://uploads.liqingsong.cc/20210108/a174ce14-6691-4206-8482-cd1be2cabf73.png) |

> 你可以打开对应平台扫描对应平台小程序码体验效果，以上只做了 微信、支付宝、字节跳动 的小程序生产展示，你如果需要体验其他平台小程序，可以自己下载到本地参照开发文档进行生成。 

## 功能

```
- 随笔
- 作品
- 搜索
- 专题
- 关于
```

## 目录结构

本项目基于 uni-app 生成，下面是整个项目的目录结构。大部分主体目录结构说明请参照[uniapp目录结构](https://uniapp.dcloud.io/frame?id=%e7%9b%ae%e5%bd%95%e7%bb%93%e6%9e%84)

```bash
├── common                     # 公共资源
│   │── config                 # 配置
│   │── css                    # 公共css
│   │── request                # 自定义封装 ajax 组件
│   └── utils                  # 工具函数目录
├── components                 # 组件目录
├── pages                      # 页面目录
│   ├── about                  # 关于
│   ├── articles               # 随笔
│   ├── search                 # 搜索
│   ├── topics                 # 专题
│   └── works                  # 作品
├── static                     # 静态资源
├── store                      # 全局 Store（Vuex）
├── .gitignore                 # Git忽略文件配置
├── App.vue                    # 页面入口文件
├── main.js                    # uni-app 入口
├── manifest.json              # 应用配置文件
├── package.json               # package.json
├── pages.json                 # uni-app 全局配置
└── uni.scss                   # 全局scss变量预置(也可以书写全局样式，最好不要，会多次打包)
```

## 安装

```bash
# 克隆项目
git clone https://github.com/lqsong/lqsblog-frontend-uniapp.git

# 进入项目目录
cd lqsblog-frontend-uniapp

# 安装依赖
npm install

```

### uni-app 开发工具导入项目

然后按照 [uni-app官方文档](https://uniapp.dcloud.io) 进行项目开发。



## 配置

> 配置主体内容你可以参考 [uni-app官方文档](https://uniapp.dcloud.io/collocation/pages)。以下只做扩展内容的说明：

### 修改配置文件 '/common/config/index.js' 对应参数

```js

/**
 * ajax请求接口域名
 */
export const ajaxBaseUrl = 'https://springboot.api.liqingsong.cc/pc/v1';

/**
 * 暂无图片图片地址
 */
export const nopicUrl = 'http://liqingsong.cc/images/nopic.png';
```


