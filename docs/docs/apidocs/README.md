
# 仓库：lqsblog

:::tip 注：
接口地址如：`pc/article/list`、`/admin/user/login`,统一的`pc/`、`/admin/`前缀，在实际请求接口时，你本地的地址可能为：`http://127.0.0.1:8080/pc/vl/article/list`、`http://127.0.0.1:8080/admin/vl/user/login`。
:::

## 模块：pc
### 接口：文章列表
* 地址：pc/article/list
* 类型：GET
* 状态码：200
* 简介：文章列表
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1499743](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1499743)
* 请求接口格式：

```
├─ per: Number (每页多少条)
├─ page: Number (当前页码)
└─ categoryId: Number (分类id)

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ title: String (标题)
│  │  ├─ description: String (简介)
│  │  ├─ addtime: String (发布时间)
│  │  ├─ category: Object (分类)
│  │  │  ├─ alias: String (分类别名)
│  │  │  └─ name: String (分类名称)
│  │  ├─ thumb: Array : Array 
│  │  └─ id: Number 
│  ├─ total: Number (总数据记录)
│  └─ currentPage: Number (当前页)
└─ code: Number (状态)

```


### 接口：首页推荐
* 地址：pc/index/recommend
* 类型：GET
* 状态码：200
* 简介：首页推荐
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1517448](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1517448)
* 请求接口格式：

```

```

* 返回接口格式：

```
├─ code: Number (状态)
└─ data: Array (数据)
   ├─ id: Number (文章/作品 id)
   ├─ title: String (标题)
   ├─ thumb: String (图片)
   ├─ type: Number (类型 1 文章 2 作品)
   └─ sid: Number (搜索表id)

```


### 接口：搜索
* 地址：pc/search
* 类型：GET
* 状态码：200
* 简介：搜索
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1518448](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1518448)
* 请求接口格式：

```
├─ per: Number (每页多少条)
├─ page: Number (当前页码)
└─ keywords: String (关键字)

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ thumb: Array : Array 
│  │  ├─ title: String (标题)
│  │  ├─ description: String (简介)
│  │  ├─ addtime: String (发布时间)
│  │  ├─ category: Object (分类)
│  │  │  ├─ alias: String (分类别名)
│  │  │  └─ name: String (分类名称)
│  │  ├─ id: Number 
│  │  └─ type: Number (类型 1 文章 2 作品)
│  ├─ total: Number (总数据记录)
│  └─ currentPage: Number (当前页)
└─ code: Number (状态)

```


### 接口：文章详情
* 地址：pc/article/detail
* 类型：GET
* 状态码：200
* 简介：文章详情
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1518475](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1518475)
* 请求接口格式：

```
└─ id: Number (ID)

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Object (数据)
   ├─ title: String (标题)
   ├─ addtime: String (发布时间)
   ├─ category: Object (分类)
   │  ├─ alias: String (分类别名)
   │  └─ name: String (分类名称)
   ├─ tag: Array (标签): Array (标签)
   ├─ content: String (内容)
   ├─ description: String (简介)
   ├─ interestIds: String 
   ├─ keywords: String 
   └─ hit: Number 

```


### 接口：文章详情可能感兴趣
* 地址：pc/article/interest
* 类型：GET
* 状态码：200
* 简介：文章详情可能感兴趣
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1518519](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1518519)
* 请求接口格式：

```
└─ ids: String (感兴趣ids , 链接)

```

* 返回接口格式：

```
├─ code: Number (状态)
└─ data: Array (数据)
   ├─ id: Number 
   ├─ title: String (标题)
   ├─ description: String (简介)
   ├─ thumb: Array : Array 
   ├─ addtime: String 
   └─ category: Object (分类)
      ├─ cname: String (分类别名)
      └─ title: String (分类名称)

```


### 接口：关于
* 地址：pc/about
* 类型：GET
* 状态码：200
* 简介：关于
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1518954](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1518954)
* 请求接口格式：

```

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Object (数据)
   ├─ title: String (标题)
   ├─ content: String (内容)
   ├─ description: String (简介)
   └─ keywords: String 

```


### 接口：左邻右舍
* 地址：pc/links/list
* 类型：GET
* 状态码：200
* 简介：左邻右舍
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1519438](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1519438)
* 请求接口格式：

```

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Array (数据)
   ├─ name: String (标题)
   └─ children: Array 
      ├─ title: String 
      ├─ description: String 
      ├─ logo: String 
      ├─ href: String 
      └─ id: Number 

```


### 接口：左邻右舍推荐
* 地址：pc/links/recommend
* 类型：GET
* 状态码：200
* 简介：左邻右舍推荐
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1519502](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1519502)
* 请求接口格式：

```
└─ ids: String (分类id ,链接)

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Array (数据)
   ├─ title: String (标题)
   └─ href: String 

```


### 接口：文章分类信息
* 地址：pc/article/category
* 类型：GET
* 状态码：200
* 简介：文章分类信息
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1519815](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1519815)
* 请求接口格式：

```
└─ alias: String (分类别名)

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Object (数据)
   ├─ title: String (标题)
   ├─ keywords: String (关键词)
   ├─ description: String (简介)
   ├─ name: String (分类名称)
   └─ id: String (分类id)

```


