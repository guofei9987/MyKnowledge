# 1
所有仓库之间都可以push/pull

# 初始设置
### 1.1 设置个人信息
```
$git config --global user.name "Firstname Lastname"
$git config --global user.name "your_email@example.com"
```
这样,"~/.config"中的name和email就被改了(也可以直接编辑这个文件)
注意，这两个信息会一起上传到github

### 1.2 设置其他信息
```
$git config --global color.ui auto
```
"~/.config"中会增加以下一行

>[color]  
>   ui = auto

如此可以提高命令输出的可读性
# 2.设置SSH
### 2.1 生成公钥和秘钥：
```
$ssh-keygen -t  rsa -C "guofei9987@foxmail.com"
```
会提示输入密码(本地仓库的密码）

> id_rsa文件是私有秘钥
id_rsa.pub文件是公开秘钥
### 2.2去官网导入公钥
去[GitHub官网](https://github.com/)上，把github_rsa.pub文件中的内容添加到SSH中
>会受到一个提醒邮件
>现在可以用手中的私人秘钥与GitHub进行通讯了

查看公钥内容：
```
$cat ~/.ssh/id_rsa.pub
```
### 2.3去官网新建仓库
> 点击**new repository**

- Initialize this repository with a README这个选项可以自动生成readme，readme中的内容会自动显示到repository的首页中
- Add.gitignore 用来存放不需要进行版本管理的文件（例如框架等）
- Add a license许可协议

### 2.4 在本地建仓库
git init可以初始化本地仓库：
```
$mkdir git-dir
$cd git-dir
$git init
```
git status： 显示仓库状态
git log: 显示log
- 简略显示log：```git log --pretty=short ```
- 只显示指定文件或目录：```git log readme.md```
- 显示文件的改动：```git log -p```
- 显示指定文件的改动：```git log -p readme.md```
- 出图```git log --graph```
git diff：显示更改前后的差别（不用add也可以显示）


# push 和 pull
### 2.4 把仓库clone到本地
```
$git clone git@github.com:guofei9987/hello-world.git
```
其中，*git@github.com:guofei9987/hello-world.git* 这段话可以从网页上clone with SSH 中复制出来
### 2.5 开始编程
- 新建的文件是untracked files
- 执行add语句后，状态变为 to be committed
```
git add filename
git add -A
```

然后commit，在弹出的txt中填入这次commit的相关信息：

```
git commit
```

填入信息的格式约定：
第一行：一句话概括更改的内容
第二行：空
第三行：记录更改的原因和详细内容


还有一种形式,这种不会弹出txt：
```
git commit -m "First commit"
```
最后push，完成后，GitHub上的仓库就会被更新

# 3 分支相关
## 创建分支
- 显示分支一览表：```git brance```
- 创建分支：```git brance feature-A``` 这样，创建了一个名为feature-A的分支
- 切换分支：```git checkout feature-A```，这样，把当前分支设定为feature-A
## 合并分支
```git merge --no-ff feature-A```

## 回溯历史版本
```
git reset --hard 75a8a671ec564e031eeec9fadbcd3a51daefe3c9
```
整个回到了历史版本了

查看所有线的log
```git reflog```

## 推送到远程仓库
- 添加到远程仓库
```
git remote add origin git@github.com:guofei9987/git17.git
```
- 推送到远程仓库
```
git push -u origin master
```
- 从远程仓库获取（在新文件夹下）
```
git clone git@github.com:jperla/neural.git
```

# 实用工具
在github上比较两个branch的不同
```
https://github.com/guofei9987/plans/compare/master...master1
```
在github上比较同一分支不同时间内的差别
```
https://github.com/guofei9987/plans/compare/master@{7.days.ago}...master
```
在github上比较指定日期之间的差别
```
https://github.com/guofei9987/plans/compare/master@{2017-01-24}...master@{2017-02-04}
```
- github pages
https://pages.github.com/
- github jobs

# Pull Request （PR）
## 如果想参与别人的项目
1. 在github.com上fork到自己仓库
2. clone到本地
3. 建立一个branch
```
git branch work
git checkout work
```
4. 编程工作
5. push到自己的网站
```
git push origin work
```
6. 在github上发送PR

## 获取github.com上的新数据
```
git fetch
git pull
```

























未完待续。。。

# 以下是其它经验
## bat批量执行
- Git装好后有个cmd路径，找到这个路径，复制这个路径
- 按下win键，输入"环境变量"，上一步复制的路径，加到Windows的path环境变量下
- 正常使用

## 个人blog

### 解析到www的方法（成功）
github 端用www.guofei.site

阿里云解析时 用cname 和 @ 和 guofei9987.github.io
