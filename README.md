## libstdc++.6.0.9.tbd 在Xcode10+上缺少问题

### 问题

升级 **Xcode10+** 后，老项目或者第三方依旧依赖 **libstdc++.6.0.9.tbd** 文件，缺少文件工程报错，本脚本将 ***libstdc++.6.0.9.tbd*** 文件添加到 Xcode 对应的目录内(含: iPhoneOS、iPhoneSimulator、MacOSX)即可。 

### 使用

打开终端执行如下:

```bash
sh add_stdc++_to_Xcode.sh
```

如果遇到权限问题加上 **sudo** 执行：

```bash
sudo sh add_stdc++_to_Xcode.sh
```

![](http://ww3.sinaimg.cn/large/006tNc79ly1g4dfejicvtj30ne0g6goy.jpg)

### 安全

|类型|MD5|
|:----:|:----|
|iPhoneOS|6d6e5745a55f1485055d74a574e31fc2|
|iPhoneSimulator|a2969039a4c5066e9eb4dbe0405ecae9|
|MacOSX|3d646f322a9ef63533429a0ae1ca249d|

添加前请核查MD5值, 文件被修改的，与本分享无关。

### 问题
- 1、如果原来Xcode有该文件会不会被替换？

 答：不会覆盖已有文件，执行会有如下提示.

![](http://ww4.sinaimg.cn/large/006tNc79ly1g4dfhbsg2aj30qs0aamz2.jpg)

- 2、如果Xcode安装目录非默认目录/Applications，怎么安装成功？

 答：执行脚本会给出如下提示：

![](http://ww2.sinaimg.cn/large/006tNc79ly1g4dfku0mvvj30to0aiac4.jpg)

默认Xcode 是安装在 /Applications 目录下，并且Xcode的名称为: `Xcode.app`, 如果有多个Xcode，请自行修改脚本内的 Xcode 安装目录。如图所示: 

![](http://ww4.sinaimg.cn/large/006tNc79ly1g4dfb1y26sj31f20di0we.jpg)

- 3、遇到权限问题，如**cp: /Applications/Xcode.app/.../usr/lib/libstdc++.6.0.9.tbd: Permission denied**, 怎么办？


 答: 执行加上sudo，如下所示:
 
 ```bash
	sudo sh add_stdc++_to_Xcode.sh
```

 
 ![](http://ww3.sinaimg.cn/large/006tNc79ly1g4dgdge10qj315l0u07bo.jpg)








