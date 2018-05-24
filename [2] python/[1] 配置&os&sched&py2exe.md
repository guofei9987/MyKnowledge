
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Module安装](#module安装)
	* [pip安装](#pip安装)
	* [conda安装](#conda安装)
	* [清华镜像](#清华镜像)
	* [文件安装](#文件安装)
* [自带函数](#自带函数)
* [OS库](#os库)
	* [os1](#os1)
	* [os.path一个子库](#ospath一个子库)
	* [os.walk(path)](#oswalkpath)
	* [运行CMD命令](#运行cmd命令)
* [sched库](#sched库)
* [py2exe](#py2exe)
* [常用内置函数](#常用内置函数)
	* [1.常用内置函数：(不用import就可以直接使用)](#1常用内置函数不用import就可以直接使用)
	* [2.和操作系统相关的调用](#2和操作系统相关的调用)
		* [sys](#sys)
		* [观察引用计数的小程序](#观察引用计数的小程序)
		* [操作系统相关的调用和操作 import os](#操作系统相关的调用和操作-import-os)
	* [regular expression 正则表达式 import re](#regular-expression-正则表达式-import-re)
* [module](#module)
* [关于import](#关于import)
	* [1.import filename1](#1import-filename1)
	* [2.from filename1 import def1](#2from-filename1-import-def1)
	* [3.from filename1 import *](#3from-filename1-import)
	* [4.](#4)
	* [5.](#5)
* [包（多层）](#包多层)

<!-- tocstop -->





# Module安装

## pip安装
CMD命令：
pip（在线配置）
- install 安装库   
    - 安装 pip install [库名称]
    - 更新 pip install -U [库名称]
- uninstall 卸载库
    - pip uninstall [库名称]
- list 列出信息
    - 需要更新的库pip list outdated
- show 列出详细信息
    - pip show [库名称]
- search通过PyPi搜索，在库名和摘要中检索
    - pip search [关键字]
- help 帮助

## conda安装
```
conda install pandas
```


看已经安装包的版本
```
conda list
```

## 清华镜像
清华镜像站点下载
https://mirrors.tuna.tsinghua.edu.cn/help/anaconda/

## 文件安装
CMD中(pip也可以安装本地的zip)
- CD到zip所在文件夹
- pip install jieba-master.zip

或者运行 setup.py  
python setup.py install


优先级：
1. pip
2. 自定义
3. 文件安装

------

# 自带函数
dir()打印对象的功能
help()帮助







# sched库
```
sched.sceduler()#创建一个调度任务
scheduler.enter(delay,?priority,?action,argument=())
#对一个任务调度，输入为：延迟，优先级，调度功能，输入变量
scheduler.run()#运行调度任务中的调度事件
scheduler.cancel(event)#取消某个调度事件
```
一个示例程序
```
import sched, time
def print_time(msg="default"):
    print("当前时间",time.time(),msg)
s=sched.scheduler(time.time,time.sleep)
print(time.time())
s.enter(5,1,print_time,argument=("延迟5秒，优先度1",))
s.enter(3,2,print_time,argument=("延迟3秒，优先度2",))
s.enter(3,1,print_time,argument=("延迟3秒，优先度1",))
s.run()
print(time.time())
```

# py2exe
（以管理员身份运行）
```
1. dos命令行输入:py -m pip install pyinstaller，安装pyinstaller。
2. pyinstaller -F -w *.py
还不是很顺畅，待以后继续研究
```

-F（注意大写）是所有库文件打包成一个exe，-w是不出黑色控制台窗口。
不加-F参数生成一堆文件，但运行快。压缩后比单个exe文件还小一点点。
加-F参数生成一个exe文件，运行起来慢。
- 带input和print的，不能加-w

# 常用内置函数
## 1.常用内置函数：(不用import就可以直接使用)  

```py
help(obj) 在线帮助, obj可是任何类型
callable(obj) 查看一个obj是不是可以像函数一样调用
repr(obj) 得到obj的表示字符串，可以利用这个字符串eval重建该对象的一个拷贝
eval_r(str) 表示合法的python表达式，返回这个表达式
dir(obj) 查看obj的name space中可见的name
hasattr(obj,name) 查看一个obj的name space中是否有name
getattr(obj,name) 得到一个obj的name space中的一个name
setattr(obj,name,value) 为一个obj的name space中的一个name指向vale这个object
delattr(obj,name) 从obj的name space中删除一个name
vars(obj) 返回一个object的name space。用dictionary表示
locals() 返回一个局部name space,用dictionary表示
globals() 返回一个全局name space,用dictionary表示
type(obj) 查看一个obj的类型
isinstance(obj,cls) 查看obj是不是cls的instance
issubclass(subcls,supcls) 查看subcls是不是supcls的子类
```

```py
str(obj) 得到obj的字符串描述
```




# module


# 关于import
- import 时，会把整个file运行一遍
- 多次import同一个模块时，只运行一次
- run 某个file时候，class里的print会运行一遍

## 1.import filename1

引用时，用
```python
filename1.def1
filename1.class1
```

## 2.from filename1 import def1
```
from filename1 import def1
from filename1 import class1
from filename1 import 变量1
```
引用时，直接用def1等等

## 3.from filename1 import *
```
from filename1 import *
#把所有的对象全部导入
#如果filename1里有__all__ = [ 'bar', 'spam' ] 那么只导入__all__
```

## 4.
```python
#检查是单独执行还是被导入
if __name__ == '__main__':
      # Yes
      statements
else:
      # No (可能被作为模块导入)
      statements

#例如：print(__name__),在主函数中返回‘__main__’,在模块中返回模块路径.模块文件名
```
## 5.
还可以导入的文件：
    a.C/C++扩展（dll）
    b.包（包含多个模块）
    c.内建模块（使用C编写，并已链接到Python解释器内）

---
# 包（多层）

* import Graphics.Primitive.fill 导入模块Graphics.Primitive.fill,只能以全名访问模块属性,例如 Graphics.Primitive.fill.floodfill(img,x,y,color).
* from Graphics.Primitive import fill 导入模块fill ,只能以 fill.属性名这种方式访问模块属性,例如 fill.floodfill(img,x,y,color).
* from Graphics.Primitive.fill import floodfill 导入模块fill ,并将函数floodfill放入当前名称空间,直接访问被导入的属性，例如 floodfill(img,x,y,color).

无论一个包的哪个部分被导入, 在文件__init__.py中的代码都会运行.这个文件的内容允许为空,不过通常情况下它用来存放包的初始化代码。导入过程遇到的所有``` __init__.py```文件都被运行.因此 import Graphics.Primitive.fill 语句会顺序运行 Graphics 和 Primitive 文件夹下的```__init__.py```文件.
