# %f等

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


# %s的应用
|||
|--|--|
|%s|	输出字符串
%10s|	如果长度小于10，则左边补空格
%-10s|	如果长度小于10，则右边补空格
%m.ns	|输出占m列，取左边n个字符，左补空格
%-m.ns	|输出占m列，取左边n个字符，右补空格
