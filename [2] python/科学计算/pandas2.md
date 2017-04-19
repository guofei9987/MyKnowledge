```python
data.describe()
data.describe(include='all')
```
返回的是DataFrame格式的描述性统计数据

```
data.info()
```

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

# index和字段修改

## 1. 用赋值法修改

data.index可以直接赋值为Series或list
data.columns可以直接赋值为Series或list

index有map()方法，但没有apply方法，案例：
```python
import pandas as pd
data = pd.DataFrame(np.arange(12).reshape((3, 4)),index=['Ohio', 'Colorado', 'New York'],columns=['one', 'two', 'three', 'four'])
data.index=data.index.map(str.upper)
```

## 2.用rename修改index和Seris
需要知道修改前的字段和修改后的字段
```python
data.rename(index={'Ohio': 'INDIANA'},columns={'three': 'peekaboo'},inplace=True)
```

修改为首字母大写，大写
```python
data.rename(index=str.title, columns=str.upper, inplace=True)
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

# 列筛选（bool类型）
以下可以取得bool类型的Series，然后用来列筛选，这些Series可以相互之间做bool运算
## 1.符号
`== != < >  <=   >=`
## 2. isin

```python
df2['E'].isin(['two','four'])#返回的是bool类型的Series，因此可以做bool运算
#虽然用布尔方法也能达到同样效果，但如果[]太多的话，还是这个方便一些
```
## 3. str.contains()
```python
df2[df2.ix[:,'E'].str.contains('tw|ou')]#又是一个特殊用法contains，注意参数，有点特殊
```
## 4. isnull
```
df.isnull
```



# groupby
```python
df.groupby('key1').max()#生成一个DataFrame，存入分组后每一列的最大值
```

分组求和
```python
df.groupby((df['key1'],df['key2'])).sum()
```
groupby后面可以接的方法：
```
sum mean median
count
```


Series后面可以接的方法
```python
value_counts()#与groupby.count的区别
cumsum
...(自己查)
```

# 时间序列
唯一的区别是index是time
```python
dates = pd.date_range('20130101',periods=6)
```
用以上方法生成时间序列后，可以用index=dates


# index

## 互转
```
reset_index
set_index
```


## 下面是时间序列中，填充index
```python
idx = pd.date_range('09-01-2013', '09-30-2013')

s = pd.Series({'09-02-2013': 2,
               '09-03-2013': 10,
               '09-06-2013': 5,
               '09-07-2013': 1})#数据类型是<DatetimeIndex>


#下面扩展
s.index = pd.DatetimeIndex(s.index)#把原来index从字符串格式str变为时间格式Timestamp
s = s.reindex(idx,fill_value=np.nan)  
#reindex不限于时间序列，idx还可以是list，这样可以扩展非时间序列的数据             
```
？？column能不能这么转

## 插一句，还有一种类型转换astype
```python
 data["medal"].astype("category")#这样，就把字符型，转换为category型了
```
？？参数还可以是其它类型吗
？？字符格式的时间能不能转成时间格式
【未完待续】自己查

# 暂时没有学的

df.filter

```
data.group.groupby(data.group).count()
```

# join（类似SQL）
```python
import pandas as pd
left = pd.DataFrame({'group': ['a', 'a', 'a', 'b','b', 'b', 'c', 'c','c'],'ounces': [4, 3, 12, 6, 7.5, 8, 3, 5, 6]})
right = pd.DataFrame({'label':['a','b','c'],'value':['alpha','beta','charlie']})
inner_joined = pd.merge(left, right, how='inner', left_on='group', right_on='label')
```                                        


# to_json

生成数据
```Python
import pandas as pd
a=pd.DataFrame({"col1":['str1','str2','str3'],"col2":[1,2,3]},index=["idx1","idx2","idx3"])
```

out:
| |col1|	col2|
|--|--|--|
idx1	|str1|	1
idx2	|str2	|2
idx3	|str3	|3

## orient='index'
```Python
a.to_json('a.json',orient='index')
```
out:
```Json
{"idx1":{"col1":"str1","col2":1},"idx2":{"col1":"str2","col2":2},"idx3":{"col1":"str3","col2":3}}
```

## orient='columns'
```Python
a.to_json('a.json',orient='columns')
```
out:
```Json
{"col1":{"idx1":"str1","idx2":"str2","idx3":"str3"},"col2":{"idx1":1,"idx2":2,"idx3":3}}
```
## orient='records'
```Python
a.to_json('a.json',orient='records')
```
out:
```Json
[{"col1":"str1","col2":1},{"col1":"str2","col2":2},{"col1":"str3","col2":3}]
```
## orient='split'
```Python
a.to_json('a.json',orient='split')
```
out:
```Json
{"columns":["col1","col2"],"index":["idx1","idx2","idx3"],"data":[["str1",1],["str2",2],["str3",3]]}
```