### 接口：标签下内容列表
* 地址：pc/tag/list
* 类型：GET
* 状态码：200
* 简介：标签下的文章、作品等内容的列表
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1520100](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1520100)
* 请求接口格式：

```
├─ name: String (标签名称)
├─ per: Number (分页)
└─ page: Number (页码)

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ thumb: Array : Array 
│  │  ├─ title: String (标题)
│  │  ├─ description: String (简介)
│  │  ├─ addtime: String (发布时间)
│  │  ├─ category: Object (分类)
│  │  │  ├─ alias: String (分类别名)
│  │  │  └─ name: String (分类名称)
│  │  ├─ id: Number 
│  │  └─ type: Number (类型 1 文章 2 作品)
│  ├─ total: Number (总数据记录)
│  └─ currentPage: Number (当前页)
└─ code: Number (状态)

```


### 接口：标签详情
* 地址：pc/tag/detail
* 类型：GET
* 状态码：200
* 简介：作用是判断标签是否存在
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1520218](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1520218)
* 请求接口格式：

```
└─ name: String (标签名称)

```

* 返回接口格式：

```
└─ code: Number 

```


### 接口：站点配置
* 地址：pc/config
* 类型：GET
* 状态码：200
* 简介：站点配置
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1520700](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1520700)
* 请求接口格式：

```

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Object (数据)
   ├─ siteCreationTime: String (站点创建时间)
   ├─ icp: String (备案)
   ├─ keywords: String 
   ├─ description: String 
   ├─ copyrightPerson: String (版权人)
   └─ copyrightUrl: String (版权网址)

```


### 接口：作品列表
* 地址：pc/works/list
* 类型：GET
* 状态码：200
* 简介：作品列表
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1521830](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1521830)
* 请求接口格式：

```
├─ per: Number (每页多少条)
└─ page: Number (当前页码)

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ thumb: Array : Array 
│  │  ├─ title: String (标题)
│  │  ├─ description: String (简介)
│  │  ├─ addtime: String (发布时间)
│  │  └─ id: Number 
│  ├─ total: Number (总数据记录)
│  └─ currentPage: Number (当前页)
└─ code: Number (状态)

```


### 接口：作品详情
* 地址：pc/works/detail
* 类型：GET
* 状态码：200
* 简介：作品详情
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1521989](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1521989)
* 请求接口格式：

```
└─ id: Number (ID)

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Object (数据)
   ├─ title: String (标题)
   ├─ addtime: String (发布时间)
   ├─ content: String (内容)
   ├─ keywords: String 
   ├─ description: String (简介)
   ├─ hit: Number 
   └─ tag: Array (标签): Array (标签)

```


### 接口：专题列表
* 地址：pc/topics/list
* 类型：GET
* 状态码：200
* 简介：专题列表
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1522104](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1522104)
* 请求接口格式：

```
├─ per: Number (每页多少条)
└─ page: Number (当前页码)

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ title: String (标题)
│  │  ├─ alias: String (别名)
│  │  ├─ id: Number 
│  │  ├─ quantity: Number (内容数量)
│  │  └─ conlist: Array 
│  │     ├─ id: Number 
│  │     ├─ title: String (标题)
│  │     ├─ type: Number (类型 1 文章 2 作品)
│  │     └─ thumb: String (图片)
│  ├─ total: Number (总数据记录)
│  └─ currentPage: Number (当前页)
└─ code: Number (状态)

```


### 接口：专题详情
* 地址：pc/topics/detail
* 类型：GET
* 状态码：200
* 简介：专题详情
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1522408](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1522408)
* 请求接口格式：

```
└─ alias: String (别名)

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ type: Number (类型 1 文章 2 作品)
│  │  ├─ thumb: Array : Array 
│  │  ├─ title: String (标题)
│  │  ├─ description: String (简介)
│  │  ├─ addtime: String (发布时间)
│  │  ├─ category: Object (分类)
│  │  │  ├─ alias: String (分类别名)
│  │  │  └─ name: String (分类名称)
│  │  └─ id: Number 
│  ├─ title: String (标题)
│  ├─ keywords: String (关键词)
│  └─ description: String (简介)
└─ code: Number (状态)

```


### 接口：首页列表
* 地址：pc/index/list
* 类型：GET
* 状态码：200
* 简介：首页列表
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1523055](http://rap2.taobao.org/repository/editor?id=247994&mod=365243&itf=1523055)
* 请求接口格式：

```
├─ per: Number (每页多少条)
├─ page: Number (当前页码)
└─ noSid: String (排查的搜索id ,链接)

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ type: Number (类型 1 文章 2 作品)
│  │  ├─ thumb: Array : Array 
│  │  ├─ title: String (标题)
│  │  ├─ description: String (简介)
│  │  ├─ addtime: String (发布时间)
│  │  ├─ category: Object (分类)
│  │  │  ├─ alias: String (分类别名)
│  │  │  └─ name: String (分类名称)
│  │  └─ id: Number 
│  ├─ total: Number (总数据记录)
│  └─ currentPage: Number (当前页)
└─ code: Number (状态)

```


## 模块：admin
### 接口：登录
* 地址：/admin/user/login
* 类型：POST
* 状态码：200
* 简介：示例接口描述
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1524764](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1524764)
* 请求接口格式：

