# 安装
## 自定义安装
- 找到网站，根据提示安装
## pip安装
- 在线安装
## 文件安装
- wheel格式  .whl


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

优先级：
1. pip
2. 自定义
3. 文件安装
------
# OS库
## 文件操作
### os
```python
os.getcwd()#获得当前工作目录
os.chdir(path)#把path设定为当前目录

os.listdir(path)#返回指定目录下所有文件和目录名

os.mkdir(path)#新建目录，新建文件
os.removedirs(path)#逐级删除多个目录（只能删除空目录）
os.rmdir(name)#删除目录，删除文件
os.rename(oldname,newname)#更改文件名，也可以用来移动到其它文件夹
```
其它（不实用）
```
os.remove()#删除一个文件夹，不能删除文件

```

### os.path一个子库
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

### os.walk(path)
```
for root,dirs,files in os.walk("D:\py\d1218"):
    pass
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
