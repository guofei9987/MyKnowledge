Github Pages自动利用Jekyll生成站点

index.html是入口

# 关于LateX支持

jsMath
MathJax

下面是一个在html中加入latex的方法
```
<script type="math/tex; mode=display">
\left( \sum_{k=1}^n a_k b_k \right)^{\!\!2}
\leq
\left( \sum_{k=1}^n a_k^2 \right)
\left( \sum_{k=1}^n b_k^2 \right)
</script>
```

当然，首先要配置head.html，以支持latex：
在head中插入这么一句：
```
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
```
直接就支持latex了