```
├─ username: String (用户名)
├─ password: String (密码)
├─ imgCode: String (图片验证码值)
└─ imgCodeToken: String (图片验证码token)

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Object 
   └─ token: String (生成的token)

```


### 接口：获取用户信息
* 地址：/admin/user/info
* 类型：GET
* 状态码：200
* 简介：获取用户信息
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1524814](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1524814)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Object 
   ├─ roles: Array (角色): Array (角色)
   ├─ avatar: String (头像)
   ├─ name: String (名称)
   ├─ msgtotal: Number (消息数)
   └─ resources: String (权限)

```


### 接口：退出
* 地址：/admin/user/logout
* 类型：POST
* 状态码：200
* 简介：示例接口描述
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1524868](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1524868)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ code: Number 
└─ msg: String 

```


### 接口：文章分类联动下拉列表-get-异步
* 地址：/admin/article/categorys/cascader
* 类型：GET
* 状态码：200
* 简介：文章分类联动下拉列表-get异步
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1528503](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1528503)
* 请求接口格式：

```
├─ lqsblog-token: String 
└─ pid: Number 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Array 
   ├─ name: String (名称)
   ├─ leaf: Boolean (是否为最后一级)
   └─ id: Number 

```


### 接口：标签添加-post
* 地址：/admin/tags
* 类型：POST
* 状态码：200
* 简介：标签添加-post
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1528731](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1528731)
* 请求接口格式：

```
├─ lqsblog-token: String 
├─ name: String (名称)
└─ pinyin: String (拼音)

```

* 返回接口格式：

```
├─ code: Number 
└─ msg: String 

```


### 接口：文章分类编辑-put
* 地址：/admin/article/categorys/:id
* 类型：PUT
* 状态码：200
* 简介：文章分类编辑-put
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1528967](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1528967)
* 请求接口格式：

```
├─ pid: Number (父id)
├─ name: String (名称)
├─ alias: String (别名)
├─ title: String (title)
├─ keywords: String (keywords)
├─ description: String (description)
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：文章分类删除-delete
* 地址：/admin/article/categorys/:id
* 类型：DELETE
* 状态码：200
* 简介：文章分类删除-delete
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1528972](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1528972)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：文章分类列表-get
* 地址：/admin/article/categorys
* 类型：GET
* 状态码：200
* 简介：文章分类列表获取-get异步
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529108](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529108)
* 请求接口格式：

```
├─ lqsblog-token: String 
└─ pid: Number 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Array 
   ├─ name: String (名称)
   ├─ alias: String (别名)
   ├─ title: String (title)
   ├─ id: Number 
   ├─ pid: Number (父id)
   ├─ keywords: String (keywords)
   └─ description: String (description)

```


### 接口：标签列表-get
* 地址：/admin/tags
* 类型：GET
* 状态码：200
* 简介：标签列表-get异步
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529232](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529232)
* 请求接口格式：

```
├─ per: Number (每页多少条)
├─ page: Number (当前页码)
├─ keywords: String (关键词)
├─ lqsblog-token: String 
├─ sort: String (排序字段[id,hit])
└─ order: String ([desc 降序，asc 升序])

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ name: String (名称)
│  │  ├─ id: Number 
│  │  ├─ pinyin: String (拼音)
│  │  └─ hit: Number (浏览次数)
│  ├─ total: Number (总数据记录)
│  └─ currentPage: Number (当前页)
└─ code: Number (状态)

```


### 接口：文章分类添加-post
* 地址：/admin/article/categorys
* 类型：POST
* 状态码：200
* 简介：文章分类添加-post
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529330](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529330)
* 请求接口格式：

```
├─ pid: Number (父id)
├─ name: String (名称)
├─ alias: String (别名)
├─ title: String (title)
├─ keywords: String (keywords)
├─ description: String (description)
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
├─ data: Object 
│  └─ id: Number 
└─ code: Number 

```


### 接口：标签编辑-put
* 地址：/admin/tags/:id
* 类型：PUT
* 状态码：200
* 简介：标签编辑-put
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529344](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529344)
* 请求接口格式：

```
├─ name: String (名称)
├─ lqsblog-token: String 
└─ pinyin: String (拼音)

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：标签删除-delete
* 地址：/admin/tags/:id
* 类型：DELETE
* 状态码：200
* 简介：标签删除-delete
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529371](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529371)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：标签搜索下拉列表-get-异步
* 地址：/admin/tags/search
* 类型：GET
* 状态码：200
* 简介：标签搜索下拉列表-get-异步
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529744](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529744)
* 请求接口格式：

```
├─ lqsblog-token: String 
└─ keywords: String (关键字)

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Array 
   ├─ name: String (名称)
   └─ id: Number 

```


### 接口：文章列表-get
* 地址：/admin/articles
* 类型：GET
* 状态码：200
* 简介：文章列表-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529797](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529797)
* 请求接口格式：

