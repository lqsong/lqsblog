-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2020-05-30 21:28:36
-- 服务器版本： 5.6.39-log
-- PHP Version: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lqsblog_java_bac`
--

-- --------------------------------------------------------

--
-- 表的结构 `lqs_article`
--

CREATE TABLE IF NOT EXISTS `lqs_article` (
  `id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '分类最后一级ID',
  `category_ids` varchar(205) NOT NULL COMMENT '分类ids ,分割',
  `title` varchar(155) NOT NULL COMMENT '标题',
  `keywords` varchar(205) NOT NULL COMMENT 'keywords',
  `description` varchar(255) NOT NULL COMMENT 'description',
  `thumb` varchar(2000) NOT NULL COMMENT '缩略图多个 | 分割',
  `content` longtext NOT NULL COMMENT '内容',
  `tag` varchar(255) NOT NULL COMMENT '标签, 分割',
  `interest_ids` varchar(205) NOT NULL COMMENT '推荐随笔Ids , 分割',
  `addtime` datetime NOT NULL COMMENT '发布时间',
  `hit` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击数',
  `creator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='文章表';

--
-- 转存表中的数据 `lqs_article`
--

INSERT INTO `lqs_article` (`id`, `category_id`, `category_ids`, `title`, `keywords`, `description`, `thumb`, `content`, `tag`, `interest_ids`, `addtime`, `hit`, `creator_id`, `create_time`) VALUES
(1, 1, '1', 'Ant Design Vue 开发时 upload 自定义手动上传 Axios（ajax）时 new FormData() 出现 [object Object]', 'Ant Design Vue,upload, new FormData,object', '在使用Ant Design Vue 开发时会用到内置的upload,但是在用到内置的upload的时候，由于官网的说明文档比较简洁，总是出现这样那样的问题！', 'http://www.wyxgn.com/uploads/img1/20191225/c32f6625dc60a57cde35b40a0e16a3de.JPG', '> 在使用Ant Design Vue 开发时会用到内置的upload,但是在用到内置的upload的时候，由于官网的说明文档比较简洁，总是出现这样那样的问题！\n\n### 一、手动上传官方样例：\n\n```vue\n<template>\n  <div class="clearfix">\n    <a-upload :fileList="fileList" :remove="handleRemove" :beforeUpload="beforeUpload">\n      <a-button> <a-icon type="upload" /> Select File </a-button>\n    </a-upload>\n    <a-button\n      type="primary"\n      @click="handleUpload"\n      :disabled="fileList.length === 0"\n      :loading="uploading"\n      style="margin-top: 16px"\n    >\n      {{uploading ? ''Uploading'' : ''Start Upload'' }}\n    </a-button>\n  </div>\n</template>\n<script>\n  import reqwest from ''reqwest'';\n  export default {\n    data() {\n      return {\n        fileList: [],\n        uploading: false,\n      };\n    },\n    methods: {\n      handleRemove(file) {\n        const index = this.fileList.indexOf(file);\n        const newFileList = this.fileList.slice();\n        newFileList.splice(index, 1);\n        this.fileList = newFileList;\n      },\n      beforeUpload(file) {\n        this.fileList = [...this.fileList, file];\n        return false;\n      },\n      handleUpload() {\n        const { fileList } = this;\n        const formData = new FormData();\n        fileList.forEach(file => {\n          formData.append(''files[]'', file);\n        });\n        this.uploading = true;\n\n        // You can use any AJAX library you like\n        reqwest({\n          url: ''https://www.mocky.io/v2/5cc8019d300000980a055e76'',\n          method: ''post'',\n          processData: false,\n          data: formData,\n          success: () => {\n            this.fileList = [];\n            this.uploading = false;\n            this.$message.success(''upload successfully.'');\n          },\n          error: () => {\n            this.uploading = false;\n            this.$message.error(''upload failed.'');\n          },\n        });\n      },\n    },\n  };\n</script>\n```\n>**按照官网给的样例是么有问题的!!!**\n\n### 二、完全控制的上传列表官方样例：\n\n```vue\n<template>\n  <a-upload\n    action="https://www.mocky.io/v2/5cc8019d300000980a055e76"\n    :multiple="true"\n    :fileList="fileList"\n    @change="handleChange"\n  >\n    <a-button> <a-icon type="upload" /> Upload </a-button>\n  </a-upload>\n</template>\n<script>\n  export default {\n    data() {\n      return {\n        fileList: [\n          {\n            uid: ''-1'',\n            name: ''xxx.png'',\n            status: ''done'',\n            url: ''http://www.baidu.com/xxx.png'',\n          },\n        ],\n      };\n    },\n    methods: {\n      handleChange(info) {\n        let fileList = [...info.fileList];\n\n        // 1. Limit the number of uploaded files\n        //    Only to show two recent uploaded files, and old ones will be replaced by the new\n        fileList = fileList.slice(-2);\n\n        // 2. read from response and show file link\n        fileList = fileList.map(file => {\n          if (file.response) {\n            // Component will show file.url as link\n            file.url = file.response.url;\n          }\n          return file;\n        });\n\n        this.fileList = fileList;\n      },\n    },\n  };\n</script>\n```\n> 此样例的的功能是，可以通过change事件控制上传文件的类型、大小、数量等等做限制，**按照这个样例也是没有问题！！！**\n\n### 三、但是，我们把这两个结合就会出现问题了：\n\n##### 1、错误演示代码：\n\n```vue\n<template>\n  <div class="clearfix">\n    <a-upload :fileList="fileList" :remove="handleRemove" :beforeUpload="beforeUpload" @change="handleChange">\n      <a-button> <a-icon type="upload" /> Select File </a-button>\n    </a-upload>\n    <a-button\n      type="primary"\n      @click="handleUpload"\n      :disabled="fileList.length === 0"\n      :loading="uploading"\n      style="margin-top: 16px"\n    >\n      {{uploading ? ''Uploading'' : ''Start Upload'' }}\n    </a-button>\n  </div>\n</template>\n<script>\n  import reqwest from ''reqwest'';\n  export default {\n    data() {\n      return {\n        fileList: [],\n        uploading: false,\n      };\n    },\n    methods: {\n      handleRemove(file) {\n        const index = this.fileList.indexOf(file);\n        const newFileList = this.fileList.slice();\n        newFileList.splice(index, 1);\n        this.fileList = newFileList;\n      },\n      beforeUpload(file) {\n        this.fileList = [...this.fileList, file];\n        return false;\n      },\n	  handleChange(info) {\n        let fileList = [...info.fileList];\n\n        // 1. Limit the number of uploaded files\n        //    Only to show two recent uploaded files, and old ones will be replaced by the new\n        fileList = fileList.slice(-2);\n\n        // 2. read from response and show file link\n        fileList = fileList.map(file => {\n          if (file.response) {\n            // Component will show file.url as link\n            file.url = file.response.url;\n          }\n          return file;\n        });\n\n        this.fileList = fileList;\n      },\n      handleUpload() {\n        const { fileList } = this;\n        const formData = new FormData();\n        fileList.forEach(file => {\n          formData.append(''files[]'', file);\n        });\n        this.uploading = true;\n\n        // You can use any AJAX library you like\n        reqwest({\n          url: ''https://www.mocky.io/v2/5cc8019d300000980a055e76'',\n          method: ''post'',\n          processData: false,\n          data: formData,\n          success: () => {\n            this.fileList = [];\n            this.uploading = false;\n            this.$message.success(''upload successfully.'');\n          },\n          error: () => {\n            this.uploading = false;\n            this.$message.error(''upload failed.'');\n          },\n        });\n      },\n    },\n  };\n</script>\n```\n##### 2、正确演示代码：\n\n```vue\n<template>\n  <div class="clearfix">\n    <a-upload :fileList="fileList" :remove="handleRemove" :beforeUpload="beforeUpload" @change="handleChange">\n      <a-button> <a-icon type="upload" /> Select File </a-button>\n    </a-upload>\n    <a-button\n      type="primary"\n      @click="handleUpload"\n      :disabled="fileList.length === 0"\n      :loading="uploading"\n      style="margin-top: 16px"\n    >\n      {{uploading ? ''Uploading'' : ''Start Upload'' }}\n    </a-button>\n  </div>\n</template>\n<script>\n  import reqwest from ''reqwest'';\n  export default {\n    data() {\n      return {\n        fileList: [],\n        uploading: false,\n      };\n    },\n    methods: {\n      handleRemove(file) {\n        const index = this.fileList.indexOf(file);\n        const newFileList = this.fileList.slice();\n        newFileList.splice(index, 1);\n        this.fileList = newFileList;\n      },\n      beforeUpload(file) {\n        this.fileList = [...this.fileList, file];\n        return false;\n      },\n	  handleChange(info) {\n        let fileList = [...info.fileList];\n\n        // 1. Limit the number of uploaded files\n        //    Only to show two recent uploaded files, and old ones will be replaced by the new\n        fileList = fileList.slice(-2);\n\n        // 2. read from response and show file link\n        fileList = fileList.map(file => {\n          if (file.response) {\n            // Component will show file.url as link\n            file.url = file.response.url;\n          }\n          return file;\n        });\n\n        this.fileList = fileList;\n      },\n      handleUpload() {\n        const { fileList } = this;\n        const formData = new FormData();\n        fileList.forEach(file => {\n          formData.append(''files[]'', file.orignFileObj);\n        });\n        this.uploading = true;\n\n        // You can use any AJAX library you like\n        reqwest({\n          url: ''https://www.mocky.io/v2/5cc8019d300000980a055e76'',\n          method: ''post'',\n          processData: false,\n          data: formData,\n          success: () => {\n            this.fileList = [];\n            this.uploading = false;\n            this.$message.success(''upload successfully.'');\n          },\n          error: () => {\n            this.uploading = false;\n            this.$message.error(''upload failed.'');\n          },\n        });\n      },\n    },\n  };\n</script>\n```\n##### 3、对比以上两块代码你会发现问题在 handleUpload() 下的这个地方：\n\n官网单独的手动上传样例：\n```\nfileList.forEach(file => {\n     formData.append(''files[]'', file);\n});\n```\n改动后的代码：\n```\nfileList.forEach(file => {\n     formData.append(''files[]'', file.orignFileObj);\n});\n```\n> 为什么把`file`改成`file.orignFileObj`呢？\n\n##### 因为：你可以 打印下file 看下内容：\n1、没有添加 change 的 handleChange() 时 file 的内容是：\n```\nfile: File(118) {\n    lastModified: 1577163396357,\n    lastModifiedDate:"Tue Dec 24 2019 12:56:36 GMT+0800 (中国标准时间)",\n    name:"xxx.xlsx",\n    size:118,\n    type:"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",\n    uid:"vc-upload-1577245939870-2",\n    webkitRelativePath:""\n}\n```\n2、添加了 change 的 handleChange() 时 file 的内容是：\n```\nfile: {\n    lastModified:1577163396357,\n    lastModifiedDate:"Tue Dec 24 2019 12:56:36 GMT+0800 (中国标准时间)",\n    name:"xxx.xlsx",\n    originFileObj:File(118) {\n        lastModified: 1577163396357,\n        lastModifiedDate:"Tue Dec 24 2019 12:56:36 GMT+0800 (中国标准时间)",\n        name:"xxx.xlsx",\n        size:118,\n        type:"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",\n        uid:"vc-upload-1577245939870-2",\n        webkitRelativePath:""\n    },\n    percent:0,\n    size:118,\n    type:"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",\n    uid:"vc-upload-1577245939870-2"\n}\n\n```\n##### 所以如果你把两个样例组合还按照原有的不变，传`file`，那他传的就是"object Object"，不是文件了，所以改成`file.orignFileObj`就可以了。\n\n###总结：\n>由此可以确定：如果自己自定义  `new FormData()` 然后 `ajax`上传文件，传文件的`orignFileObj`', '前端', '', '2019-12-25 10:56:37', 1, 1, '2020-05-28 17:15:06'),
(2, 1, '1', 'Linux下通过n模块来安装、升级、管理node版本', 'node,npm,重装,更新,版本号', 'linux下更新node到最新版本方法', 'http://www.wyxgn.com/uploads/img1/20190618/4196a97873aaa085619fccb975127067.jpg', '>背景：很久之前就安装了node，但是一直没有进行过升级。\n\n### 一、 查看当前node的版本号\n\n```bash\nnode --version\n```\n>显示版本v6.9.0\n\n### 二、清理npm的cache\n\n```bash\nnpm cache clean -f\n```\n### 三、 版本管理工具 名称： n\n\n```bash\nnpm install -g n\n```\n### 四、更新到最新版\n\n```bash\nn latest\n```\n>n 常用的命令有：\nn 会列出所有安装的版本供你切换\nn latest 安装最新版本\nn stable 安装最新稳定版\nn lts 安装最新长期支持版本\nn rm [版本号] 删除某一版本\nn -h 帮助命令\nn [版本号] 安装指定版本node\n\n### 五、 验证是否成功\n\n```bash\nnode -V\n```\n>然而并没有成功，还是显示的是老的v6.9.0版本\n\n**出现这个问题的原因是  n 模块和系统node的安装路径不同**\n解决：\n##### 1、 查看系统node的安装路径\n```bash\nwhich node\n```\n>显示路径：/home/node-v6.9.0-linux-x64/bin/node\n然而：n模块的node默认路径为 ‘/usr/local’\n\n##### 2、 通过N_PREFIX变量来修改 n 的默认node安装路径\n- 编辑环境配置文件\n```bash\nvim ~/.bash_profile  \n```\n>按i键使编辑器进入到插入模式\n\n-添加配置语句\n```bash\nexport N_PREFIX=/home/node-v6.9.0-linux-x64/ #自己定义的node实际安装位置\nexport PATH=$N_PREFIX/bin:$PATH\n```\n>:wq保存退出\n\n##### 3、执行source使修改生效\n```bash\nsource ~/.bash_profile\n```\n##### 4、检查是否生效\n```bash\necho $N_PREFIX\n```\n### 六、这时候在执行上述第四、五步骤就可以\n```bash\nn latest\nnode -V\n```\n### 七、n模块管理node\n>是Node的一个模块，作者是TJ Holowaychuk（鼎鼎大名的Express框架作者），就像它的名字一样，它的理念就是简单：\n\n操作：输入n，显示如下\n```bash\nn\n    0.10.1 \n    0.10.15 \no   0.10.21 \n    0.11.8\n```\n>输出当前已经安装的node版本以及正在使用的版本（前面有一个o\n），你可以通过移动上下方向键来选择要使用的版本，最后按回车生效\n\n其他参数：\n>n latest 安装最新版本\nn stable 安装最新稳定版\nn lts 安装最新长期支持版本\nn rm [版本号] 删除某一版本\nn -h 帮助命令\nn [版本号] 安装指定版本node\n\n\n\n\n\n', '运维', '1', '2019-06-18 11:31:12', 1, 1, '2020-05-28 18:04:31');

-- --------------------------------------------------------

--
-- 表的结构 `lqs_article_category`
--

CREATE TABLE IF NOT EXISTS `lqs_article_category` (
  `id` bigint(20) unsigned NOT NULL,
  `p_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(35) NOT NULL COMMENT '名称',
  `alias` varchar(35) NOT NULL COMMENT '别名',
  `title` varchar(155) NOT NULL COMMENT 'title',
  `keywords` varchar(205) NOT NULL COMMENT 'keywords',
  `description` varchar(255) NOT NULL COMMENT 'description',
  `hit` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击数'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='文章分类表';

--
-- 转存表中的数据 `lqs_article_category`
--

INSERT INTO `lqs_article_category` (`id`, `p_id`, `name`, `alias`, `title`, `keywords`, `description`, `hit`) VALUES
(1, 0, '技术知识', 'jszs', '技术知识', 'IT技术,WEB前端,WEB后端,html,css,javascript,php,java', '记录关于IT技术的知识点，包含：WEB前端、WEB后端、html、css、javascript、nodejs、vue、react、php、java、小程序等等。', 2),
(2, 0, '生活美学', 'shmx', '生活美学', '生活随笔,个人日记,风景照片,备忘录', '从明天起，做一个幸福的人；喂马、劈柴，周游世界；从明天起，关心粮食和蔬菜；我有一所房子，面朝大海，春暖花开。——海子', 6);

-- --------------------------------------------------------

--
-- 表的结构 `lqs_attachment`
--

CREATE TABLE IF NOT EXISTS `lqs_attachment` (
  `id` bigint(20) unsigned NOT NULL,
  `file_old_name` varchar(100) NOT NULL COMMENT '原文件名',
  `file_name` varchar(100) NOT NULL COMMENT '当前文件名',
  `file_sub_dir` varchar(25) NOT NULL COMMENT '文件子目录',
  `file_type` varchar(100) NOT NULL COMMENT '文件类型',
  `file_size` bigint(20) NOT NULL COMMENT '文件大小',
  `file_suffix` varchar(20) DEFAULT NULL COMMENT '文件后缀',
  `creator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='文件上传表';

-- --------------------------------------------------------

--
-- 表的结构 `lqs_config`
--

CREATE TABLE IF NOT EXISTS `lqs_config` (
  `id` int(20) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '别名（标识）',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` varchar(255) NOT NULL COMMENT '值'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='站点配置表';

--
-- 转存表中的数据 `lqs_config`
--

INSERT INTO `lqs_config` (`id`, `name`, `title`, `content`) VALUES
(1, 'keywords', '网站关键词', '李庆松,博客,个人博客,IT技术,前端,后端,全栈'),
(2, 'description', '网站简介', '李庆松的个人博客'),
(3, 'siteCreationTime', '站点创建年份', '2018'),
(4, 'icp', '网站备案号', '浙ICP备16042703号'),
(5, 'copyrightPerson', '版权人', 'LiQingSong'),
(6, 'copyrightUrl', '版权网址', 'http://liqingsong.cc');

-- --------------------------------------------------------

--
-- 表的结构 `lqs_link`
--

CREATE TABLE IF NOT EXISTS `lqs_link` (
  `id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '分类最后一级ID',
  `title` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(255) NOT NULL COMMENT 'description',
  `logo` varchar(255) NOT NULL COMMENT 'logo',
  `href` varchar(255) NOT NULL COMMENT '超链接',
  `hit` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击数',
  `creator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='左邻右舍表';

--
-- 转存表中的数据 `lqs_link`
--

INSERT INTO `lqs_link` (`id`, `category_id`, `title`, `description`, `logo`, `href`, `hit`, `creator_id`, `create_time`) VALUES
(1, 1, '网页小功能', '原创定制最好的网页插件小功能', '', 'http://wyxgn.com', 0, 1, '2020-04-14 15:44:52'),
(2, 2, 'Animate.css', '最有名的动画效果库', '', 'https://github.com/animate-css/animate.css', 0, 1, '2020-05-28 14:57:05');

-- --------------------------------------------------------

--
-- 表的结构 `lqs_link_category`
--

CREATE TABLE IF NOT EXISTS `lqs_link_category` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(35) NOT NULL COMMENT '名称',
  `alias` varchar(35) NOT NULL COMMENT '别名',
  `sort` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='左邻右舍分类表';

--
-- 转存表中的数据 `lqs_link_category`
--

INSERT INTO `lqs_link_category` (`id`, `name`, `alias`, `sort`) VALUES
(1, '友情链接', 'yqlj', 99),
(2, 'Css & 动画', 'cssdh', 0);

-- --------------------------------------------------------

--
-- 表的结构 `lqs_search`
--

CREATE TABLE IF NOT EXISTS `lqs_search` (
  `sid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `id` bigint(20) NOT NULL COMMENT '文章或作品id',
  `type` smallint(6) NOT NULL DEFAULT '0' COMMENT '\r\n类型 1 文章 2 作品',
  `category_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '分类最后一级ID',
  `title` varchar(155) NOT NULL COMMENT '标题',
  `keywords` varchar(205) NOT NULL COMMENT 'keywords',
  `description` varchar(255) NOT NULL COMMENT 'description',
  `thumb` varchar(2000) NOT NULL COMMENT '缩略图多个 | 分割',
  `tag` varchar(255) NOT NULL COMMENT '标签, 分割',
  `addtime` datetime NOT NULL COMMENT '发布时间',
  `key_precise` text NOT NULL COMMENT '搜索关键词'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='搜索表';

--
-- 转存表中的数据 `lqs_search`
--

INSERT INTO `lqs_search` (`sid`, `id`, `type`, `category_id`, `title`, `keywords`, `description`, `thumb`, `tag`, `addtime`, `key_precise`) VALUES
(1265942450522910721, 1, 2, 0, 'admin-element-vue 一个后台前端解决方案，它基于 vue 和 element-ui实现', 'vue,vuex,element-ui,ajax,axios,admin,前端,后台', 'admin-element-vue 是一个后台前端解决方案，它基于 vue 和 element-ui实现。它使用了最新的前端技术栈，动态路由，权限验证，它可以帮助你快速搭建企业级中后台产品原型。相信不管你的需求是什么，本项目都能帮助到你。', 'https://gitee.com/lqsong/public/raw/master/admin-element-vue/admin1.png', '前端', '2020-03-15 17:26:43', 'tag_前端'),
(1265943197402624001, 1, 1, 1, 'Ant Design Vue 开发时 upload 自定义手动上传 Axios（ajax）时 new FormData() 出现 [object Object]', 'Ant Design Vue,upload, new FormData,object', '在使用Ant Design Vue 开发时会用到内置的upload,但是在用到内置的upload的时候，由于官网的说明文档比较简洁，总是出现这样那样的问题！', 'http://www.wyxgn.com/uploads/img1/20191225/c32f6625dc60a57cde35b40a0e16a3de.JPG', '前端', '2019-12-25 10:56:37', 'category_1 tag_前端'),
(1265947048809705474, 2, 1, 1, 'Linux下通过n模块来安装、升级、管理node版本', 'node,npm,重装,更新,版本号', 'linux下更新node到最新版本方法', 'http://www.wyxgn.com/uploads/img1/20190618/4196a97873aaa085619fccb975127067.jpg', '运维', '2019-06-18 11:31:12', 'category_1 tag_运维');

-- --------------------------------------------------------

--
-- 表的结构 `lqs_search_hotword`
--

CREATE TABLE IF NOT EXISTS `lqs_search_hotword` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '搜索词',
  `hit` bigint(20) NOT NULL DEFAULT '0' COMMENT '搜索次数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='搜索热词';

-- --------------------------------------------------------

--
-- 表的结构 `lqs_search_hotword_log`
--

CREATE TABLE IF NOT EXISTS `lqs_search_hotword_log` (
  `id` bigint(20) unsigned NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `hotword` varchar(50) NOT NULL DEFAULT '' COMMENT '搜索词',
  `country` varchar(50) NOT NULL DEFAULT '' COMMENT '国家',
  `region` varchar(50) NOT NULL DEFAULT '' COMMENT '地区(省)',
  `city` varchar(50) NOT NULL DEFAULT '' COMMENT '市',
  `area` varchar(50) NOT NULL DEFAULT '' COMMENT '区',
  `isp` varchar(50) NOT NULL DEFAULT '' COMMENT '宽带供应商(电信、联通、移动)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='搜索热词日志';

-- --------------------------------------------------------

--
-- 表的结构 `lqs_single_page`
--

CREATE TABLE IF NOT EXISTS `lqs_single_page` (
  `id` int(20) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '栏目名称',
  `alias` varchar(50) NOT NULL COMMENT '栏目别名',
  `title` varchar(155) NOT NULL COMMENT 'title',
  `keywords` varchar(205) NOT NULL COMMENT 'keywords',
  `description` varchar(255) NOT NULL COMMENT 'description',
  `content` longtext NOT NULL COMMENT '内容',
  `hit` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击数'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='单页面表';

--
-- 转存表中的数据 `lqs_single_page`
--

INSERT INTO `lqs_single_page` (`id`, `name`, `alias`, `title`, `keywords`, `description`, `content`, `hit`) VALUES
(1, '关于我', 'about', '关于我', '李庆松,博客,个人博客,IT技术,前端,后端,全栈', '李庆松的个人博客', '\n```html\n<title>About LiQingSong</title>\n```\n\n> Information\n\n```css\n#LiQingSong {\n    Sex: Male;\n    Address: Hangzhou, zhejiang;\n    Hometown: Lu ''an, anhui;    \n    Professional: Website development;\n    Skills:  Front-end siege lion, back-end program ape;\n    Remark:  A post-90s IT worker;\n}\n```\n\n> Working years\n\n```javascript\nconst currentYear = new Date().getFullYear();\nlet workYear = 2010;\nlet year = 0;\nfor (workYear; workYear<currentYear;workYear++) { \n    year++\n}\nalert(year);\n```\n\n> Work experience\n\n```java\nMap<String, String> workExp = new HashMap<>();\nworkExp.put("2010-2011","安徽○合肥");\nworkExp.put("2012-2013","吉林○长春");\nworkExp.put("2014-2014","江苏○南京");\nworkExp.put("2015-至今","浙江○杭州");\n```\n\n> For More...\n\n```sql\nSELECT * FROM liqingsong.cc\n```', 53),
(2, '随笔', 'articleMainCategory', '随笔', '随笔,个人文章,技术文章,写真生活,IT技术,备忘录,个人日志,技术日志', '这里是我的个人随笔，也是个人的备忘录，包含：IT技术、WEB前端、WEB后端、生活美学、个人日记等等。', '', 23);

-- --------------------------------------------------------

--
-- 表的结构 `lqs_sys_permission`
--

CREATE TABLE IF NOT EXISTS `lqs_sys_permission` (
  `id` bigint(20) NOT NULL COMMENT '编号',
  `name` varchar(30) DEFAULT NULL COMMENT '权限名称',
  `permission` varchar(100) DEFAULT NULL COMMENT '权限编号',
  `description` varchar(50) DEFAULT NULL COMMENT '权限描述',
  `pid` bigint(20) DEFAULT '0' COMMENT '父节点'
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COMMENT='api服务权限表';

--
-- 转存表中的数据 `lqs_sys_permission`
--

INSERT INTO `lqs_sys_permission` (`id`, `name`, `permission`, `description`, `pid`) VALUES
(1, '随笔列表', '/admin/v1/articles:list', NULL, 0),
(2, '随笔新增', '/admin/v1/articles:create', NULL, 1),
(3, '随笔编辑', '/admin/v1/articles:update', NULL, 1),
(4, '随笔删除', '/admin/v1/articles:delete', NULL, 1),
(5, '随笔详情', '/admin/v1/articles:read', NULL, 1),
(6, '随笔分类', '/admin/v1/articles/categorys:list', NULL, 0),
(7, '随笔分类新增', '/admin/v1/articles/categorys:create', NULL, 6),
(8, '随笔分类编辑', '/admin/v1/articles/categorys:update', NULL, 6),
(9, '随笔分类删除', '/admin/v1/articles/categorys:delete', NULL, 6),
(10, '作品列表', '/admin/v1/works:list', NULL, 0),
(11, '作品新增', '/admin/v1/works:create', NULL, 10),
(12, '作品编辑', '/admin/v1/works:update', NULL, 10),
(13, '作品删除', '/admin/v1/works:delete', NULL, 10),
(14, '作品详情', '/admin/v1/works:read', NULL, 10),
(15, '专题列表', '/admin/v1/topics:list', NULL, 0),
(16, '专题新增', '/admin/v1/topics:create', NULL, 15),
(17, '专题编辑', '/admin/v1/topics:update', NULL, 15),
(18, '专题删除', '/admin/v1/topics:delete', NULL, 15),
(19, '专题详情', '/admin/v1/topics:read', NULL, 15),
(20, '左邻右舍列表', '/admin/v1/links:list', NULL, 0),
(21, '左邻右舍新增', '/admin/v1/links:create', NULL, 20),
(22, '左邻右舍编辑', '/admin/v1/links:update', NULL, 20),
(23, '左邻右舍删除', '/admin/v1/links:delete', NULL, 20),
(24, '左邻右舍详情', '/admin/v1/links:read', NULL, 20),
(25, '左邻右舍分类列表', '/admin/v1/links/categorys:list', NULL, 0),
(26, '左邻右舍分类新增', '/admin/v1/links/categorys:create', NULL, 25),
(27, '左邻右舍分类编辑', '/admin/v1/links/categorys:update', NULL, 25),
(28, '左邻右舍分类删除', '/admin/v1/links/categorys:delete', NULL, 25),
(29, '标签管理', '/admin/v1/tags:list', NULL, 0),
(30, '标签新增', '/admin/v1/tags:create', NULL, 29),
(31, '标签编辑', '/admin/v1/tags:update', NULL, 29),
(32, '标签删除', '/admin/v1/tags:delete', NULL, 29),
(33, '关于我', '/admin/v1/about:read', NULL, 0),
(34, '关于我编辑', '/admin/v1/about:update', NULL, 33),
(35, '站点配置', '/admin/v1/config:read', NULL, 0),
(36, '站点配置编辑', '/admin/v1/config:update', NULL, 35),
(37, '账号列表', '/admin/v1/accounts:list', NULL, 0),
(38, '账户新增', '/admin/v1/accounts:create', NULL, 37),
(39, '账号编辑', '/admin/v1/accounts:update', NULL, 37),
(40, '账号删除', '/admin/v1/accounts:delete', NULL, 37),
(41, '账号详情', '/admin/v1/accounts:read', NULL, 37),
(42, '角色列表', '/admin/v1/roles:list', NULL, 0),
(43, '角色新增', '/admin/v1/roles:create', NULL, 42),
(44, '角色编辑', '/admin/v1/roles:update', NULL, 42),
(45, '角色删除', '/admin/v1/roles:delete', NULL, 42),
(46, '后台菜单', '/admin/v1/menus:list', NULL, 0),
(47, '后台菜单新增', '/admin/v1/menus:create', NULL, 46),
(48, '后台菜单编辑', '/admin/v1/menus:update', NULL, 46),
(49, '后台菜单删除', '/admin/v1/menus:delete', NULL, 46),
(50, '后台API', '/admin/v1/apis:list', NULL, 0),
(51, '后台API新增', '/admin/v1/apis:create', NULL, 50),
(52, '后台API编辑', '/admin/v1/apis:update', NULL, 50),
(53, '后台API删除', '/admin/v1/apis:delete', NULL, 50);

-- --------------------------------------------------------

--
-- 表的结构 `lqs_sys_resource`
--

CREATE TABLE IF NOT EXISTS `lqs_sys_resource` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(30) NOT NULL COMMENT '名称',
  `urlcode` varchar(100) NOT NULL COMMENT '资源编号',
  `type` smallint(6) NOT NULL DEFAULT '1' COMMENT '类型 1、菜单 2、按钮',
  `perms` varchar(255) NOT NULL COMMENT '权限id , 分割',
  `perms_level` varchar(2000) NOT NULL COMMENT '权限层级id,分割：1-2-3,1-2-4',
  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '父级菜单'
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COMMENT='系统资源表（后台菜单、按钮）';

--
-- 转存表中的数据 `lqs_sys_resource`
--

INSERT INTO `lqs_sys_resource` (`id`, `name`, `urlcode`, `type`, `perms`, `perms_level`, `pid`) VALUES
(1, '随笔管理', 'article', 1, '', '', 0),
(2, '随笔列表', 'article-list', 1, '1', '1', 1),
(3, '随笔新增', 'article-add', 1, '2', '1-2', 1),
(4, '随笔修改', 'article-edit', 1, '3,5', '1-3,1-5', 1),
(5, '随笔分类', 'article-category', 1, '6', '6', 1),
(6, '作品管理', 'works', 1, '', '', 0),
(7, '作品列表', 'works-list', 1, '10', '10', 6),
(8, '作品新增', 'works-add', 1, '11', '10-11', 6),
(9, '作品修改', 'works-edit', 1, '12,14', '10-12,10-14', 6),
(10, '专题管理', 'topics', 1, '', '', 0),
(11, '专题列表', 'topics-list', 1, '15', '15', 10),
(12, '专题新增', 'topics-add', 1, '16', '15-16', 10),
(13, '专题修改', 'topics-edit', 1, '17,19', '15-17,15-19', 10),
(14, '左邻右舍', 'links', 1, '', '', 0),
(15, '链接列表', 'links-list', 1, '20', '20', 14),
(16, '链接分类', 'links-category', 1, '25', '25', 14),
(17, '设置', 'setting', 1, '', '', 0),
(18, '关于我', 'setting-about', 1, '33', '33', 17),
(19, '标签管理', 'setting-taglist', 1, '29', '29', 17),
(20, '账号列表', 'setting-accountlist', 1, '37', '37', 17),
(21, '角色列表', 'setting-rolelist', 1, '42', '42', 17),
(22, '后台菜单', 'setting-menulist', 1, '46', '46', 17),
(23, '后台API', 'setting-apilist', 1, '50', '50', 17),
(24, '站点配置', 'setting-siteconfig', 1, '35', '35', 17),
(25, '随笔删除', 'btn-article-list-del', 2, '4', '1-4', 2),
(26, '随笔分类新增', 'btn-article-category-add', 2, '7', '6-7', 5),
(27, '随笔分类编辑', 'btn-article-category-edit', 2, '8', '6-8', 5),
(28, '随笔分类删除', 'btn-article-category-del', 2, '9', '6-9', 5),
(29, '作品删除', 'btn-works-list-del', 2, '13', '10-13', 7),
(30, '专题删除', 'btn-topics-list-del', 2, '18', '15-18', 11),
(31, '链接新增', 'btn-links-list-add', 2, '21', '20-21', 15),
(32, '链接编辑', 'btn-links-list-edit', 2, '22,24', '20-22,20-24', 15),
(33, '链接删除', 'btn-links-list-del', 2, '23', '20-23', 15),
(34, '链接分类新增', 'btn-links-category-add', 2, '26', '25-26', 16),
(35, '链接分类编辑', 'btn-links-category-edit', 2, '27', '25-27', 16),
(36, '链接分类删除', 'btn-links-category-del', 2, '28', '25-28', 16),
(37, '关于我编辑', 'btn-setting-about-edit', 2, '34', '33-34', 18),
(38, '标签新增', 'btn-setting-taglist-add', 2, '30', '29-30', 19),
(39, '标签编辑', 'btn-setting-taglist-edit', 2, '31', '29-31', 19),
(40, '标签删除', 'btn-setting-taglist-del', 2, '32', '29-32', 19),
(41, '账号新增', 'btn-setting-accountlist-add', 2, '38', '37-38', 20),
(42, '账号编辑', 'btn-setting-accountlist-edit', 2, '39,41', '37-39,37-41', 20),
(43, '账号删除', 'btn-setting-accountlist-del', 2, '40', '37-40', 20),
(44, '角色新增', 'btn-setting-rolelist-add', 1, '30', '29-30', 21),
(45, '角色编辑', 'btn-setting-rolelist-edit', 2, '44', '42-44', 21),
(46, '角色删除', 'btn-setting-rolelist-del', 2, '45', '42-45', 21),
(47, '后台菜单新增', 'btn-setting-menulist-add', 2, '47', '46-47', 22),
(48, '后台菜单编辑', 'btn-setting-menulist-edit', 2, '48', '46-48', 22),
(49, '后台菜单删除', 'btn-setting-menulist-del', 2, '49', '46-49', 22),
(50, '后台API新增', 'btn-setting-apilist-add', 2, '51', '50-51', 23),
(51, '后台API编辑', 'btn-setting-apilist-edit', 2, '52', '50-52', 23),
(52, '后台API删除', 'btn-setting-apilist-del', 2, '53', '50-53', 23),
(53, '站点配置编辑', 'btn-setting-siteconfig-edit', 2, '36', '35-36', 24);

-- --------------------------------------------------------

--
-- 表的结构 `lqs_sys_resource_permission`
--

CREATE TABLE IF NOT EXISTS `lqs_sys_resource_permission` (
  `id` bigint(20) unsigned NOT NULL,
  `resource_id` bigint(20) NOT NULL COMMENT '资源id',
  `permission_id` bigint(20) NOT NULL COMMENT '权限id'
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COMMENT='资源权限关联表';

--
-- 转存表中的数据 `lqs_sys_resource_permission`
--

INSERT INTO `lqs_sys_resource_permission` (`id`, `resource_id`, `permission_id`) VALUES
(60, 2, 1),
(4, 3, 2),
(5, 4, 3),
(6, 4, 5),
(65, 5, 6),
(67, 7, 10),
(14, 8, 11),
(15, 9, 12),
(16, 9, 14),
(69, 11, 15),
(20, 12, 16),
(21, 13, 17),
(22, 13, 19),
(76, 15, 20),
(80, 16, 25),
(82, 18, 33),
(86, 19, 29),
(91, 20, 37),
(95, 21, 42),
(99, 22, 46),
(103, 23, 50),
(105, 24, 35),
(61, 25, 4),
(62, 26, 7),
(63, 27, 8),
(64, 28, 9),
(66, 29, 13),
(68, 30, 18),
(70, 31, 21),
(74, 32, 22),
(75, 32, 24),
(73, 33, 23),
(77, 34, 26),
(78, 35, 27),
(79, 36, 28),
(81, 37, 34),
(83, 38, 30),
(84, 39, 31),
(85, 40, 32),
(87, 41, 38),
(88, 42, 39),
(89, 42, 41),
(90, 43, 40),
(93, 44, 30),
(92, 45, 44),
(94, 46, 45),
(96, 47, 47),
(97, 48, 48),
(98, 49, 49),
(100, 50, 51),
(101, 51, 52),
(102, 52, 53),
(104, 53, 36);

-- --------------------------------------------------------

--
-- 表的结构 `lqs_sys_role`
--

CREATE TABLE IF NOT EXISTS `lqs_sys_role` (
  `id` bigint(20) NOT NULL COMMENT '角色编号',
  `name` varchar(30) NOT NULL COMMENT '角色名称',
  `description` varchar(100) NOT NULL COMMENT '角色描述',
  `resources` varchar(255) NOT NULL COMMENT '资源表id , 分割',
  `resources_level` varchar(2000) NOT NULL COMMENT '资源表层级id,分割：1-2-3,1-2-4'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

--
-- 转存表中的数据 `lqs_sys_role`
--

INSERT INTO `lqs_sys_role` (`id`, `name`, `description`, `resources`, `resources_level`) VALUES
(1, '管理员', '所有权限', '1,2,25,3,4,5,26,27,28,6,7,29,8,9,10,11,30,12,13,14,15,31,32,33,16,34,35,36,17,18,37,19,38,39,40,20,41,42,43,21,44,45,46,22,47,48,49,23,50,51,52,24,53', '1,1-2,1-2-25,1-3,1-4,1-5,1-5-26,1-5-27,1-5-28,6,6-7,6-7-29,6-8,6-9,10,10-11,10-11-30,10-12,10-13,14,14-15,14-15-31,14-15-32,14-15-33,14-16,14-16-34,14-16-35,14-16-36,17,17-18,17-18-37,17-19,17-19-38,17-19-39,17-19-40,17-20,17-20-41,17-20-42,17-20-43,17-21,17-21-44,17-21-45,17-21-46,17-22,17-22-47,17-22-48,17-22-49,17-23,17-23-50,17-23-51,17-23-52,17-24,17-24-53'),
(2, '只读', '只读权限', '1,2,5,6,7,10,11,14,15,16,17,18,19,20,21,22,23,24', '1,1-2,1-5,6,6-7,10,10-11,14,14-15,14-16,17,17-18,17-19,17-20,17-21,17-22,17-23,17-24');

-- --------------------------------------------------------

--
-- 表的结构 `lqs_sys_role_resource`
--

CREATE TABLE IF NOT EXISTS `lqs_sys_role_resource` (
  `id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `resource_id` bigint(20) NOT NULL COMMENT '资源id'
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COMMENT='角色资源关联表';

--
-- 转存表中的数据 `lqs_sys_role_resource`
--

INSERT INTO `lqs_sys_role_resource` (`id`, `role_id`, `resource_id`) VALUES
(70, 1, 1),
(71, 1, 2),
(73, 1, 3),
(74, 1, 4),
(75, 1, 5),
(79, 1, 6),
(80, 1, 7),
(82, 1, 8),
(83, 1, 9),
(84, 1, 10),
(85, 1, 11),
(87, 1, 12),
(88, 1, 13),
(89, 1, 14),
(90, 1, 15),
(94, 1, 16),
(98, 1, 17),
(99, 1, 18),
(101, 1, 19),
(105, 1, 20),
(109, 1, 21),
(113, 1, 22),
(117, 1, 23),
(121, 1, 24),
(72, 1, 25),
(76, 1, 26),
(77, 1, 27),
(78, 1, 28),
(81, 1, 29),
(86, 1, 30),
(91, 1, 31),
(92, 1, 32),
(93, 1, 33),
(95, 1, 34),
(96, 1, 35),
(97, 1, 36),
(100, 1, 37),
(102, 1, 38),
(103, 1, 39),
(104, 1, 40),
(106, 1, 41),
(107, 1, 42),
(108, 1, 43),
(110, 1, 44),
(111, 1, 45),
(112, 1, 46),
(114, 1, 47),
(115, 1, 48),
(116, 1, 49),
(118, 1, 50),
(119, 1, 51),
(120, 1, 52),
(122, 1, 53),
(123, 2, 1),
(124, 2, 2),
(125, 2, 5),
(126, 2, 6),
(127, 2, 7),
(128, 2, 10),
(129, 2, 11),
(130, 2, 14),
(131, 2, 15),
(132, 2, 16),
(133, 2, 17),
(134, 2, 18),
(135, 2, 19),
(136, 2, 20),
(137, 2, 21),
(138, 2, 22),
(139, 2, 23),
(140, 2, 24);

-- --------------------------------------------------------

--
-- 表的结构 `lqs_sys_user`
--

CREATE TABLE IF NOT EXISTS `lqs_sys_user` (
  `id` bigint(20) NOT NULL COMMENT '编号',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `salt` varchar(50) NOT NULL COMMENT '盐值',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `locked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否锁定'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='后台管理用户表';

--
-- 转存表中的数据 `lqs_sys_user`
--

INSERT INTO `lqs_sys_user` (`id`, `username`, `password`, `salt`, `nickname`, `locked`) VALUES
(1, 'admin', '3d6d33f6a206373341d931c20051664a', '6091de4e', '超管', 0),
(2, 'test001', '4a807afab4eeb903bd3570b82edacf7c', '59926db0', 'test', 0);

-- --------------------------------------------------------

--
-- 表的结构 `lqs_sys_user_role`
--

CREATE TABLE IF NOT EXISTS `lqs_sys_user_role` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关联表';

--
-- 转存表中的数据 `lqs_sys_user_role`
--

INSERT INTO `lqs_sys_user_role` (`id`, `user_id`, `role_id`) VALUES
(8, 1, 1),
(7, 2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `lqs_tag`
--

CREATE TABLE IF NOT EXISTS `lqs_tag` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(35) NOT NULL COMMENT '名称',
  `pinyin` varchar(65) NOT NULL COMMENT '拼音',
  `hit` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击数'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='标签表';

--
-- 转存表中的数据 `lqs_tag`
--

INSERT INTO `lqs_tag` (`id`, `name`, `pinyin`, `hit`) VALUES
(1, '前端', 'qianduan', 4),
(2, '后端', 'houduan', 0),
(3, '运维', 'yunwei', 0);

-- --------------------------------------------------------

--
-- 表的结构 `lqs_tag_log`
--

CREATE TABLE IF NOT EXISTS `lqs_tag_log` (
  `id` bigint(20) unsigned NOT NULL,
  `ip` varchar(20) NOT NULL COMMENT 'ip地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `tag` varchar(50) NOT NULL DEFAULT '' COMMENT '标签名称',
  `country` varchar(50) NOT NULL DEFAULT '' COMMENT '国家',
  `region` varchar(50) NOT NULL DEFAULT '' COMMENT '地区(省)',
  `city` varchar(50) NOT NULL DEFAULT '' COMMENT '市',
  `area` varchar(50) NOT NULL DEFAULT '' COMMENT '区',
  `isp` varchar(50) NOT NULL DEFAULT '' COMMENT '宽带供应商(电信、联通、移动)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='标签日志表';

-- --------------------------------------------------------

--
-- 表的结构 `lqs_topics`
--

CREATE TABLE IF NOT EXISTS `lqs_topics` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `alias` varchar(60) NOT NULL COMMENT '别名',
  `keywords` varchar(205) NOT NULL COMMENT 'keywords',
  `description` varchar(255) NOT NULL COMMENT 'description',
  `addtime` datetime NOT NULL COMMENT '发布时间',
  `content` longtext NOT NULL COMMENT '内容',
  `hit` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击数',
  `creator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='专题表';

--
-- 转存表中的数据 `lqs_topics`
--

INSERT INTO `lqs_topics` (`id`, `title`, `alias`, `keywords`, `description`, `addtime`, `content`, `hit`, `creator_id`, `create_time`) VALUES
(1, '第一条专题', 'dytzt', '前端,运维,测试', '前端后台框架与NodeJs', '2020-05-05 18:07:21', '[{"type":1,"id":2,"title":"Linux下通过n模块来安装、升级、管理node版本","description":"linux下更新node到最新版本方法","thumb":"http://www.wyxgn.com/uploads/img1/20190618/4196a97873aaa085619fccb975127067.jpg","addtime":"2019-06-18 11:31:12","category":{"name":"技术知识","alias":"jszs","id":1}},{"type":1,"id":1,"title":"Ant Design Vue 开发时 upload 自定义手动上传 Axios（ajax）时 new FormData() 出现 [object Object]","description":"在使用Ant Design Vue 开发时会用到内置的upload,但是在用到内置的upload的时候，由于官网的说明文档比较简洁，总是出现这样那样的问题！","thumb":"http://www.wyxgn.com/uploads/img1/20191225/c32f6625dc60a57cde35b40a0e16a3de.JPG","addtime":"2019-12-25 10:56:37","category":{"name":"技术知识","alias":"jszs","id":1}},{"type":2,"id":1,"title":"admin-element-vue 一个后台前端解决方案，它基于 vue 和 element-ui实现","description":"admin-element-vue 是一个后台前端解决方案，它基于 vue 和 element-ui实现。它使用了最新的前端技术栈，动态路由，权限验证，它可以帮助你快速搭建企业级中后台产品原型。相信不管你的需求是什么，本项目都能帮助到你。","thumb":"https://gitee.com/lqsong/public/raw/master/admin-element-vue/admin1.png","addtime":"2020-03-15 17:26:43","category":{}}]', 2, 1, '2020-05-28 18:09:14');

-- --------------------------------------------------------

--
-- 表的结构 `lqs_topics_log`
--

CREATE TABLE IF NOT EXISTS `lqs_topics_log` (
  `id` bigint(20) unsigned NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `tid` bigint(20) NOT NULL COMMENT '专题id',
  `topics` varchar(50) NOT NULL DEFAULT '' COMMENT '专题名称',
  `country` varchar(50) NOT NULL DEFAULT '' COMMENT '国家',
  `region` varchar(50) NOT NULL DEFAULT '' COMMENT '地区(省)',
  `city` varchar(50) NOT NULL DEFAULT '' COMMENT '市',
  `area` varchar(50) NOT NULL DEFAULT '' COMMENT '区',
  `isp` varchar(50) NOT NULL DEFAULT '' COMMENT '宽带供应商(电信、联通、移动)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='专题日志表';

-- --------------------------------------------------------

--
-- 表的结构 `lqs_works`
--

CREATE TABLE IF NOT EXISTS `lqs_works` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(155) NOT NULL COMMENT '标题',
  `keywords` varchar(205) NOT NULL COMMENT 'keywords',
  `description` varchar(255) NOT NULL COMMENT 'description',
  `thumb` varchar(2000) NOT NULL COMMENT '缩略图多个 | 分割',
  `content` longtext NOT NULL COMMENT '内容',
  `tag` varchar(255) NOT NULL COMMENT '标签, 分割',
  `addtime` datetime NOT NULL COMMENT '发布时间',
  `hit` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击数',
  `creator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='作品表';

--
-- 转存表中的数据 `lqs_works`
--

INSERT INTO `lqs_works` (`id`, `title`, `keywords`, `description`, `thumb`, `content`, `tag`, `addtime`, `hit`, `creator_id`, `create_time`) VALUES
(1, 'admin-element-vue 一个后台前端解决方案，它基于 vue 和 element-ui实现', 'vue,vuex,element-ui,ajax,axios,admin,前端,后台', 'admin-element-vue 是一个后台前端解决方案，它基于 vue 和 element-ui实现。它使用了最新的前端技术栈，动态路由，权限验证，它可以帮助你快速搭建企业级中后台产品原型。相信不管你的需求是什么，本项目都能帮助到你。', 'https://gitee.com/lqsong/public/raw/master/admin-element-vue/admin1.png', '# 介绍\n\n[admin-element-vue](http://demo.admin-element-vue.liqingsong.cc/) 是一个后台前端解决方案，它基于 [vue](https://github.com/vuejs/vue) 和 [element-ui](https://github.com/ElemeFE/element)实现。它使用了最新的前端技术栈，动态路由，权限验证，它可以帮助你快速搭建企业级中后台产品原型。相信不管你的需求是什么，本项目都能帮助到你。\n\n\n## 功能\n\n```\n- 登录 / 注销\n\n- 权限验证\n  - 页面权限\n  - 权限配置\n\n- 全局功能\n  - 动态顶级菜单（支持设置是否启用）\n  - 动态侧边栏（支持多级路由嵌套）\n  - 动态面包屑（支持自定义配置）\n  - Svg Sprite 图标\n  - Mock 数据\n\n- 综合实例\n  - 引导页\n  - 组件示例\n    - 编辑器\n    - 树形表格\n    - 其他组件  \n  - 页面示例\n    - 列表页面\n    - 表单页面\n    - 详情页面\n  - ECharts 图表\n```\n\n| Default version demo  [链接](http://demo.admin-element-vue.liqingsong.cc/)    | BgImg version demo  [链接](http://bgimg-demo.admin-element-vue.liqingsong.cc/) |\n| --- | --- |\n![Default version demo](https://gitee.com/lqsong/public/raw/master/admin-element-vue/admin1.png)  |  ![BgImg version demo](https://gitee.com/lqsong/public/raw/master/admin-element-vue/admin2.png)\n\n\n## 前序准备\n\n你需要在本地安装 [node](http://nodejs.org/) 和 [git](https://git-scm.com/)。本项目技术栈基于 [ES2015+](http://es6.ruanyifeng.com/)、[vue](https://cn.vuejs.org/index.html)、[vuex](https://vuex.vuejs.org/zh-cn/)、[vue-router](https://router.vuejs.org/zh-cn/) 、[vue-cli](https://github.com/vuejs/vue-cli) 、[axios](https://github.com/axios/axios) 和 [element-ui](https://github.com/ElemeFE/element)，所有的请求数据都使用[Mock.js](https://github.com/nuysoft/Mock)进行模拟，提前了解和学习这些知识会对使用本项目有很大的帮助。\n\n**本项目不支持低版本浏览器(如 ie)**\n\n## 目录结构\n\n本项目已经为你生成了一个完整的开发框架，下面是整个项目的目录结构。\n\n```bash\n├── public                     # 静态资源\n│   │── favicon.ico            # favicon图标\n│   └── index.html             # html模板\n├── src                        # 源代码\n│   ├── assets                 # 静态资源\n│   │   ├── css                # 项目所有 CSS 样式 主题\n│   │   ├── icons              # 项目所有 svg icons\n│   │   └── images             # 项目图片\n│   ├── components             # 全局公用组件\n│   ├── layout                 # 全局 layout\n│   ├── mock                   # 项目 mock 模拟数据\n│   ├── router                 # 路由\n│   │   ├── modules            # 各模块路由\n│   │   ├── index.js           # 路由入口\n│   │   └── permission.js      # 权限管理\n│   ├── service                # 所有 AJAx 请求\n│   ├── store                  # 全局 store 管理\n│   ├── utils                  # 全局公用方法\n│   ├── views                  # views 所有页面\n│   ├── App.vue                # 入口页面\n│   ├── main.ext.default.js    # main.js 的扩展 文件 (复制重命名为 main.ext.js)\n│   ├── main.js                # 入口文件 加载组件 初始化等\n│   └── settings.js            # 系统配置文件\n├── tests                      # 测试\n├── .browserslistrc            # 项目的浏览器配置\n├── .env.xxx                   # 环境变量配置\n├── .eslintrc.js               # eslint 配置项\n├── .babel.confi.js            # babel-loader 配置\n├── vue.config.default.js      # vue-cli 配置(复制重命名为 vue.config.js)\n└── package.json               # package.json\n```\n\n## 安装\n\n```bash\n# 克隆项目\ngit clone https://github.com/lqsong/admin-element-vue.git\n\n# 进入项目目录\ncd admin-element-vue\n\n# 复制文件\ncopy src/main.ext.default.js  src/main.ext.js\ncopy vue.config.default.js  vue.config.js\n\n# 安装依赖\nnpm install\n\n# 建议不要用 cnpm 安装  可以通过如下操作解决 npm 下载速度慢的问题\nnpm install --registry=https://registry.npm.taobao.org\n\n# 本地开发 启动项目\nnpm run serve\n```\n\n\n<br/>\n\n启动完成后会，打开浏览器访问 [http://localhost:8081](http://localhost:8081)， 你看到下面的页面就代表操作成功了。\n\n![](https://gitee.com/lqsong/public/raw/master/admin-element-vue/admin1.png)\n\n接下来你可以修改代码进行业务开发了，本项目内建了常见的页面模板、模拟数据、状态管理、全局路由等等各种实用的功能来辅助开发，你可以继续阅读和探索左侧的其它文档。\n\n\n## Contribution\n\n本文档项目地址 [admin-element-vue-docs](https://github.com/lqsong/admin-element-vue-docs) 基于 [vuepress](https://github.com/vuejs/vuepress)开发。\n\n有任何修改和建议都可以该项目 pr 和 issue\n\n[admin-element-vue](https://github.com/lqsong/admin-element-vue) 还在持续迭代中，逐步沉淀和总结出更多功能和相应的实现代码，总结中后台产品模板/组件/业务场景的最佳实践。本项目也十分期待你的参与和[反馈](https://github.com/lqsong/admin-element-vue/issues)。\n\n## 捐赠\n\n如果你觉得这个项目帮助到了你，你可以请作者喝咖啡表示鼓励.\n\n**ALIPAY**             |  **WECHAT**\n:-------------------------:|:-------------------------:\n![Alipay](https://gitee.com/lqsong/public/raw/master/common/Alipay.png)  |  ![Wechat](https://gitee.com/lqsong/public/raw/master/common/Wechat.png)\n', '前端', '2020-03-15 17:26:43', 4, 1, '2020-05-28 17:40:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lqs_article`
--
ALTER TABLE `lqs_article`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_article_category`
--
ALTER TABLE `lqs_article_category`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_attachment`
--
ALTER TABLE `lqs_attachment`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_config`
--
ALTER TABLE `lqs_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_link`
--
ALTER TABLE `lqs_link`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_link_category`
--
ALTER TABLE `lqs_link_category`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_search`
--
ALTER TABLE `lqs_search`
  ADD PRIMARY KEY (`sid`) USING BTREE,
  ADD KEY `id_type` (`id`,`type`) USING BTREE,
  ADD FULLTEXT KEY `key_precise` (`key_precise`);

--
-- Indexes for table `lqs_search_hotword`
--
ALTER TABLE `lqs_search_hotword`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_search_hotword_log`
--
ALTER TABLE `lqs_search_hotword_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_single_page`
--
ALTER TABLE `lqs_single_page`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_sys_permission`
--
ALTER TABLE `lqs_sys_permission`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_sys_resource`
--
ALTER TABLE `lqs_sys_resource`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_sys_resource_permission`
--
ALTER TABLE `lqs_sys_resource_permission`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `r_p_id` (`resource_id`,`permission_id`) USING BTREE;

--
-- Indexes for table `lqs_sys_role`
--
ALTER TABLE `lqs_sys_role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_sys_role_resource`
--
ALTER TABLE `lqs_sys_role_resource`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `r_r_id` (`role_id`,`resource_id`) USING BTREE;

--
-- Indexes for table `lqs_sys_user`
--
ALTER TABLE `lqs_sys_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_sys_user_role`
--
ALTER TABLE `lqs_sys_user_role`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `u_r_id` (`user_id`,`role_id`) USING BTREE;

--
-- Indexes for table `lqs_tag`
--
ALTER TABLE `lqs_tag`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_tag_log`
--
ALTER TABLE `lqs_tag_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_topics`
--
ALTER TABLE `lqs_topics`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_topics_log`
--
ALTER TABLE `lqs_topics_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `lqs_works`
--
ALTER TABLE `lqs_works`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lqs_article`
--
ALTER TABLE `lqs_article`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lqs_article_category`
--
ALTER TABLE `lqs_article_category`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lqs_attachment`
--
ALTER TABLE `lqs_attachment`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lqs_config`
--
ALTER TABLE `lqs_config`
  MODIFY `id` int(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `lqs_link`
--
ALTER TABLE `lqs_link`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lqs_link_category`
--
ALTER TABLE `lqs_link_category`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lqs_search_hotword`
--
ALTER TABLE `lqs_search_hotword`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lqs_search_hotword_log`
--
ALTER TABLE `lqs_search_hotword_log`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lqs_single_page`
--
ALTER TABLE `lqs_single_page`
  MODIFY `id` int(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lqs_sys_permission`
--
ALTER TABLE `lqs_sys_permission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `lqs_sys_resource`
--
ALTER TABLE `lqs_sys_resource`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `lqs_sys_resource_permission`
--
ALTER TABLE `lqs_sys_resource_permission`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `lqs_sys_role`
--
ALTER TABLE `lqs_sys_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lqs_sys_role_resource`
--
ALTER TABLE `lqs_sys_role_resource`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT for table `lqs_sys_user`
--
ALTER TABLE `lqs_sys_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lqs_sys_user_role`
--
ALTER TABLE `lqs_sys_user_role`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `lqs_tag`
--
ALTER TABLE `lqs_tag`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `lqs_tag_log`
--
ALTER TABLE `lqs_tag_log`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lqs_topics`
--
ALTER TABLE `lqs_topics`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lqs_topics_log`
--
ALTER TABLE `lqs_topics_log`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lqs_works`
--
ALTER TABLE `lqs_works`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
