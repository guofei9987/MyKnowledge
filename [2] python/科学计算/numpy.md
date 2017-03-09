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
- 然而，内存是共享的

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

# numpy.sin

# 运算符
以下x1,x2都是array，对对应元素进行操作：
```python
x1+x2
x1-x2
x1*x2
x1/x2
x1//x2
x1%x2
x1**x2
```

对每个
```python
x1**2#可以是一个数字，也可以是只有一个元素的array
x1*numpy.array([2])#同理
```

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














[未完待续...]