```
├─ per: Number (每页多少条)
├─ page: Number (当前页码)
├─ keywords: String (标题)
├─ lqsblog-token: String 
├─ categoryid: Number (最后一级分类id)
├─ addtimestart: String (发布时间开始)
├─ addtimeend: String (发布时间截止)
├─ tags: String (标签 , 链接的字符串)
├─ sort: Number (排序字段[id,hit])
└─ order: Number ([desc 降序，asc 升序])

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ category: Object (拼音)
│  │  │  ├─ id: Number (分类)
│  │  │  ├─ alias: String (分类别名)
│  │  │  └─ name: String (分类名称)
│  │  ├─ title: String (标题)
│  │  ├─ id: Number 
│  │  ├─ addtime: String (发布时间)
│  │  ├─ tag: String (标签)
│  │  └─ hit: Number (点击量)
│  ├─ total: Number (总数据记录)
│  └─ currentPage: Number (当前页)
└─ code: Number (状态)

```


### 接口：文章删除-delete
* 地址：/admin/articles/:id
* 类型：DELETE
* 状态码：200
* 简介：文章删除-delete
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529989](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1529989)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：图片列表-get
* 地址：/admin/upload/images
* 类型：GET
* 状态码：200
* 简介：图片列表-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1531502](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1531502)
* 请求接口格式：

```
├─ per: Number (每页多少条)
├─ page: Number (当前页码)
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ imgurl: String (图片地址https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg)
│  │  ├─ id: Number 
│  │  └─ size: String 
│  ├─ total: Number (总数据记录)
│  └─ currentPage: Number (当前页)
└─ code: Number (状态)

```


### 接口：图片上传-post
* 地址：/admin/upload/images
* 类型：POST
* 状态码：200
* 简介：图片上传-post
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1531743](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1531743)
* 请求接口格式：

```
├─ lqsblog-token: String 
└─ file: String (文件)

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ title: String (文件名)
│  └─ url: String (文件地址)
└─ code: Number (状态)

```


### 接口：文章添加-post
* 地址：/admin/articles
* 类型：POST
* 状态码：200
* 简介：文章添加-post
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1532384](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1532384)
* 请求接口格式：

```
├─ title: String (标题)
├─ addtime: String (发布时间)
├─ categoryId: Number (分类最后一级ID)
├─ keywords: String (keywords)
├─ description: String (description)
├─ lqsblog-token: String 
├─ tag: String (标签, 分割)
├─ content: String (内容)
├─ interestIds: String (推荐随笔Ids , 分割)
├─ categoryIds: String (分类ids ,分割)
└─ thumb: String (缩略图多个 | 分割)

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：文章详情-get
* 地址：/admin/articles/:id
* 类型：GET
* 状态码：200
* 简介：文章详情-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1532982](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1532982)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Object (数据)
   ├─ title: String (标题)
   ├─ addtime: String (发布时间)
   ├─ categoryId: Number (分类最后一级ID)
   ├─ tag: String (标签, 分割)
   ├─ content: String (内容)
   ├─ keywords: String (关键词)
   ├─ interest: Array (管理文章)
   │  ├─ id: Number 
   │  ├─ title: String (标题)
   │  └─ addtime: String (发布时间)
   ├─ description: String (简介)
   ├─ categoryIds: String (分类ids ,分割)
   └─ thumb: String (缩略图多个 | 分割)

```


### 接口：文章编辑-put
* 地址：/admin/articles/:id
* 类型：PUT
* 状态码：200
* 简介：文章编辑-put
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533139](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533139)
* 请求接口格式：

```
├─ title: String (标题)
├─ addtime: String (发布时间)
├─ categoryId: Number (分类最后一级ID)
├─ keywords: String (keywords)
├─ description: String (description)
├─ lqsblog-token: String 
├─ tag: String (标签, 分割)
├─ content: String (内容)
├─ interestIds: String (推荐随笔Ids , 分割)
├─ categoryIds: String (分类ids ,分割)
└─ thumb: String (缩略图多个 | 分割)

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：作品列表-get
* 地址：/admin/works
* 类型：GET
* 状态码：200
* 简介：作品列表-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533664](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533664)
* 请求接口格式：

```
├─ per: Number (每页多少条)
├─ page: Number (当前页码)
├─ keywords: String (标题)
├─ lqsblog-token: String 
├─ addtimestart: String (发布时间开始)
├─ addtimeend: String (发布时间截止)
├─ tags: String (标签 , 链接的字符串)
├─ sort: String (排序字段[id,hit])
└─ order: String ([desc 降序，asc 升序])

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ title: String (标题)
│  │  ├─ id: Number 
│  │  ├─ addtime: String (发布时间)
│  │  ├─ tag: String (标签)
│  │  └─ hit: String (点击量)
│  ├─ total: Number (总数据记录)
│  └─ currentPage: Number (当前页)
└─ code: Number (状态)

```


### 接口：作品删除-delete
* 地址：/admin/works/:id
* 类型：DELETE
* 状态码：200
* 简介：作品删除-delete
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533669](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533669)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：作品添加-post
* 地址：/admin/works
* 类型：POST
* 状态码：200
* 简介：作品添加-post
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533703](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533703)
* 请求接口格式：

```
├─ title: String (标题)
├─ addtime: String (发布时间)
├─ keywords: String (keywords)
├─ description: String (description)
├─ lqsblog-token: String 
├─ tag: String (标签, 分割)
├─ content: String (内容)
└─ thumb: String (缩略图多个 | 分割)

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：作品编辑-put
* 地址：/admin/works/:id
* 类型：PUT
* 状态码：200
* 简介：作品编辑-put
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533705](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533705)
* 请求接口格式：

