# 产品功能
存放一些知识、干货




# MytoolBox
*2017/3/30更新* :

把[MytoolBox](https://github.com/guofei9987/MyToolBox)合并进入这个repository，原repository停止更新，这样管理起来更加方便

## 用于存放一些实用小工具

##  [1] 目录结构生成器
### mydir.py
- 生成的样式不好看，参考exe进行改进
- 待实现功能：选择目录（拖拽、黏贴等方式）
### file2tree.py
对一个文件夹进行遍历，生成如下图的文件树：

    ├── conf
    └── test
        └── app
            ├── conf
            ├── html
            │   ├── a.js
            │   ├── bigscreen.js
            │   └── index.html
            ├── module
            │   ├── a.html
            │   └── media.html
            └── styl


使用方法
在CMD中输入：
- use like "python file2tree.py -r d:/tree"
- or use like "python file2tree.py --rootdir d:/tree"
- 改为在C:\\生成txt，程序运行完之后自动打开

尚存bug：
- 中文有时会报错
- 文件名或文件目录中有空格时，会报错


## [2] 重复文件检索工具
- 项目未开始
## [3] 颜色
功能：
- 取色（windows端鼠标取色，IOS端摄像头取色）
- 给出最近颜色的名字

进度：
- 颜色列表

## knowledge的git上传.bat
一个脚本，用于一键add，commit，push


123
