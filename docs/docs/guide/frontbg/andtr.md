# lqsblog-frontend-ant-design-pro-react

[lqsblog-frontend-ant-design-pro-react](https://github.com/lqsong/lqsblog-frontend-ant-design-pro-react) [![GitHub stars](https://img.shields.io/github/stars/lqsong/lqsblog-frontend-ant-design-pro-react.svg?style=social&label=Stars)](https://github.com/lqsong/lqsblog-frontend-ant-design-pro-react) 是一个LqsBlog ADMIN管理后台，它基于 [Ant Design Pro](https://pro.ant.design/index-cn)实现。


## 功能

```
- 多语言
- 登录 / 注销
- 首页 / 统计
- 随笔管理
  - 随笔列表
    - 随笔添加
    - 随笔编辑
    - 随笔删除
  - 随笔分类
    - 随笔分类添加
    - 随笔分类编辑
    - 随笔分类删除
- 作品管理
  - 作品列表
    - 作品添加
    - 作品编辑
    - 作品删除
- 专题管理
  - 专题列表
    - 专题添加
    - 专题编辑
    - 专题删除
- 左邻右舍
  - 链接列表
    - 链接添加
    - 链接编辑
    - 链接删除
  - 链接分类
    - 链接笔分类添加
    - 链接分类编辑
    - 链接分类删除
    - 链接分类排序
- 设置
  - 关于我
  - 标签管理
    - 标签添加
    - 标签编辑
    - 标签删除
  - 账号列表
    - 账号添加
    - 账号编辑
    - 账号删除
    - 账号权限角色
  - 角色列表
    - 角色添加
    - 角色编辑
    - 角色删除
    - 角色菜单权限
  - 后台菜单
    - 菜单添加
    - 菜单编辑
    - 菜单删除
    - 菜单后端API权限
  - 后台API
   - 后台API添加
   - 后台API编辑
   - 后台API删除
  - 站点配置
```

## 环境准备

### 复制配置文件 '.env'

复制 '.env' 重命名为 ' .env.local' , 启用、修改对应的参数.

```bash
# api接口域名
API_HOST=http://rap2.taobao.org:38080/app/mock/247994/admin
```

### Install `node_modules`:

```bash
yarn
```

or

```bash
npm install
```

### Start project

```bash
yarn start:dev-no-ui
```

or

```bash
npm start:dev-no-ui
```

### Build project

```bash
npm run build
```

### Check code style

```bash
npm run lint
```

You can also use script to auto fix some lint error:

```bash
npm run lint:fix
```

### Test code

```bash
npm test
```

### More

You can view full document on our [official website](https://pro.ant.design). And welcome any feedback in our [github](https://github.com/ant-design/ant-design-pro).



## 与服务端交互 & Mock Data

> 本项目 Mock Data 是基于 “[阿里的RAP](http://rap2.taobao.org/)”，方便前后端开发统一接口。具体内容请参照[API文档](/apidocs/)。


## 界面展示

![index](https://gitee.com/lqsong/lqsblog/raw/master/images/lqsblog-frontend-ant-design-pro-react/index.png) 
![set-adminapi](https://gitee.com/lqsong/lqsblog/raw/master/images/lqsblog-frontend-ant-design-pro-react/set-adminapi.png) 
![set-adminmenu](https://gitee.com/lqsong/lqsblog/raw/master/images/lqsblog-frontend-ant-design-pro-react/set-adminmenu.png) 
![set-adminmenu2](https://gitee.com/lqsong/lqsblog/raw/master/images/lqsblog-frontend-ant-design-pro-react/set-adminmenu2.png) 
![set-role](https://gitee.com/lqsong/lqsblog/raw/master/images/lqsblog-frontend-ant-design-pro-react/set-role.png) 
![set-account](https://gitee.com/lqsong/lqsblog/raw/master/images/lqsblog-frontend-ant-design-pro-react/set-account.png) 