```
├─ title: String (标题)
├─ addtime: String (发布时间)
├─ keywords: String (keywords)
├─ description: String (description)
├─ lqsblog-token: String 
├─ tag: String (标签, 分割)
├─ content: String (内容)
└─ thumb: String (缩略图多个 | 分割)

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：作品详情-get
* 地址：/admin/works/:id
* 类型：GET
* 状态码：200
* 简介：作品详情-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533711](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533711)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Object (数据)
   ├─ title: String (标题)
   ├─ addtime: String (发布时间)
   ├─ tag: String (标签, 分割)
   ├─ content: String (内容)
   ├─ keywords: String (关键词)
   ├─ description: String (简介)
   └─ thumb: String (缩略图多个 | 分割)

```


### 接口：专题列表-get
* 地址：/admin/topics
* 类型：GET
* 状态码：200
* 简介：专题列表-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533761](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533761)
* 请求接口格式：

```
├─ per: Number (每页多少条)
├─ page: Number (当前页码)
├─ keywords: String (标题)
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ title: String (标题)
│  │  ├─ id: Number 
│  │  ├─ addtime: String (发布时间)
│  │  └─ alias: String (别名)
│  ├─ total: Number (总数据记录)
│  └─ currentPage: Number (当前页)
└─ code: Number (状态)

```


### 接口：专题删除-delete
* 地址：/admin/topics/:id
* 类型：DELETE
* 状态码：200
* 简介：专题删除-delete
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533765](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533765)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：搜索列表-get
* 地址：/admin/searchs
* 类型：GET
* 状态码：200
* 简介：搜索列表-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533813](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533813)
* 请求接口格式：

```
├─ per: Number (每页多少条)
├─ page: Number (当前页码)
├─ keywords: String (标题)
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ category: Object (分类)
│  │  │  ├─ id: Number 
│  │  │  ├─ alias: String (别名)
│  │  │  └─ name: String 
│  │  ├─ title: String (标题)
│  │  ├─ id: Number 
│  │  ├─ addtime: String (发布时间)
│  │  ├─ description: String (简介)
│  │  ├─ thumb: String (缩略图多个 | 分割)
│  │  └─ type: String (类型 1 文章 2 作品)
│  ├─ total: Number (总数据记录)
│  └─ currentPage: Number (当前页)
└─ code: Number (状态)

```


### 接口：专题添加-post
* 地址：/admin/topics
* 类型：POST
* 状态码：200
* 简介：专题添加-post
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533854](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1533854)
* 请求接口格式：

```
├─ title: String (标题)
├─ addtime: String (发布时间)
├─ keywords: String (keywords)
├─ description: String (description)
├─ lqsblog-token: String 
├─ alias: String (别名)
└─ content: Array (内容): Array (内容)

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：专题编辑-put
* 地址：/admin/topics/:id
* 类型：PUT
* 状态码：200
* 简介：专题编辑-put
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534080](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534080)
* 请求接口格式：

```
├─ title: String (标题)
├─ addtime: String (发布时间)
├─ keywords: String (keywords)
├─ description: String (description)
├─ lqsblog-token: String 
├─ alias: String (别名)
└─ content: Array (内容): Array (内容)

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：专题详情-get
* 地址：/admin/topics/:id
* 类型：GET
* 状态码：200
* 简介：专题详情-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534086](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534086)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Object (数据)
   ├─ title: String (标题)
   ├─ addtime: String (发布时间)
   ├─ alias: String (别名)
   ├─ content: Array (内容)
   │  ├─ type: Number (类型 1 文章 2 作品)
   │  ├─ id: Number 
   │  ├─ title: String (标题)
   │  ├─ description: String (简介)
   │  ├─ thumb: String (缩略图)
   │  ├─ category: Object (分类)
   │  │  ├─ id: String 
   │  │  ├─ alias: String (分类别名)
   │  │  └─ name: String (分类名称)
   │  └─ addtime: String (发布时间)
   ├─ keywords: String (关键词)
   └─ description: String (简介)

```


### 接口：左邻右舍分类列表-get
* 地址：/admin/link/categorys
* 类型：GET
* 状态码：200
* 简介：左邻右舍分类列表-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534140](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534140)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Array 
   ├─ name: String (名称)
   ├─ alias: String (别名)
   └─ id: Number 

```


### 接口：左邻右舍分类添加-post
* 地址：/admin/link/categorys
* 类型：POST
* 状态码：200
* 简介：左邻右舍分类添加-post
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534294](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534294)
* 请求接口格式：

```
├─ name: String (名称)
├─ lqsblog-token: String 
└─ alias: String (别名)

```

* 返回接口格式：

```
├─ msg: String 
├─ code: Number 
└─ data: Object 
   └─ id: Number 

```


### 接口：左邻右舍分类编辑-put
* 地址：/admin/link/categorys/:id
* 类型：PUT
* 状态码：200
* 简介：左邻右舍分类编辑-put
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534300](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534300)
* 请求接口格式：

