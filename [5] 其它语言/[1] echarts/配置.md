# 载入jQ报错
问题：打开本地html文件时，报错如下
Cross origin requests are only supported for protocol schemes: http, data,chrome-extension, https, chrome-extension-resource.

分析：浏览器为了安全性考虑，默认对跨域访问禁止。

解决：

- 关闭chrome浏览器
- 给浏览器传入启动参数（allow-file-access-from-files），允许跨域访问。
Windows下，运行（CMD+R）或建立快捷方式：
"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --allow-file-access-from-files
