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