```
├─ alias: String (别名)
├─ name: String (名称)
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：左邻右舍分类删除-delete
* 地址：/admin/link/categorys/:id
* 类型：DELETE
* 状态码：200
* 简介：左邻右舍分类删除-delete
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534309](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534309)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：左邻右舍列表-get
* 地址：/admin/links
* 类型：GET
* 状态码：200
* 简介：左邻右舍列表-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534361](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534361)
* 请求接口格式：

```
├─ per: Number (每页多少条)
├─ page: Number (当前页码)
├─ keywords: String (标题)
├─ lqsblog-token: String 
└─ categoryid: Number (分类id)

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ category: Object (拼音)
│  │  │  ├─ id: Number (分类)
│  │  │  ├─ alias: String (分类别名)
│  │  │  └─ name: String (分类名称)
│  │  ├─ title: String (名称)
│  │  └─ id: Number 
│  ├─ total: Number (总数据记录)
│  └─ currentPage: Number (当前页)
└─ code: Number (状态)

```


### 接口：左邻右舍删除-delete
* 地址：/admin/links/:id
* 类型：DELETE
* 状态码：200
* 简介：左邻右舍删除-delete
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534410](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534410)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：左邻右舍添加-post
* 地址：/admin/links
* 类型：POST
* 状态码：200
* 简介：左邻右舍添加-post
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534469](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534469)
* 请求接口格式：

```
├─ title: String (名称)
├─ categoryId: Number (分类ID)
├─ description: String (简介)
├─ lqsblog-token: String 
├─ href: String (超链接)
└─ logo: String (logo)

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：左邻右舍编辑-put
* 地址：/admin/links/:id
* 类型：PUT
* 状态码：200
* 简介：左邻右舍编辑-put
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534472](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534472)
* 请求接口格式：

```
├─ title: String (名称)
├─ categoryId: Number (分类ID)
├─ description: String (简介)
├─ lqsblog-token: String 
├─ href: String (超链接)
└─ logo: String (logo)

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：左邻右舍详情-get
* 地址：/admin/links/:id
* 类型：GET
* 状态码：200
* 简介：左邻右舍详情-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534474](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534474)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Object (数据)
   ├─ title: String (名称)
   ├─ href: String (链接)
   ├─ description: String (简介)
   ├─ category: Object (分类)
   │  ├─ id: Number 
   │  └─ name: String (分类名称)
   └─ logo: String (logo)

```


### 接口：关于我详情-get
* 地址：/admin/about
* 类型：GET
* 状态码：200
* 简介：关于我详情-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534755](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534755)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Object (数据)
   ├─ title: String (标题)
   ├─ content: String (内容)
   ├─ keywords: String (关键词)
   └─ description: String (简介)

```


### 接口：关于我添加-post
* 地址：/admin/about
* 类型：POST
* 状态码：200
* 简介：关于我添加-post
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534761](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1534761)
* 请求接口格式：

```
├─ title: String (标题)
├─ keywords: String (keywords)
├─ description: String (description)
├─ lqsblog-token: String 
└─ content: String (内容)

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：搜索热门关键词列表-get
* 地址：/admin/searchs/keywords
* 类型：GET
* 状态码：200
* 简介：搜索热门关键词列表-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1535329](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1535329)
* 请求接口格式：

```
├─ per: Number (每页多少条)
├─ page: Number (当前页码)
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ name: String (关键词)
│  │  └─ hit: Number (搜索次数)
│  ├─ total: Number (总数据记录)
│  └─ currentPage: Number (当前页)
└─ code: Number (状态)

```


### 接口：统计 - 随笔 - 日新增，总量，日同比，周同比-get
* 地址：/admin/stats/articles/dailynew
* 类型：GET
* 状态码：200
* 简介：统计 - 随笔 - 日新增，总量，日同比，周同比-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1535818](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1535818)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ total: Number (总数字量)
│  ├─ num: String (今日新增数量)
│  ├─ day: Number (日同比%)
│  └─ week: Number (周同比%)
└─ code: Number (状态)

```


### 接口：统计 - 作品 - 周新增，总量，chart数据-get
* 地址：/admin/stats/works/weeknew
* 类型：GET
* 状态码：200
* 简介：统计 - 作品 - 周新增，总量，chart数据-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536166](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536166)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ num: String (本周新增数量)
│  ├─ chart: Object (图表数据)
│  │  ├─ day: Array (日期-天): Array (日期-天)
│  │  └─ num: Array (数量): Array (数量)
│  └─ total: Number (总数)
└─ code: Number (状态)

```


### 接口：统计 - 专题 - 月新增，总量，chart数据-get
* 地址：/admin/stats/topics/monthnew
* 类型：GET
* 状态码：200
* 简介：统计 - 专题 - 月新增，总量，chart数据-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536285](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536285)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ num: String (本月新增数量)
│  ├─ chart: Object (图表数据)
│  │  ├─ day: Array (日期-日): Array (日期-日)
│  │  └─ num: Array (数量): Array (数量)
│  └─ total: Number (总数)
└─ code: Number (状态)

