```
data.describe()
data.describe(include='all')
```
返回的是DataFrame格式的描述性统计数据




data.info()


# sort
排序
有inplace项
```python
data.sort_values(by=['group','ounces'], ascending=[False, True], inplace=True)
```

# remove duplicates
删除重复
有inplace项
```python
data.drop_duplicates()
data.drop_duplicates(subset='column1')#找第一列重复者
data.duplicated(keep='last')#'first','last',False
```

```
data.duplicated()#返回Series，bool类型，存放是否是重复行/列
```
# remove columns
删除一列
有inplace项
```python
data.drop('animal2', axis='columns', inplace=True)
```

# replace
```python
data.replace([4,5],np.nan,inplace=True)
```
## fillna
```python
a=data.fillna(method='bfill',inplace=True)#bfill,ffill,
```

```python
a=data.fillna(data.mean(),inplace=True)
```

# index


data.index可以直接赋值，也可以用map，案例：
```python
import pandas as pd
data = pd.DataFrame(np.arange(12).reshape((3, 4)),index=['Ohio', 'Colorado', 'New York'],columns=['one', 'two', 'three', 'four'])
data.index=data.index.map(str.upper)
```


# 列变化

## 方法1：map

```python
data['animal'] = data['food'].map(str.lower).map(my_dict)
#my_dict是一个字典，key是data['food']中的元素，values是输出Series中的元素
```

## 方法2：apply

```python
data.apply(func1,axis='columns')#返回Series
```

func1的规则：
输入是一行
```python
def func1(series):
    #series的类型是Series，其内容是DataFrame的一行，
    #return内容就是data.apply这个series中的元素
```
