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

2、列表list.

3、元组

4、字典{"Jones":1231234123,"Larson":8789698698,"Smith":8132897}

5、集合，支持集合运算：set([1,2,4])

# 二、控制语句：



# 三、关于字符串：

对字符串中的单个元素赋值是不允许的，这一点与Matlab不同

len(String2)#返回字符串长度

String2.upper()#返回大写

String2.find('hi')#返回位置，类似Matlab中的findstr(str1,str2)

String2.upper().find('HI')#调用链，先调用String2.upper()，然后把结果调用find

*   enumerate迭代器

#例子1：
```
String1 ='hello world'
for x in enumerate(String1):
    print(x)
```
#tuple类型

运行结果：

>>>

(0, 'h')

(1, 'e')

(2, 'l')

(3, 'l')

(4, 'o')

(5, ' ')

(6, 'w')

(7, 'o')

(8, 'r')

(9, 'l')

(10, 'd')

#例子2：

String1 ='hello world'

for index,letter in enumerate(String1):

    print(index,letter)

运行结果

>>>

0 h

1 e

2 l

3 l

4 o

5

6 w

7 o

8 r

9 l

10 d

*   split分割器

String1.split()#按空格方式分割，放入list类型

String1.split('a')#按'a'分割，放入list类型

*   replace

String1.replace(char,'a')

*   import string#string模块，处理字符比较方便

>>> string.punctuation
```
'!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
```
>>> string.digits

'0123456789'

>>> string.whitespace

' \t\n\r\x0b\x0c'

# 四、函数

*   使用规则：

def functionName(parameter1,parameter2):

statement1

statement2

return valueToReturn

*   参数传递：

同函数参数的是引用关系，对list引用时，与浅拷贝有同样的原理，所以在函数中修改list，函数外也会变化。

*   形参的默认参数值：

def myfun1(x1,x2=4,x3=5):

return x1,x2,x3

myfun1(1,2,3)#返回1,2,3

myfun1(1,2)#返回1,2,5

myfun(1,x3=6)#返回1,2,6

# 五、列表(list)

任何Python类型都可以作为列表中的元素，如：[3,4,'abc']，[[1, 2, 3], ['a', 'c']]

*   用list嵌套方法可以构造多维list
*   列表方法：

range和split方法在本文其它部分有讲解

*   Python的浅拷贝与深拷贝
# 六、元组(tuple)

tuple与list的一个区别是，tuple是不可改变的

*   构造

myTuple=(1,2,3)

myTuple=1,2,3#不加括号同样产生元组

x,y=1,2

*   元组方法：

+

*

mytuple[::2]


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