```


### 接口：统计 - 左邻右舍 - 年新增，总量，chart数据-get
* 地址：/admin/stats/links/annualnew
* 类型：GET
* 状态码：200
* 简介：统计 - 左邻右舍 - 年新增，总量，chart数据-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536299](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536299)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ num: String (本年度新增数量)
│  ├─ chart: Object (图表数据)
│  │  ├─ day: Array (日期-月): Array (日期-月)
│  │  └─ num: Array (数量): Array (数量)
│  └─ total: Number (总数)
└─ code: Number (状态)

```


### 接口：站点配置详情-get
* 地址：/admin/config
* 类型：GET
* 状态码：200
* 简介：站点配置详情-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536685](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536685)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Object (数据)
   ├─ siteCreationTime: String (站点创建年份)
   ├─ keywords: String 
   ├─ description: String (简介)
   ├─ icp: String (网站备案号)
   ├─ copyrightPerson: String (版权人)
   └─ copyrightUrl: String (版权网址)

```


### 接口：站点配置添加-post
* 地址：/admin/config
* 类型：POST
* 状态码：200
* 简介：站点配置添加-post
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536705](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536705)
* 请求接口格式：

```
├─ siteCreationTime: String (站点创建年份)
├─ keywords: String (keywords)
├─ description: String (description)
├─ lqsblog-token: String 
├─ icp: String (ICP)
├─ copyrightPerson: String (版权)
└─ copyrightUrl: String (版权网址)

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：API列表-get
* 地址：/admin/apis
* 类型：GET
* 状态码：200
* 简介：API列表获取-get异步
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536770](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536770)
* 请求接口格式：

```
├─ lqsblog-token: String 
└─ pid: Number 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Array 
   ├─ name: String (权限名称)
   ├─ permission: String (权限编号)
   ├─ id: Number 
   └─ pid: Number (父id)

```


### 接口：API删除-delete
* 地址：/admin/apis/:id
* 类型：DELETE
* 状态码：200
* 简介：API删除-delete
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536780](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536780)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：API添加-post
* 地址：/admin/apis
* 类型：POST
* 状态码：200
* 简介：API添加-post
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536823](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536823)
* 请求接口格式：

```
├─ pid: Number (父id)
├─ name: String (名称)
├─ permission: String (权限名)
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
├─ data: Object 
│  └─ id: Number 
└─ code: Number 

```


### 接口：API编辑-put
* 地址：/admin/apis/:id
* 类型：PUT
* 状态码：200
* 简介：API编辑-put
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536824](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536824)
* 请求接口格式：

```
├─ pid: Number (父id)
├─ name: String (名称)
├─ permission: String (权限名)
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：菜单列表-get
* 地址：/admin/menus
* 类型：GET
* 状态码：200
* 简介：菜单列表-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536843](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1536843)
* 请求接口格式：

```
├─ lqsblog-token: String 
└─ pid: Number 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Array 
   ├─ pid: Number (父id)
   ├─ name: String (名称)
   ├─ urlcode: String (资源编号)
   ├─ id: Number 
   ├─ permsLevel: String (关联的api 数组 id 多个 层级先 - 链接 然后组 , 链接)
   ├─ perms: String (权限id , 分割)
   └─ type: Number (类型 1、菜单 2、按钮)

```


### 接口：API联动下拉列表-get-异步
* 地址：/admin/apis/cascader
* 类型：GET
* 状态码：200
* 简介：文章分类联动下拉列表-get异步
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1578690](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1578690)
* 请求接口格式：

```
├─ lqsblog-token: String 
└─ pid: Number 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Array 
   ├─ name: String (名称)
   ├─ leaf: Boolean (是否为最后一级)
   └─ id: Number 

```


### 接口：菜单添加-post
* 地址：/admin/menus
* 类型：POST
* 状态码：200
* 简介：菜单添加-post
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1578692](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1578692)
* 请求接口格式：

```
├─ pid: Number (父id)
├─ name: String (名称)
├─ urlcode: String (资源编号)
├─ lqsblog-token: String 
├─ type: Number (类型 1、菜单 2、按钮)
├─ perms: String (权限id , 分割)
└─ permsLevel: String (权限层级id,分割：1-2-3,1-2-4)

```

* 返回接口格式：

```
├─ msg: String 
├─ data: Object 
│  └─ id: Number 
└─ code: Number 

```


### 接口：菜单编辑-put
* 地址：/admin/menus/:id
* 类型：PUT
* 状态码：200
* 简介：菜单编辑-put
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1578696](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1578696)
* 请求接口格式：

```
├─ pid: Number (父id)
├─ name: String (名称)
├─ urlcode: String (资源编号)
├─ lqsblog-token: String 
├─ type: String (类型 1、菜单 2、按钮)
├─ perms: String (权限id , 分割)
└─ permsLevel: String (权限层级id,分割：1-2-3,1-2-4)

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：菜单删除-delete
* 地址：/admin/menus/:id
* 类型：DELETE
* 状态码：200
* 简介：菜单删除-delete
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1578700](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1578700)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：角色列表-get
* 地址：/admin/roles
* 类型：GET
* 状态码：200
* 简介：角色列表-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1579399](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1579399)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ data: Array 
│  ├─ id: Number 
│  ├─ name: String (角色名称)
│  ├─ description: String (角色描述)
│  ├─ resources: String (菜单id , 分割)
│  └─ resourcesLevel: String (菜单层级id,分割：1-2-3,1-2-4)
└─ code: Number (状态)

