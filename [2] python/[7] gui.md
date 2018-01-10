# graphics库
- 与你的Python文件放到同一个页面下
库已经放到了module文件夹下
[module.py](module/graphics.py)
## 创建窗口Graphwin()：
### 创建
```python
import graphics
win=graphics.GraphWin()#创建图形窗口
win.close()#关闭窗口
```
默认像素：200*200  
（0,0）位屏幕的左上角
（199,199）为右下角
### 方法
```
plot(x,y,color)
plotPixel(x,y,color)#无视setCoords设置的坐标系
setBackground(color)
close()
getMouse
setCoords(xll,yll,xur,yur)#设置坐标系
```

## 创建实例
### 图形对象通用方法
- setFill(color)#填充色
- setOutline(color)#边框色
- setWidth(pixels)#设置宽度（Point不起作用）#
- draw(aGraphWin)
- undraw()
- move(dx,dy)
- clone()#




### 创建一个Point实例（点）：
```
p1=graphics.Point(100,100)
p1.getX()
p1.getY()
p1.draw(win)
```
###  划线Line
```
graphics.Line(graphics.Point(80,110),graphics.Point(120,110))
setArrow("first")#"last", "both", "none"(默认)
getCenter()#返回终点坐标
getP1(),getP2()#返回端点坐标
```
### 创建一个Circle实例（圆）
```
c=graphics.Circle(graphics.Point(100,100),10)
c.draw(win)
c.getCenter()#返回圆心的值
c.getRadius()#返回半径
getP1(),getP2()#外接正方形的对角点
```

### 多边形
```
p=graphicis.Ploygon(p1,p2,p3,p4,p5)
p.setFill("peachpuff")
p.setOutline("white")
p.getPoints()#返回顶点值的列表
```
### 四边形rectangle
```
rectangle(p1,p2)
getCenter()#返回矩形中心点
getP1(),getP2()#返回矩形对角点
```
### 椭圆Oval
```
Oval(Point1,Point2)
getCenter()
getP1(),getP2()
```

## 移动与修改
```
c.move(x,y)#沿着轴移动x，y
c.undraw()#从画布上消失
```

## 事件响应

### 鼠标点击响应
```
p=win.getMouse()
print(p.x,p.y)#print(p.getX(),p.getY())
```
注意：p是一个point对象

### Text对象
Text(point(1,3),"your str").draw(win)
- setText()
- getText()
- getAnchor()#返回文本中心坐标
- setFace(family)#设置字体,"helvetica", "courier", "times roman", "arial"
- setSize(point)#字体大小，为5~36
- setStyle(style)#字体风格，"normal", "bold", "italic", "bold italic"
- setTextColor(color)
### Entry对象
input=Entry(point(2,3),5)
- setText()
- getText()
------
# tkinter库




## 共同的控件属性
- Dimensions：尺寸
- Colors：颜色
- Fonts：字体
- Anchor：锚（文本相对应位置参考点）
 - nw, n, ne, w, center, e, sw, s, se
- Relief styles：浮雕式
- Bitmaps：显示位图
- Cursors：光标的外形
## 特有属性
## 界面布局
- 三种几何管理方法
  - pack()
  - grid()
    - row column  从0开始
  - place()
## Tk()
- 这是创建一个新窗口对象
```
tk=tkinter.Tk()
tk.title("This is a title")#窗口的标题
tk.geometry("40x20")#窗口的默认大小，x是字母
tk.mainloop()
```
## 15个常见控件

### Button()
```
button1=tkinter.Button(tk,text="接受此票",command=process_button1)
button_accept=tkinter.Button(tk,text="接受此票",bg="blue",fg="#777")#背景颜色，字体颜色
button_accept.pack(side=tkinter.LEFT)#这里设置位置TOP,BOTTOM,LEFT,RIGHT
#pack还有expand,side,fill选项

```
- process_button1 是一个函数
- bitmap, compound, width, height, anchor, fg, bg, relief


