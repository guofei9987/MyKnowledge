# 生成
pd = makedist(distname,Name,Value)
pd=fitdist(x,distname,'By',groupvar,Name,Value)：已知数据求参数（点估计）
mle：已知数据求参数（极大似然估计）

# pd的方法
|方法|	举例|	备注|
|--|--|--|
|ProbDistUnivParam|||		
|pdf		|||
|cdf	|pd.cdf(1)||
|icdf	|pd.icdf(0.5)||
|iqr	|pd.iqr()|	IQR：3/4距差|
|mean 		|||
|median		|||
|std/var		|||
|random		|||
|paramci|	???||	
