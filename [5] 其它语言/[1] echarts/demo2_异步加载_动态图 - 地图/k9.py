import numpy as np
a=np.random.uniform(0,1,size=(10,10))
b=np.random.uniform(0,1,size=(10,1))
A=np.linalg.det(a)
print(A)