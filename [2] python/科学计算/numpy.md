# array
## 构造
- 用list生成
```python
a=numpy.array([1,2,3,4])
b=numpy.array([[1,2,3],[4,9,8]])
c=numpy.array([[1,2,3],[2]])
```
- 用数列生成
```python
numpy.arange(0,1,0.11)#开始值，终值，步长
numpy.linspace(0,1,5.5)#开始值，终止，元素个数
numpy.linspace(0,1,5.5,endpoint=False)#endpoint用来指定是否包含末尾值
```

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
a.shape

- 如果a是一维数组，输出为
