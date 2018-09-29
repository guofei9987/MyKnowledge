import pandas as pd

#b=pd.DataFrame({"categories": ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"],"data": [5, 20, 36, 10, 10, 20]})

b=pd.DataFrame({"categories": [["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]],"data": [[5, 20, 36, 10, 10, 200]]},index=['idx'])
print(b)
b.to_json('d.json',orient='index')

#c=pd.read_json('data.json')
#print(c)

import os
os.system('"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --allow-file-access-from-files')
