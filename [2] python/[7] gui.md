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
