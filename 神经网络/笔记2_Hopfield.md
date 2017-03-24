# 离散型Hopfield
特点：
- n个神经元之间相互连接
- $i$神经元的输出$y_i$，通过$w_{ij}$作为其它神经元的输入$x_j$
- $w_{ij}=w_{ji}$
- $w_{ii}=0$(每个神经元到自己的连接权值为0)

## Hopfield的神经元
$s_j=\sum\limits_{i=1}^{n}x_i w_{ij}-\theta_j$
$x_j=f(s_j)=sgn(s_j)=\left \{ \begin{array}{ccc}
1&  &s_j>0\\
-1& &s_j<=0
\end{array}\right.$

## Hopfield的状态
$X(t)=(x_1,x_2,...x_n)$

- 网络的异步工作方式
每次只有一个神经元调整
$x_j(t+1)=\left \{ \begin{array}{ccc}
f(s_j(t))&&j=i\\
x_j(t)   &&j \neq i
\end{array}\right.
j=1,2,...n$

- 网络的同步工作方式
所有神经元同时调整
$x_j(t+1)=f(s_j(t))$
$j=1,2,...,n$

- 网络的稳定状态
$x_j(t+1)=f(s_j(t)) \ \ \    for \ all\  j$

## 能量函数
定义
$E=-\dfrac{1}{2} \sum\limits_{i=1}^n \sum\limits_{j=1}^n w_{ij}x_i x_j+\sum\limits_{i=1}^n \theta_i x_i$



# 连续Hopfield
- 输入输出是模拟量
- 同步工作方式
- 信息处理的并行性、联想性、存储分布性、实时性、协同性更接近生物神经网络
- 与电子线路存在直接对应关系



















[to be continued]
