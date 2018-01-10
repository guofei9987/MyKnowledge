```python
x=open("data.txt","r")
for i in x:
    print(i)
```
注：文件对象也可以被in

```python
sum = 0
count = 0
x = open("data.txt", "r")
i = x.readline()
while i != "":
    sum += float(i)
    count += 1
    i = x.readline()
print("平均数是{}".format(sum / count))
```
注：用readline()读取下一行

------

# 编码问题
```py
ord("A")#字符转ascii码
chr(97)#ascii码转字符

s="中文字符串"
bs=s.encode("utf-8")#"gbk"
bs.decode("utf-8")
```
- ascii码 7个二进制位
- Unicode 每个字符2个字节（4位16进制）
- UTF-8：可变长度的unicode，英文对应单字节，中文对应3字节

------

# 文件
分为文本文件和二进制文件
### 文件操作：
- 读取
- 写入
- 定位
- 追加，计算
- 关闭：切断文件与程序的联系；写入磁盘，释放文件缓冲区

```python
f=open(...)
```
### 打开方式
- r:只读，如果文件不存在，则输出错误
- w:只写，如果文件不存在，则创建
- a:附加到文件末尾
- rb:只读二进制，如果文件不存在，则输出错误
- wb:只写二进制，如果文件不存在，则自动创建
- ab:附加到二进制文件末尾
- r+：读写
```python
f.read()#返回包含整个文件内容的一个字符串
f.readline()#返回下一行内容的字符串,结尾返回空字符串
f.realines()#返回list，每项是字符串，含\n
f.write()#把文本或二进制写入文件
f.writelines()#针对列表操作
f.close()
```
- 注1：用readline取数后，下面的for in语句中，将不会从文件头开始

# 其它1
```
str_1 = input("Enter a string: ")
```
