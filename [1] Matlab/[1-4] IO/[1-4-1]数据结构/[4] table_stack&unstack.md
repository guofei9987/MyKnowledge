```
Storm = [3;3;1;3;1;1;4;2;4;2;4;2];
Town = {'T1';'T3';'T1';'T2';'T2';'T3';...
    'T2';'T1';'T3';'T3';'T1';'T2'};
Snowfall = [0;3;5;5;9;10;12;13;15;16;17;21];
T = table(Storm,Town,Snowfall)
W = unstack(T,'Snowfall','Town')
```


```
[W,it] = unstack(T,'Price','Stock','AggregationFunction',@mean)
```


stack
unstack
是sas中的转秩
具体参见doc
