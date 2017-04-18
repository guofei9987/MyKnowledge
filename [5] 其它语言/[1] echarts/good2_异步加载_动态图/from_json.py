import pandas as pd
import numpy as np

import time
for i in range(200):
    a=np.random.randint(20,200,size=(1,6))
    b=pd.DataFrame({"categories": [["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]],"data": list(a)},index=['idx'])
    b.to_json('d.json', orient='index')
    time.sleep(0.5)



#c=pd.read_json('data.json')
#print(c)
#
# import os
# os.system('"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --allow-file-access-from-files')
