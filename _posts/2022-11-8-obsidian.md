---
layout:     article

title:      放弃OneNote，拥抱 Obsidian

subtitle:   ""

date:       2022-11-8

author:     "thewangcj"

header-img: ""

catalog: false

tags:
    - 工具
---

> “Obsidian 果然是宝石”

------

<!--more-->
## 为何放弃 OneNote
从念大学起就开始使用 OneNote，这段期间也就记一下日常的学习笔记，并不算是重度的笔记使用者，也会搭配有道云笔记剪藏一些网页之类的，但总体而言对笔记的需求不大，期间 Notion 比较火的时候也尝试着使用，但是确实没啥重度需求也就放弃了。
到目前工作一年多一点，记笔记的需求陡然上升，这一年记的笔记比整个读书期间都要多，可见我上学是多摸，OneNote 开始慢慢的无法满足我的需求，主要是以下几点：
1. 不支持 Markdown，平时记笔记的时候经常会有插入代码的需求，OneNote 这方面可以通过插件 OneMark 解决部分需求，但是我用了小半年感觉二者经常会打架，显示的效果也不是很好；我写博客也是用的 Markdown，而博客的内容也大半来自笔记，这方面 OneNote 也没办法打通写博客这一工作流。
2. 跨平台支持薄弱：移动端 OneNote 过于难用导致我通常只用它来查看，Linux 上只能通过网页访问，在国内不开梯子没法用。
3. 同步问题：onedrive 在 Linux 上不可用，移动端同步缓慢偶尔抽风
4. 笔记管理难用，这里的管理包括多方面，首先是 OneNote 要删除掉一个笔记本很麻烦，重命名又会碰到多端同步的问题；然后 OneNote 是用笔记本->笔记这样子的逻辑管理笔记，但是大多数情况你都要在多个笔记本的多个笔记来回切换非常麻烦；
5. 搜索：稀烂
6. PDF 阅读：网上也有一些教程教你用 OneNote 来看 PDF 并记笔记，但是太过麻烦而且功能孱弱
以上都是吐槽，其实不止这些，还有比如老生常谈每次遇到都让我难受到不行的英文字体设置不生效问题，总的来说 OneNote 就是把你平时用的纸质笔记本换成了电子的，所以你用纸质笔记本有的问题它都有，当然OneNote 也有比如手写输入功能比较强的优点，但是我虽然有个Apple pencil但是使用率是真的低，而且 OneNote 这些年基本没有增加什么新功能，看不到它的进步或者说是未来，虽然不舍但是确实需要换一个笔记软件了。
## Obsidian 初入门
在写这部分之前还是要先说一下为什么选择 Obsidian，在决定放弃 OneNote时候我试用了市面上大部分的笔记软件，包括但不限于有道云笔记、notion、vnote 甚至是直接用 vscode 写Markdown，但是这些方法或多或少都有问题。有道云笔记有广告，我印象中也是用了自己的私有格式以后万一迁移很不方便，代码的高亮也很差；notion 之前非常多人推，我试用了一下，确实很漂亮能做出非常好看的笔记，但是网络劝退，而且用起来总感觉有点卡卡的不知道是不是我的错觉，最重要的是他也不支持本地存储，notion 给我的感觉就是看网上别人做的手账，很好看很想自己也搞一个，但是我手残；vnote 稍微用了一下，支持 vim 好评，但是会在我的每一个笔记文件夹下都建一个 JSON 文件，很难受，支持 Linux好评，但是没有移动端支持，软件好像是 Qt 写的，速度杠杠的，其他就没什么了最终悄悄放弃。
Obsidian 是看 notion 的相关视频时候了解到的，据说可以用插件实现各种各样的功能，但是上手难度高，本着试一试的态度用到了现在差不多一个月的时间，总体感觉是真香，早点用就不用一点点导出我的 OneNote了。
如果没有意外的话，我接下来都会继续使用 Obsidian 了，目前还在从 OneNote 迁移中，哎痛苦，下面大概说说 Obsidian 的优点方便你决定是否使用它：
1. Markdown 支持强大，其他笔记软件都是可选的方式支持 Markdown，而 Obsidian 将其作为唯一选择，这也是很多人说它难以上手的原因，毕竟 Markdown 的表格、图片之类的原生确实很难用，但是 Obsidian 也做了很多改进，比如直接复制图片、链接的插入等等，极大的提升了原生 markdown 的书写体验，就等着啥时候也把表格编辑改改，现在我都是靠插件写表格。
2. 本地存储笔记，当然你也可以选择官方的付费同步服务，也可以将笔记放到 iCloud 或者坚果云之类的，我是选择放到了 iCloud 中，这样 iOS 端用起来方便些，你要是用Android的话可以试试 onedrive，淘宝可以永久升级到 15G 空间也是挺香的
3. 笔记管理：主要指仓库+文件夹+文件的笔记管理，个人感觉比 OneNote 那套方便一些，主要是便于管理，仓库还便于将博客、工作等不同场景的笔记分开，还方便用 Git 做记录管理。
4. 记笔记体验：多标签页面、搜索功能
5. 插件提供无限可能，插件这方面我吹爆，这里举几个例子，一个是[obsidian-excel-to-markdown-table](https://github.com/ganesshkumar/obsidian-excel-to-markdown-table) 可以直接将 Excel 中的内容复制成 markdown；[obsidian-annotator](https://github.com/elias-sundqvist/obsidian-annotator) 可以边看 PDF 边记笔记，PDF直接存放在你的云存储中；[privacy-glasses](https://github.com/jillalberts/privacy-glasses) 公司写一些博客或者个人日记之类的你可能不想被他人看到，这个插件给除了你当前行以外的 Obsidian 打上马赛克，强推，还有很多很多插件值得推荐，我用了一个月 Obsidian，目前装了有20个插件，可能会有人担心会不会插件有上手成本，我用下来感觉基本上都是即装即用，个别的可能要看下项目主页稍微设置一下就可以了，上手成本感觉还是比较低的。
6. 部分的 All in One，之前我写博客需要单独打开个 vscode ，还要手动处理图片（导致我些个人博客不插图片），现在可以直接把博客当做一个 Obsidian 仓库，搭配[obsidian-git](https://github.com/denolehov/obsidian-git)还可以直接同步到 GitHub 上，对我而言相当于可以用 Obsidian 完成博客的书写和发包一条龙；其他的还有配合[obsidian-kanban](https://github.com/mgmeyers/obsidian-kanban)做个人的计划管理，用[obsidian-calendar-plugin](https://github.com/liamcain/obsidian-calendar-plugin)写日记或者周记等等
## 总结
用了一个月的 Obsidian，感觉就是一个字：爽，之前用 OneNote 的时候我其实是不太愿意记笔记的，每次需要处理格式排版的问题很麻烦，现在用 Obsidian 感觉自己记笔记或者说记录生活的欲望大大增强，这里小声逼逼一句，用 Obsidian 记读书笔记真的很爽，不管是直接看 PDF 还是实体书然后写 Markdown，纯 Markdown 能减少很多不必要的干扰，不会给我一种不在看书而是在做手账的错觉，虽然我也不会做手账是了。
吹了这么多，Obsidian 也有些缺点，比如表格功能弱，虽然这是 Markdown 的原罪，列表用起来不是很舒服，和其他软件的搭配有些问题，比如我知道 notion 可以和许多第三方软件搭配搭建你的流程或者数字花园，notion 我用的不是很多，就不班门弄斧了，当然这两个软件在我看来本来定位就有很大的差别。
本文可以看做是一篇 Obsidian 的安利博客，希望你也能试试。

## 参考
1. [笔记软件为何需要本地存储？ - Skywind Inside](http://www.skywind.me/blog/archives/2582)
2. [日常学习工作流 - CS自学指南 (csdiy.wiki)](https://csdiy.wiki/%E5%BF%85%E5%AD%A6%E5%B7%A5%E5%85%B7/workflow/)
3. [Obsidian中的notion表格，可视化编辑真不错！ - 经验分享 - Obsidian 中文论坛](https://forum-zh.obsidian.md/t/topic/6576)