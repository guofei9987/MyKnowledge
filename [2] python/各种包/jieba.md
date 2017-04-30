# jieba
## 分词

```py
import jieba

seg_list = jieba.cut("我来到北京清华大学", cut_all=True)
#全模式

seg_list = jieba.cut("我来到北京清华大学", cut_all=False)
#默认，精确模式

#还有个HHM是新词发现功能
```

## 调整词典

jieba.suggest_freq(('中', '将'), True)

```py
jieba.enable_parallel(4) # 开启并行分词模式，参数为并行进程数
jieba.disable_parallel() # 关闭并行分词模式
```

## 代码示例

```py
#打开字符串
url='人民的名义 周梅森.txt'
content=open(url,'rb').read()

#对字符串分词
import jieba
text=jieba.cut(content)
#text是一个generator

#用collection包，统计分词结果
from collections import Counter
stat=Counter(text)
dict_stat=dict(stat)

#对value排序
dict1= sorted(dict_stat.items(), key=lambda d:d[1], reverse = True)
#至此，统计出了词频
```

## 词性

```py
url='《红楼梦》完整版.txt'
content=open(url,'rb').read()
import jieba.posseg as pseg
words = pseg.cut(content)
```

words是一个迭代器，下面可以清洗数据了：
```
word_dict={}
taboo_list=list('的了是.你我他也就这啊和着有都说在呢上又把不要让地吧到没得一对来给她那想好')
for word, flag in words:
    if flag=='x':
        continue
    if len(word)==1:# in taboo_list:
        continue
    if word in word_dict.keys():
        word_dict[word]+=1
    else:
        word_dict[word]=1
```

下面是按照词语出现次数从大到小排列
```
dict1= sorted(word_dict.items(), key=lambda d:d[1], reverse = True)
```


# 词云

直接从原文本生成词云：
```py
from wordcloud import WordCloud
import matplotlib.pyplot as plt
wc=WordCloud(font_path='a.ttf',max_font_size=40)#这里网上下载一个中文字体，就可以支持中文了
wordcloud=wc.generate('This is a good module')#会自动把虚词删掉
wc.to_file('hh.png')#保存到本地文件

#下面是显示出来
plt.figure()
plt.imshow(wordcloud, interpolation="bilinear")
plt.axis("off")
plt.show()
```