### Canvas()
```
cvs=tkinter.Canvas(tk,width=200,height=200)
cvs.create_text(100,40,text="这里将会填入历史票",fill="blue",font=("time",16))

cvs.create_polygon(10,10,100,10,100,110,fill="",outline="black")
#每两个数字构成一个点的坐标，然后依次画过去

#下面是插入图
myImage=tkinter.PhotoImage(file="CSLO_logo.png")
cvs.create_image(10,70,anchor=tkinter.NW,image=myImage)
cvs.pack()

#下面是做动画
mytriangle=cvs.create_polygon(10,10,10,60,50,35)
cvs.move(mytriangle,5,0)
cvs.itemconfig(mytriangle,fill='blue')

```
### Checkbutton:多选框
### Entry()：输入框
- 没有text这一属性


### Frame：框架

### Label()
```
label=tkinter.Label(tk,text="Welcome")
label=tkinter.Label(bitmap="error")
```
- bitmap可接收的属性（表示图形）：
 - error
 - hourglass
 - info
 - questhead
 - question
 - warning
 - gray12
 - gray25
 - gray50
 - gray75
- bg,fg表示背景色和字体色
- width, height表示宽度和高度
- compound表示图和文字的关系
 - left图像居左
 - right
 - top
 - bottom
 - center



### Listbox：列表框
### Menubutton：菜单按钮
### Menu：滚动条控件，当内容超过可视化区域时使用，如列表框。
### Message
### Radiobutton：单选框
### Scale：范围控件；显示一个数值刻度，为输出限定范围的数字区间
### Scrollbar：滚动条控件，当内容超过可视化区域时使用，如列表框。
### Text：显示多行文本
### Toplevel：容器控件；用来提供一个单独的对话框，和Frame比较类似
### Spinbox：输入控件；与Entry类似，但是可以指定输入范围值
### PanedWindow：PanedWindow是一个窗口布局管理的插件，可以包含一个或者多个子控件。
### LabelFrame：labelframe 是一个简单的容器控件。常用与复杂的窗口布局
### tkMessageBox：用于显示你应用程序的消息框。

