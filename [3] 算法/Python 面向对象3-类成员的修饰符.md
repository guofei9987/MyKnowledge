## 共有字段&私有字段


```py
class C:

    PublicStatic = "公有静态字段"
    __PrivateStatic = "私有静态字段"
    def __init__(self):
        self.PublicDynamic="公有动态字段"
        self.__PrivateDynamic="私有动态字段"

    def func(self):
        print(self.PublicStatic)
        print(self.__PrivateStatic)
        print(self.PublicDynamic)
        print(self.__PrivateDynamic)

class D(C):

    def show(self):
        print(self.PublicStatic)
        #print(self.__PrivateStatic)#报错，子类不能访问父类的私有字段
        print(self.PublicDynamic)
        #print(self.__PrivateDynamic)报错，

#C.PublicStatic         # 类访问
#C.__PrivateStatic#报错，只有类内可以访问
#C.PublicDynamic

#obj = C()
#obj.func()     # 类内部可以访问
#obj.PublicStatic#报错，动态字段不属于类
#obj.__PrivateStatic#报错，只有类内可以访问
#obj.PublicDynamic
#obj.__PrivateDynamic#报错，只有类内可以访问

obj_son = D()
obj_son.show() # 派生类中可以访问
#obj

```

**ps：如果想要强制访问私有字段，可以通过 【对象._类名__私有字段明 】访问（如：obj._C__foo），不建议强制访问私有成员。**  







参考文献：
http://python.jobbole.com/82023/  

http://python.jobbole.com/83747/
