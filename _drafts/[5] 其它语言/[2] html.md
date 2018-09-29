
HTML是一种标记语言

# 文档结构标记
```html
<DOCTYPE html>
<html></html>
<head></head>放置HTML文件信息，如<title>,CSS样式代码
<title></title>定义标题
<body></body>HTML页面主体
 ```

# 常用标记
```html
<br>换行，不用成对出现
<p></p>段落标记
<section></section>表示页面中的一个区域
<acticle></acticle>与上下文无关的独立内容
<h1></h1>1级标题<h6></h6>6级标题
<center></center>居中\\实际效果网页缩放时保持居中
<ul></ul>无序列表
每个项目前加<li>
<ol></ol>有序列表
每个项目前加<li>
```

# 表格标记
```html
<table></table>标记整个表格
width表格宽度
height表格高度
broder表格边框
align表格对齐方式
<caption></caption>表格标题
align
valign

<tr></tr>表行，表示表的一行，属性同上
align\background\colspan\valign等属性
<th></th>表头单元格，属性同上
<td></td>单元格，要嵌套在<tr></tr>中间，属性同上
```

# 表单
```html
<form></form>
action="url"处理表单数据的URL地址
method="get"/"post"数据传输到服务器的方式,
"get"表示将指定数据追加在action指定地址后面，
"post"表示按HTTP协议POST方式传输
name="name1"表单名，用户可以自定义
onSubmit单击提交时出发的事件
target指定输入数据结果显示在哪个窗口
_blank新窗口打开目标文件
_self同一个窗口中打开
_parent上一级窗口中打开，一般用在框架页中
_top浏览器整个窗口中打开，忽略任何框架
```

```html
<input></input>表单输入标记,用在<form></form>中
type 输入字段类型，共10个可选值
text/password/file/radio/checkbox/submit/reset/button/hidden/image
disabled 指定输入字段不可用，即字段变灰，disabled=""/"disabled"一样效果
checked指定输入字段是否处于被选中状态，用于type="radio"/"checkbox"
width/height用于type="image"
maxlength用于type="text"/"password"
readonly指定是否是只读readonly=""/"readonly"
size宽度当type="text"/"password"表示指定文字宽度,当type="image"表示像素
src指定图片来源,用于type="image"
usermap为图片指定热点地图，用于type="image".属性值为URI,格式为"#+<map>标记为name属性值
alt指定当图片无法显示时显示的文字
name字段名称
value字段默认数据，type="checkbox"/"radio"时，不可省略，指定的是选中该项的值。type="button"/"reset"/"submit"时，指定的是按钮上显示的值
```

```html
<select></select>下拉选择框
name用于指定列表框的名称
size用于指定列表框中显示的选项数量，超过该数量可以通过拖动滚动条查看
disabled用于指定当前列表框不可用
multiple支持多选
```

```html
<option></option>
<textarea></textare>多行文本
name
cols/rows列数/行数
disabled
readonly
wrap  "hard"自动换行并且提交换行符，"soft"自动换行但不提交换行符,"off"不自动换行
```

# 超链接与图片
```html
<a href=""></a>
<img>
src 用于指定图片的来源
width/height/border/alt
```
# HTML5新增内容
```html
<header></header>标题
<footer></footer>脚注
<aside><aside>附属信息
<input>新加的type
"email"/"url"/"number"/"range"
```

# CSS
## 标记选择器
```
<style>
a{
font-size:9px;
color:#F93;
}
</style>
```
## 类别选择器
```html
<style>
 .one{font-family:宋体;font-size:24px;color:red;}
 .two{font-family:宋体;font-size:16px;color:red;}
 .three{font-family:宋体;font-size:12px;color:red;}
</style>

<body>
   <h2 class="one"> 应用了选择器one </h2><!--定义样式后页面会自动加载样式-->
   <p> 正文内容1         </p>
    <h2 class="two">应用了选择器two</h2>
   <p>正文内容2 </p>
   <h2 class="three">应用了选择器three </h2>
   <p>正文内容3 </p>
</body>
```

## id选择器
与类别选择器类似，
不同点：
- id选择器只能用一次，
- 以#开头，而不是.
- id="first"

## 页面中包含CSS的三种方法
1、行内样式
```html
<p style="color:#F00; font-size:36px;">行内样式一</p>
```
2、内嵌式
```html
包含在<style></style>中
```
3、链接式
```html
<link href="css.css"/>
```