# 实际案例
## 案例1：几张图以及用法
```
import tkinter
class CanvasDemo:
    def __init__(self):
        window = tkinter.Tk()
        window.title("CanvasDemo")

        self.canvas = tkinter.Canvas(window, width = 200, height = 100, bg = "White")
        self.canvas.pack()

        frame = tkinter.Frame(window)
        frame.pack()

        btRectangle = tkinter.Button(frame, text = "长方形", command = self.displayRect)
        btOval = tkinter.Button(frame, text="椭 圆", command=self.displayOval)
        btArc = tkinter.Button(frame, text = "圆 弧", command = self.displayArc)
        btPolygon = tkinter.Button(frame, text="多边形", command=self.displayPolygon)
        btLine = tkinter.Button(frame, text=" 线 ", command=self.displayLine)
        btString = tkinter.Button(frame, text="文 字", command=self.displayString)
        btClear = tkinter.Button(frame, text="清 空", command=self.clearCanvas)

        btRectangle.grid(row = 1, column = 1)
        btOval.grid(row=1, column=2)
        btArc.grid(row=1, column=3)
        btPolygon.grid(row=1, column=4)
        btLine.grid(row=1, column=5)
        btString.grid(row=1, column=6)
        btClear.grid(row=1, column=7)

        window.mainloop()

    def displayRect(self):
        self.canvas.create_rectangle(10, 10, 190, 90, tags = "rect")
    def displayOval(self):
        self.canvas.create_oval(10, 10, 190, 90, tags = "oval", fill = "red")
    def displayArc(self):
        self.canvas.create_arc(10, 10, 190, 90, start = 0, extent = 90, width = 8, fill = "red", tags = "arc")
    def displayPolygon(self):
        self.canvas.create_polygon(10, 10, 190, 90, 30, 50, tags = "polygon")
    def displayLine(self):
        self.canvas.create_line(10, 10, 190, 90, fill = 'red', tags = "line")
        self.canvas.create_line(10, 90, 190, 10, width = 9, arrow = "last", activefill = "blue", tags = "line")
    def displayString(self):
        self.canvas.create_text(60, 40, text = "Hi,i am a string", font = "Tine 10 bold underline", tags = "string")
    def clearCanvas(self):
        self.canvas.delete("rect", "oval", "arc", "polygon", "line", "string")

CanvasDemo()
```
## 案例2：Menubar
```
import tkinter
class MenuDemo:
    def __init__(self):
        window = tkinter.Tk()
        window.title("Menu demo")

        menubar = tkinter.Menu(window,bg="red")
        window.config(menu = menubar)

        #创建下拉菜单，并添加到菜单条
        operationMenu = tkinter.Menu(menubar, tearoff = 0)
        menubar.add_cascade(label = "操作", menu = operationMenu)
        operationMenu.add_command(label = "加", command = self.add)
        operationMenu.add_command(label="减", command=self.subtract)
        operationMenu.add_separator()
        operationMenu.add_command(label = "乘", command = self.multiply)
        operationMenu.add_command(label="除", command=self.divide)

        exitMenu = tkinter.Menu(menubar, tearoff = 0)
        menubar.add_cascade(label = "退出", menu = exitMenu)
        exitMenu.add_command(label = "退出", command = window.quit)

        tkinter.mainloop()

    def add(self):
        print("相加")
    def subtract(self):
        print("相减")
    def multiply(self):
        print("相乘")
    def divide(self):
        print("相除")

MenuDemo()
```
## 案例3:鼠标事件
```
import tkinter
class MenuDemo:

    def __init__(self):
        root = tkinter.Tk()

        # create a popup menu
        self.menu = tkinter.Menu(root, tearoff=0)
        self.menu.add_command(label="Undo", command=self.hello)
        self.menu.add_command(label="Redo", command=self.hello)

        # create a canvas
        self.frame = tkinter.Frame(root, width=512, height=512)
        self.frame.pack()

        # attach popup to canvas
        self.frame.bind("<Button-1>", self.popup)
        root.mainloop()

    def popup(self, event):
        self.menu.post(event.x_root, event.y_root)

    def hello(self):
        print("hello!")
MenuDemo()
```
### 详解：
```
widget.bind_all(event, handler)
```
- 其中event是一个字符串，表示所触发的事件
- handler是一个函数，触发事件后调用这个函数

- event的值（字符串）与对应的描述
  - <Bi-Motion>    当拖拽小部件的时候
  - <Button-i>     Button-1、Button-2、Button-3表示左键、中间键、右键点击
  - <ButtonReleased-i> 当释放鼠标的时候
  - <Double-Button-i>  当双击鼠标的时候
  - <Enter>   当鼠标光圈进入小部件的时候
  - <Key>     当敲击一个键时候
  - <KeyPress>
  - <Leave>   当鼠标光圈离开小部件的时候
  - <Return>  当敲击“Enter”键时候，可以将键盘任意一个键和一个事件绑定
  - <Shift+A> 当敲击Shif+A的时候，可以和Alt、Control等组和
  - <Triple-Button-i>   点击鼠标3次的时候
- handler函数的参数对应的属性
  - char    从键盘输入的字符
  - keycode    从键盘输入的键代码
  - keysym    从键盘输入的键符号,"Up","Down","Left","Right"
  - num    鼠标键的数字（1、2、3）
  - widget    出发这个事件的小部件的对象
  - x和y    当前鼠标在小部件的坐标（像素）
  - x_root和y_root    当前鼠标相对于屏幕左上角的坐标（像素）

## move
```
cvs.move(i,dx,dy)
```
- canvas上的第i个对象移动dx, dy


## tkinter
```
from tkinter import *

import tkinter.simpledialog as dl
import tkinter.messagebox as mb

#tkinter GUI Input Output Example
#设置GUI
root = Tk()
w = Label(root, text = "Label Title")
w.pack()

#欢迎消息
mb.showinfo("Welcome", "Welcome Message")
guess = dl.askinteger("Number", "Enter a number")

output = 'This is output message'
mb.showinfo("Output: ", output)
```