```


### 接口：菜单联动下拉列表-get-异步
* 地址：/admin/menus/cascader
* 类型：GET
* 状态码：200
* 简介：菜单联动下拉列表-get-异步
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1579448](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1579448)
* 请求接口格式：

```
├─ lqsblog-token: String 
└─ pid: Number 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Array 
   ├─ name: String (名称)
   ├─ leaf: Boolean (是否为最后一级)
   └─ id: Number 

```


### 接口：角色添加-post
* 地址：/admin/roles
* 类型：POST
* 状态码：200
* 简介：角色添加-post
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1579844](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1579844)
* 请求接口格式：

```
├─ name: String (名称)
├─ lqsblog-token: String 
├─ description: String (备注)
├─ resources: String (菜单id , 分割)
└─ resourcesLevel: String (菜单层级id,分割：1-2-3,1-2-4)

```

* 返回接口格式：

```
├─ msg: String 
├─ data: Object 
│  └─ id: Number 
└─ code: Number 

```


### 接口：角色编辑-put
* 地址：/admin/roles/:id
* 类型：PUT
* 状态码：200
* 简介：角色编辑-put
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1579860](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1579860)
* 请求接口格式：

```
├─ pid: Number (父id)
├─ name: String (名称)
├─ description: String (备注)
├─ lqsblog-token: String 
├─ resources: String (菜单id , 分割)
└─ resourcesLevel: String (菜单层级id,分割：1-2-3,1-2-4)

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：角色删除-delete
* 地址：/admin/roles/:id
* 类型：DELETE
* 状态码：200
* 简介：角色删除-delete
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1579861](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1579861)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：账号列表-get
* 地址：/admin/accounts
* 类型：GET
* 状态码：200
* 简介：账号列表-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1579958](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1579958)
* 请求接口格式：

```
├─ per: Number (每页多少条)
├─ page: Number (当前页码)
├─ keywords: String (关键词)
├─ sort: String (排序字段[id])
├─ order: String ([desc 降序，asc 升序])
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ data: Object 
│  ├─ list: Array (列表)
│  │  ├─ nickname: String (昵称)
│  │  ├─ username: String (用户名)
│  │  ├─ id: Number 
│  │  └─ roles: Array (角色)
│  │     ├─ id: String (角色id)
│  │     └─ name: String (角色名称)
│  ├─ total: Number (总数据记录)
│  └─ currentPage: Number (当前页)
└─ code: Number (状态)

```


### 接口：账号详情-get
* 地址：/admin/accounts/:id
* 类型：GET
* 状态码：200
* 简介：账号详情-get
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1579992](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1579992)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Object (数据)
   ├─ username: String (用户名)
   ├─ nickname: String (昵称)
   ├─ roles: Array (角色)
   │  ├─ id: String (角色id)
   │  └─ name: String (角色名称)
   └─ id: Number 

```


### 接口：账号删除-delete
* 地址：/admin/accounts/:id
* 类型：DELETE
* 状态码：200
* 简介：账号删除-delete
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1580159](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1580159)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：账号添加-post
* 地址：/admin/accounts
* 类型：POST
* 状态码：200
* 简介：账号添加-post
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1580256](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1580256)
* 请求接口格式：

```
├─ username: String (用户名)
├─ lqsblog-token: String 
├─ password: String (密码)
├─ nickname: String (昵称)
└─ roles: Array (角色id数组): Array (角色id数组)

```

* 返回接口格式：

```
├─ msg: String 
├─ data: Object 
│  └─ id: Number 
└─ code: Number 

```


### 接口：账号编辑-put
* 地址：/admin/accounts/:id
* 类型：PUT
* 状态码：200
* 简介：账号编辑-put
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1580264](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1580264)
* 请求接口格式：

```
├─ username: String (用户名)
├─ lqsblog-token: String 
├─ password: String (密码(有就修改没有就不修改))
├─ nickname: String (昵称)
└─ roles: Array (角色id数组): Array (角色id数组)

```

* 返回接口格式：

```
├─ msg: String 
└─ code: Number 

```


### 接口：API列表-get全部
* 地址：/admin/apis/all
* 类型：GET
* 状态码：200
* 简介：API列表-get全部
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1587359](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1587359)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Array 
   ├─ name: String (名称)
   ├─ id: Number 
   └─ pid: Number (父id)

```


### 接口：菜单列表-get全部
* 地址：/admin/menus/all
* 类型：GET
* 状态码：200
* 简介：菜单列表-get全部
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1587470](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1587470)
* 请求接口格式：

```
└─ lqsblog-token: String 

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Array 
   ├─ name: String (名称)
   ├─ id: Number 
   └─ pid: Number (父id)

```


### 接口：获取图片验证码
* 地址：/admin/guest/validateCodeImg
* 类型：GET
* 状态码：200
* 简介：获取图片验证码
* Rap地址：[http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1594684](http://rap2.taobao.org/repository/editor?id=247994&mod=370488&itf=1594684)
* 请求接口格式：

```

```

* 返回接口格式：

```
├─ code: Number 
└─ data: Object 
   ├─ base64: String (base64图片)
   └─ tokenCode: String (jwt加密code)

```