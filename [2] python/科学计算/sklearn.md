# nerual_network

The module contains the public attributes `coefs_` and `intercepts_`.
- `coefs_` is a list of weight matrices, where weight matrix at index i represents the weights between layer i and layer i+1.
- `intercepts_` is a list of bias vectors, where the vector at index i represents the bias values added to layer i+1.





## multi-layer perceptron (MLP)

### MLPClassifier

- MLPClassifier supports multi-class classification by applying Softmax as the output function.

初始化数据
```py
X = [[0., 0.], [1., 1.]]
y = [0, 1]
```

生成模型
```py
#建模型
clf = MLPClassifier(solver='lbfgs', alpha=1e-5,hidden_layer_sizes=(5, 2), random_state=1)

#fit：
clf.fit(X, y)
```

获取参数
```py
clf.coefs_
#[coef.shape for coef in clf.coefs_]
clf.intercepts_
```

模型使用
```py
clf.predict([[2., 2.], [-1., -2.]])
clf.predict_proba([[2., 2.], [1., 2.]])
```
