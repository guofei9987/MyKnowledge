# array
## 构造
- 用list生成
```python
a=numpy.array([1,2,3,4])
b=numpy.array([[1,2,3],[4,9,8]])
c=numpy.array([[1,2,3],[2]])
```
- 用arange，linspace等生成
```python
numpy.arange(0,1,0.11)#开始值，终值，步长。不包含终值
numpy.linspace(0,1,5.5)#开始值，终值，元素个数
numpy.linspace(0,1,5.5,endpoint=False)#endpoint用来指定是否包含末尾值，默认为True
```
(arrange生成array,range生成list)

- 预设的方法生成
```python
numpy.zeros((2,3))
numpy.ones((3,3))
numpy.empty((2,3),numpy.int)#只分配内存，不初始化，因此速度很快
```

- 创建与a大小相同的数组
    - zeros_like(a)
    - ones_like(a)
    - empty_like(a)

- fromstring
```python
s="abcdfg"
numpy.fromstring(s,dtype=numpy.int8)#int8生成的是ASCII码
numpy.fromstring(s,dtype=numpy.int16)#16位是把相邻两个字母叠起来
```

- fromfunction
```python
def func(i,j):
    return (i+1)*(j+1)
numpy.fromfunction(func,(2,2))
```

## 取数
- 切片取数：共享内存（list切片不共享内存）
```python
a[3:5]#含头不含尾
a[:-1]#-1表示最后，仍然不含尾
a[2,3]=7,8#切片用来改array
b=a[2,3]#a和b共享内存空间
a[1:-1:2]#最后一个数是步长
a[::2]#省略表示头部
```

- list取数：不共享内存

```python
a=numpy.arange(1,10,1)
b=a[[1,2,3]]
```
- array取数：不共享内存
```python
a=numpy.arange(1,10,1)
b=a[numpy.array([1,4,1])]
```

- 布尔取数：不共享内存
```python
a=numpy.arange(0,5,1)
b=a[numpy.array([True,False,True,False,True])]
```

一个实际案例：
```python
a=numpy.random.rand(10)
a[a>0.5]
```

## 方法

### a.shape

- 返回a的维度
    - 如果a是一维数组，输出为(4,)
    - 二维数组，输出为(2, 3)
    - 如果某一维不规则，那么不显示这一维(2,)
a.shape返回array的维度
```python
a.shape
```

- 可以对a.shape赋值,效果是改变维度
```python
a=numpy.array([[1,2,3],[4,5,6]])
a.shape=3,2
```

- 在赋值时，用-1表示自动计算这一维的长度
```python
a=numpy.array([[1,2,3],[4,5,6]])
a.shape=3,-1
```

### reshape
- reshape与shape的区别是，reshape保持原数组维度不变
- 相同点是，内存是共享的

```python
a=numpy.array([[1,2,3],[4,5,6]])
b=a.reshape((3,2))
```
这里生成的a和b维度不同，但是共享内存

比较而言，用shape，直接改了原array：
```python
a=numpy.array([[1,2,3],[4,5,6]])
b=a
b.shape=3,-1
```
这里a，b的维度都改了


# dtype
```python
a.dtype#返回元素类型
a=numpy.array([1,2,3,4],dtype=numpy.float)#指定元素类型
a=numpy.array([1,2,3,4],dtype=numpy.complex)#指定元素类型
```

显示可用的dtype列表
```
set(numpy.typeDict.values())
```



# 运算符
以下x1,x2是相同shape的array，效果是对应元素进行操作：
```python
x1+x2
x1-x2
x1*x2
x1/x2
x1//x2
x1%x2
x1**x2
```

下面是对每个元素乘方
```python
x1**2#可以是一个数字，也可以是只有一个元素的array
x1*numpy.array([2])#同理
```
# 布尔运算符

- 布尔运算符是ufunc函数
- 返回dtype=bool的array

```python
x==y
x!=y
x<y
x<=y
x>y
x>=y
```

- 布尔运算：
```python
$
~
|
^
```
注意：
- 实际上`$~|^`是按位运算符，因为与array.dtype=bool的情况下，与逻辑运算完全相同，所以可以这么用
- and和or等逻辑运算符不能直接对array使用，因为他们只能用于True/False

- np.any(a==b) and np.all(a>b)


# 多维数组

## 取数
(共享内存)
### slice

```python
import numpy as np
a=np.arrange(0,60,10).reshape(-1,1)+np.arrange(0,5)
# 加法表，可以生成一个多维array
a[0,3:5]#算头不算尾
a[3:5,1]# 反而生成的是一行的array

```


下标元组
```python
idx=slice(None,None,2),slice(None,None,2)
a[idx]
#等价于a[::2,::2]
```

### 其它取数方式
这些都不共享内存

- list
两个list的效果是取出对应的几个元素，而不是取所在的行、列
```
import numpy as np
a=np.arange(0,60,10).reshape(-1,1)+np.arange(0,5)
b=a[[0,1,2],[1,2,3]]
```
效果是取出3个数,第0个list是第0轴，第1个list是第1轴

- 数字+slice，list+slice

在多维数组中，slice和list结合取数不共享内存。但是slice和数字结合取数共享内存
```python
import numpy as np
a=np.arange(0,60,10).reshape(-1,1)+np.arange(0,5)
b=a[2:,[3,1]]#不共享内存
b=a[2:,3]#共享内存
```

- bool+数字
- bool+bool
- bool+list
- bool+slice

总结为表格：
|是否共享内存|slice |list&array&bool|num|多维list&多维array|
|--|--|--|--|--|
slice|Y|N|Y|
list&array&bool|N|只取单数|返回1行n列的array|
num|Y|返回1行n列的array|返回一个数字

- 另外，如果省略了一个维度，省略部分默认为`:`全部切片

# 结构体数组

## 生成
```python
import numpy as np
persontype=np.dtype({'names':['name','age','weight'],'formats':['S32','i','f']})
#或者这样
#persontype=np.dtype([('name','S32'),('age','i'),('weight','f')])
a=np.array([('zhang',32,75.5),('wang',24,65.2)],dtype=persontype)
```
|||
|--|--|
S32|长度为32字节的字符串类型
i  |相当于np.int32
f  | 相当于np.float

结构体可以嵌套，这时dtype
## 取数
```
b=a[0]['name']
```
## dtype

```python
a.dtype
```
返回：dtype([('name', 'S32'), ('age', '<i4'), ('weight', '<f4'，(2,3))])
*tuple里面可能有第三个元素，例如(2,3),意思是多维数组*
- |忽略字节顺序
- <低位字节在前
- \>高位字节在前

## 写入文件
```
a.tostring()
a.tofile('test.bin')
```

可以用C语言读取结构体

# matrix

## 生成
## shape
```python
import numpy as np
a = np.matrix([[1, 2, 3], [5, 5, 6]])
a.shape=3,2
```


## 运算
```python
b=a.T#转置
a*b#矩阵相乘
np.linalg.inv(a)#取逆
a**2#矩阵相乘
```

# ufunc运算

numpy.sin()
```
numpy.sin(x,out=y)
```
矢量化运算很快，但在循环中每次运算1个，还是math.sin快

## 自己构建ufunc









[未完待续...]
