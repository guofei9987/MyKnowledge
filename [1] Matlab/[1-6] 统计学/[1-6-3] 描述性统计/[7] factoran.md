[lambda,psi,T,stats,F] = factoran(X,m)
X:n*d，样本容量n，d维
m：返回m个公共因子
lambda：d*m 第(i,j)个元素为第j个因子在第i个变量上的载荷(或系数)
psi：特定方差的最大似然估计
T：包含以下字段：（H0：公共因子个数为m）
loglike    最大对数似然函数
dfe       误差自由度((d-m)^2-(d+m))/2
chisq    H0的近似卡方统计量
p           H0的右侧显著性水平  p小说明m太少

[lambda,psi,T]=factoran(X,2,'xtype','covariance','delta',0,'rotate','none')
