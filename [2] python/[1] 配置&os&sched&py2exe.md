
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






# OS库

## os1
```python
os.getcwd()#获得当前工作目录
os.chdir(path)#把path设定为当前目录

os.listdir(path)#返回指定目录下所有文件和目录名

os.mkdir(path)#新建目录，新建文件
os.removedirs(path)#逐级删除多个目录（只能删除空目录）
os.rmdir(name)#删除目录，删除文件
os.rename(oldname,newname)#更改文件名，也可以用来移动到其它文件夹
```


```
os.remove()#删除一个文件夹，不能删除文件

```

## os.path一个子库
```python
os.path.isfile(path)#检验path是否是一个文件，exists为false，也会返回false
os.path.isdir(path)#检验path是否是一个路径
os.path.exists(path) #判断路径是否存在

os.path.split(path)#返回一个tuple，分离目录名和文件名
os.path.splitext(path)#返回一个tuple，分离文件名和扩展名
os.path.dirname(path)#返回path中的路径
os.path.basename(path)#返回path中的文件名
os.path.join(path,name)#把path和name合成

os.path.getsize(path)#返回文件大小
```

## os.walk(path)
```
for root,dirs,files in os.walk("D:\py\d1218"):
    pass
```

## 运行CMD命令
```py
import os
# os.system("ipconfig")
p=os.popen('ipconfig')
print(p.read())
```

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


## 2.和操作系统相关的调用
###  sys
    sys.argv是一个list,包含所有的命令行参数.
    sys.stdout sys.stdin sys.stderr 分别表示标准输入输出,错误输出的文件对象.
    sys.stdin.readline() 从标准输入读一行 sys.stdout.write("a") 屏幕输出a
    sys.exit(exit_code) 退出程序
    sys.modules 是一个dictionary，表示系统中所有可用的module
    sys.platform 得到运行的操作系统环境
    sys.path 是一个list,指明所有查找module，package的路径.

### 观察引用计数的小程序
```py
import sys

a='abc'
print(id(a))
print(sys.getrefcount(a))
b='abc'
id(b)
print(sys.getrefcount(a))
```
###  操作系统相关的调用和操作 import os
```
os.environ 一个dictionary 包含环境变量的映射关系 os.environ["HOME"] 可以得到环境变量HOME的值
os.chdir(dir) 改变当前目录 os.chdir('d:\\outlook') 注意windows下用到转义
os.getcwd() 得到当前目录
os.getegid() 得到有效组id  os.getgid() 得到组id
os.getuid() 得到用户id  os.geteuid() 得到有效用户id
os.setegid os.setegid() os.seteuid() os.setuid()
os.getgruops() 得到用户组名称列表
os.getlogin() 得到用户登录名称
os.getenv 得到环境变量
os.putenv 设置环境变量
os.umask 设置umask
os.system(cmd) 利用系统调用，运行cmd命令
操作举例：
os.mkdir('/tmp/xx') os.system("echo 'hello' > /tmp/xx/a.txt") os.listdir('/tmp/xx')
os.rename('/tmp/xx/a.txt','/tmp/xx/b.txt') os.remove('/tmp/xx/b.txt') os.rmdir('/tmp/xx')
用python编写一个简单的shell
  #!/usr/bin/python
  import os, sys
  cmd = sys.stdin.readline()
  while cmd:
      os.system(cmd)
      cmd = sys.stdin.readline()

用os.path编写平台无关的程序
os.path.abspath("1.txt") == os.path.join(os.getcwd(), "1.txt")
os.path.split(os.getcwd()) 用于分开一个目录名称中的目录部分和文件名称部分。
os.path.join(os.getcwd(), os.pardir, 'a', 'a.doc') 全成路径名称.
  os.pardir 表示当前平台下上一级目录的字符 ..
os.path.getctime("/root/1.txt")  返回1.txt的ctime(创建时间)时间戳
os.path.exists(os.getcwd()) 判断文件是否存在
os.path.expanduser('~/dir') 把~扩展成用户根目录
os.path.expandvars('$PATH') 扩展环境变量PATH
os.path.isfile(os.getcwd()) 判断是否是文件名，1是0否
os.path.isdir('c:\Python26\temp') 判断是否是目录,1是0否
os.path.islink('/home/huaying/111.sql') 是否是符号连接 windows下不可用
os.path.ismout(os.getcwd()) 是否是文件系统安装点 windows下不可用
os.path.samefile(os.getcwd(), '/home/huaying') 看看两个文件名是不是指的是同一个文件
os.path.walk('/home/huaying', test_fun, "a.c")  
  遍历/home/huaying下所有子目录包括本目录,对于每个目录都会调用函数test_fun.
  例：在某个目录中，和他所有的子目录中查找名称是a.c的文件或目录。
    def test_fun(filename, dirname, names): //filename即是walk中的a.c dirname是访问的目录名称
        if filename in names: //names是一个list,包含dirname目录下的所有内容
            print os.path.join(dirname, filename)
    os.path.walk('/home/huaying', test_fun, "a.c")
```

## regular expression 正则表达式 import re

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
