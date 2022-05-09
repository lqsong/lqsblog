module.exports = {
    title: 'lqsBlog 开发文档',
    description: 'Li qingsong\'s blog 开发文档',
    dest: './dist',
    port: '8080',
    head: [
        ['link', {rel: 'icon', href: '/favicon.ico'}],
        ['script', {type: 'text/javascript', src: 'https://hm.baidu.com/hm.js?7680f7c0625c4f8213793fb35c2c084e'}]
        /* ['script', {type: 'text/javascript', src: 'https://s9.cnzz.com/z_stat.php?id=1278949746&web_id=1278949746'}] */
    ],
    markdown: {
        lineNumbers: true
    },
    themeConfig: {
        nav: require('./nav'),
        sidebar: require('./sidebar'),
        sidebarDepth: 3,
        // lastUpdated: 'Last Updated',
        searchMaxSuggestoins: 10,
        serviceWorker: {
            updatePopup: {
                message: "有新的内容.",
                buttonText: '更新'
            }
        },
        editLinks: false,
        editLinkText: '在 GitHub 上编辑此页 ！'
    }
}