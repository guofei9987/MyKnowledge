```python
def main():
    x1,x2,x3=eval(input("请输入3个数："))
    print(max(x1,x2,x3))
main()
```
注：用户输入的str，直接当成python语句执行

----
```python
x=input("请输入")
if x==""
    statement
```
注：用户直接回车，被当成空字符串


下面两段程序效果相同
```python
ans=input("what flavor do you want [vanilla]:")
if ans!="":
    flavor=ans
else:
    flavor="vanilla"
```
```python
flavor=input("what flavor do you want [vanilla]:") or "vailla"
```
------
```
my_item=[[x,y] for (y,x) in counts.items()]
my_item.sort()#嵌套list的sort,可以sort第一个
```
RGB互转
```
"#%02x%02x%02x" % (r,g,b)
```
