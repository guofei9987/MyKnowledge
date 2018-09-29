import pandas as pd
import numpy as np

import time

location_list=["北京","天津","上海", "重庆", "河北", "河南",'云南','辽宁','黑龙江','湖南','安徽','山东','新疆','江苏','浙江','江西','湖北','广西','甘肃','山西',
'内蒙古','陕西','吉林','福建','贵州','广东','青海','西藏','四川','宁夏','海南','台湾','香港','澳门']

while 1:
    a = np.random.randint(20, 200, size=34)

    b = pd.DataFrame({"name": location_list, "value": a})
    b.to_json('data.json', orient='records')
    time.sleep(0.5)



#c=pd.read_json('data.json')
#print(c)
#
# import os
# os.system('"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --allow-file-access-from-files')

