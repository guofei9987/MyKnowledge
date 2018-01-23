# 离散型Hopfield
特点：
- n个神经元之间相互连接
- $i$神经元的输出$y_i$，通过$w_{ij}$作为其它神经元的输入$x_j$
- $w_{ij}=w_{ji}$
- $w_{ii}=0$(每个神经元到自己的连接权值为0)

## Hopfield的神经元
$s_j=\sum\limits_{i=1}^{n}x_i w_{ij}+b_j$
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

## 网络的稳定状态
有三种状态：
1. 稳定状态
$x_j(t+1)=f(s_j(t)) \ \ \    for \ all\  j$

2. 有限环网络
在有限个状态中反复循环

3. 混沌
在无限多个状态之间变化，因为取0-1二值，所以不会发散到无穷远
*在离散Hopfield中不会发生，因为状态是有限的*


## 能量函数
定义
$E=-\dfrac{1}{2} \sum\limits_{i=1}^n \sum\limits_{j=1}^n w_{ij}x_i x_j - \sum\limits_{i=1}^n b_i x_i$



TH：如果：
- 离散Hopfield网络
- 异步工作
- 连接矩阵是对称阵
- 连接矩阵主对角线上的值为0

那么：
总有$\Delta E \leq 0$
也就是说，对于任意一个初态，系统收敛到某个吸引子


TH:如果：
- 离散Hopfield网络
- 同步工作
- 连接矩阵非负定矩阵
那么，对于任意一个初态，系统收敛到某个吸引子

```py
对于w=[[0,1],[1,0]],Y(0)=[[1],[0]]
串行收敛到稳态
并行收敛到有限环
这是因为W不是 非负定的
```
Def：

吸引子
: 系统最终拥有的若干稳定状态

记忆容量
: 系统的吸引子数量

吸引域半径
: 吸引子所能吸引的状态的最大距离。
吸引半径越大，说明联想能力越强

联想阶段
: 给定输入，系统经过一定的演化，最终稳定收敛于某个吸引子的过程



## 学习法

### 外积法(Outer Product Method)

假设有K个吸引子：$C^k=[c_1^k,c_2^k,...,c_N^k]$
那么$w_{ij}=
\left \{ \begin{array}{ccc}
\dfrac{1}{a}\sum\limits_{k=1}^K c_i^k c_j^k && i \neq j \\
0 && i=j
\end{array}\right.$
a是调节比例，一般a=1/N

- 写成矩阵：
$w=\dfrac{1}{N}(\sum\limits_{k=1}^K C^k (C^k)^T - KI)$

外积法，要求输入模式是相互正交的，否则必须满足一定条件下才能正确联想

### 投影学习法(Production Learning Method)
### 伪逆法(Pseudo Inverse Method)

$w=X(Y^T Y)^{-1} Y^T$

### 特征结构法(Eigen Structure Method)


## 关于记忆量
Hopfield通过大量实验，确定$K \thickapprox 0.15N $
一些学者认为，$K \leq \dfrac{N}{2 \log N}$

- 伪状态(Spurious State)
稳定状态，但不是设计者所需要的。减少伪状态，是改进Hopfield网络的一个方向




# 连续Hopfield
- 输入输出是模拟量
- 同步工作方式
- 信息处理的并行性、联想性、存储分布性、实时性、协同性更接近生物神经网络
- 与电子线路存在直接对应关系



















[to be continued]
