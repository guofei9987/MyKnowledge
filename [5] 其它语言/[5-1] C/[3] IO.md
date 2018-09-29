# 字符
输出：
1、putchar(c1)；

输入：
c1=getch()      //不回显字符，不用回车
c2=getche()   //回显字符，不用回车
c3=getchar()  //回显字符，要回车


字符串
输出：
```
int puts(char *str);
```

例：
```
puts(“I Love China! ”)
```
注意：遇到第一个\0结束输出并自动换行

```
char cString[30];
gets(cString);
puts(cString);
```

# getch、getchar、scanf的区别

### 1、getch()

getch()是conio.h中的库函数，它的作用是从键盘接收字符。

```
for(int i=0;i<10;++i)
{
    char ch=getch();
    printf ( "ch=%c\n", ch );
}
```

### 2、getchar()

getchar()是stdio.h中的库函数，它的作用是从stdin流中读入一个字符，如果stdin有数据的话不用输入它就可以直接读取了。

```
for(int i=0;i<10;++i)
{
    char ch=getchar();
    printf ( "ch=%c\n", ch );
}
```

当输了多个字符，以后的getchar()再执行时就会直接从缓冲区中读取，并显示到屏幕上。

如果我想让getchar()每次都能够等待用户输入的话就要清空缓冲区， C标准规定 fflush()函数是用来刷新输出（stdout）缓存的。对于输入（stdin），它是没有定义的。但是有些编译器也定义了 fflush( stdin )的实现，比如微软的VC。其它编译器是否也定义了 fflush( stdin )的实现应当查找它的手册。GCC编译器没有定义它的实现，所以不能使用 fflush( stdin )来刷新输入缓存。对于没有定义 fflush( stdin )的编译器，可以使用 fgets()函数来代替它（比用 getchar()、scanf()等函数通用性好）。可以这样忽略输入流中留下的回车等其它输入，从而使下一次的输入总保持一个“干净”的状态。（这个是任何平台下都可以的）

```
for(int i=0;i<10;++i)
{

    char ch=getchar();
    fflush(stdin); //每次都会有等待状态了（VC平台）
    printf ( "ch=%c\n", ch );
}
```
### 3、scanf（）

scanf这个库函数比较奇怪,而且存在一定的缺陷,所以很多人都不用了。
scanf输入字符串,整型,实型等数据判断的方式都一样,回车,空格,tab键都认为是一个数据的结束,当然字符的话,一个字符就是结束了,回车,空格等都有对应的ascii码,所以用scanf输入字符时要小心这些东东被当成字符输进去,而输入字符串和整型,实型等数据时这些都被当成分隔符而不会被输入到字符数组或变量里。

# printf
## %f等

<table class="tableizer-table">
<thead><tr class="tableizer-firstrow"><th>字符</th><th>对应数据类型</th><th>含义</th></tr></thead><tbody>
 <tr><td>d / i</td><td>int</td><td>接受整数值并将它表示为有符号的十进制整数，i是老式写法</td></tr>
 <tr><td>o</td><td>unsigned int</td><td>无符号8进制整数(不输出前缀0）</td></tr>
 <tr><td>u</td><td>unsigned int</td><td>无符号10进制整数</td></tr>
 <tr><td>x / X</td><td>unsigned int</td><td>无符号16进制整数，x对应的是abcdef，X对应的是ABCDEF（不输出前缀0x)</td></tr>
 <tr><td>f(lf)</td><td>float(double)</td><td>单精度浮点数用f,双精度浮点数用lf(尤其scanf不能混用)</td></tr>
 <tr><td>e / E</td><td>double</td><td>科学计数法表示的数，此处"e"的大小写代表在输出时用的"e"的大小写</td></tr>
 <tr><td>g / G</td><td>double</td><td>使用以上两种中最短的形式，大小写的使用同%e和%E</td></tr>
 <tr><td>c</td><td>char</td><td>字符型。可以把输入的数字按照ASCII码相应转换为对应的字符</td></tr>
 <tr><td>s / S</td><td>char * / wchar_t * </td><td>字符串。输出字符串中的字符直至字符串中的空字符（字符串以'\0'结尾，这个'\0'即空字符）</td></tr>
 <tr><td>p</td><td>void * </td><td>以16进制形式输出指针</td></tr>
 <tr><td>n</td><td>int * </td><td>到此字符之前为止，一共输出的字符个数，不输出文本</td></tr>
 <tr><td>%</td><td>无输入</td><td>不进行转换，输出字符'%'（百分号）本身</td></tr>
 <tr><td>m</td><td>无</td><td>打印errno值对应的出错内容,(例: printf("%m\n"); )</td></tr>
</tbody></table>


## %s的应用
|||
|--|--|
|%s|	输出字符串
%10s|	如果长度小于10，则左边补空格
%-10s|	如果长度小于10，则右边补空格
%m.ns	|输出占m列，取左边n个字符，左补空格
%-m.ns	|输出占m列，取左边n个字符，右补空格

# scanf
scanf("%d %d",&a,&b);


可以规定宽度，但不能规定精度：
scanf("%3d",&b);   
只截取前三位
带文字的，按照文字截取
scanf("%3d %4f %4f",&b,&c,&d);

三、字符格式
输入：
```C
c1=getch()      //不回显字符，不用回车
c2=getche()   //回显字符，不用回车
c3=getchar()  //回显字符，要回车
```

输出：
putchar(c1)
