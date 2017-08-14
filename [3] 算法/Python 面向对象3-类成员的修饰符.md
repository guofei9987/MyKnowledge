## 共有字段&私有字段


```py
class C:

    def __init__(self):
        self.name = '公有字段'
        self.__foo = "私有字段"#前两个字符是下划线
        #公有成员，在任何地方都能访问
        #私有成员，只有在类的内部才能方法
    def printC(self):
        print(self.__foo)
```


```py
a.__foo#报错，只有在类的内部才能访问
a.printC()#不报错，类内部的访问
```








参考文献：
http://python.jobbole.com/82023/  

http://python.jobbole.com/83747/
