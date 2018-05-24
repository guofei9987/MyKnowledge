## 2.和操作系统相关的调用
###  sys
```
sys.argv是一个list,包含所有的命令行参数.
sys.stdout sys.stdin sys.stderr 分别表示标准输入输出,错误输出的文件对象.
sys.stdin.readline() 从标准输入读一行 sys.stdout.write("a") 屏幕输出a
sys.exit(exit_code) 退出程序
sys.modules 是一个dictionary，表示系统中所有可用的module
sys.platform 得到运行的操作系统环境
sys.path 是一个list,指明所有查找module，package的路径.
```
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




# OS库

## os1
```python
os.getcwd() #获得当前工作目录
os.chdir(path) #把path设定为当前目录

os.listdir(path) #返回指定目录下所有文件和目录名

os.mkdir(path) #新建目录，新建文件
os.removedirs(path) #逐级删除多个目录（只能删除空目录）
os.rmdir(name) #删除目录，删除文件
os.rename(oldname,newname) #更改文件名，也可以用来移动到其它文件夹
```


```
os.remove()#删除一个文件夹，不能删除文件

```

## os.path一个子库
```python
os.path.isfile(path) #检验path是否是一个文件，exists为false，也会返回false
os.path.isdir(path) #检验path是否是一个路径
os.path.exists(path) #判断路径是否存在

os.path.split(path) #返回一个tuple，分离目录名和文件名
os.path.splitext(path) #返回一个tuple，分离文件名和扩展名
os.path.dirname(path) #返回path中的路径
os.path.basename(path) #返回path中的文件名
os.path.join(path,name) #把path和name合成

os.path.getsize(path) #返回文件大小
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
