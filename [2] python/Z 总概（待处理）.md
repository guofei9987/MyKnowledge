# 一、基础：

*   缩进：Python中用缩进来分组
*   续行，前一行结尾用反斜杠\指示续行
*   Python文件以.py结尾
*   调用包的几个例子：

例如
```
import 库名
from 库名 import 模块
from 库名 import ＊（倒入库里面所有的模块）
import math#声明调用math包
x=math.pi#把math包中的pi赋值给x
y=math.sin(0.5)#用math包中的函数sin,赋值给y
```
*   id(x)#返回变量x的ID号
*   type(x)#返回变量x的type
*   特殊变量类型：

1、复数2+3j, 0+1j(而不是单个的j)



*   import string#string模块，处理字符比较方便

>>> string.punctuation
```
'!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
```
>>> string.digits

'0123456789'

>>> string.whitespace

' \t\n\r\x0b\x0c'



# 五、列表(list)


*   Python的浅拷贝与深拷贝



# 九、类

构造类

class myclass (object):

    print('sss')

    pass

x=myclass()

构造类方式
```
class myclass1(object):

    a='a';#类方式的构造方法1

    def b(self,param1):#类方式的构造方法2

        self.c='c'#类方式的构造方法3，但只有调用这个函数时，这个方法才能构造成功

        return param1*2
```
range(1,20,3)#类似Matlab 中的1:3:20 或colon
