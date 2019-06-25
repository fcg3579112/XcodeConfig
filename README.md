## libstdc++.6.0.9.tbd 在Xcode10+上缺少问题

### 问题

Xcode10 废弃了 **libstdc++** 库

- libstdc++.6.0.9.tbd
- libstdc++.6.tbd  (libstdc++.6.0.9.tbd的替身)
- libstdc++.tbd    (libstdc++.6.0.9.tbd的替身)
- libstdc++.6.0.9.dylib
- libstdc++.6.dylib (libstdc++.6.0.9.dylib的替身)
- libstdc++.dylib (libstdc++.6.0.9.dylib的替身)

删除以上库后编译 老项目或者第三方库会出现 Error 和 Crash。本脚本将 ***libstdc++.6.0.9.tbd*** 和 ***libstdc++.6.0.9.dylib*** 文件恢复到 Xcode 对应的目录内(含: iPhoneOS、iPhoneSimulator、MacOSX、CoreSimulator)。 

### 使用

打开终端执行如下:

```bash
sh add_stdc++_to_Xcode.sh
```

如果遇到权限问题加上 **sudo** 执行：

```bash
sudo sh add_stdc++_to_Xcode.sh
```

![](http://ww3.sinaimg.cn/large/006tNc79ly1g4dmb7ohtbj30ex0ldgov.jpg)

### 安全

|类型|MD5|
|:----:|:----|
|iPhoneOS|6d6e5745a55f1485055d74a574e31fc2|
|iPhoneSimulator|a2969039a4c5066e9eb4dbe0405ecae9|
|MacOSX|3d646f322a9ef63533429a0ae1ca249d|
|CoreSimulator|7cf875f4b851dcdeece9f8825321b423|

添加前请核查MD5值, 文件被修改的，与本分享无关。

### 问题
- 1、如果Xcode已有该文件会不会被替换？

 答：不会覆盖已有文件，执行会有如下提示.

![](http://ww3.sinaimg.cn/large/006tNc79ly1g4dla334olj31gi0juq7v.jpg)

- 2、如果Xcode安装目录非默认目录/Applications，怎么安装成功？

 答：执行脚本会给出如下提示：

![](http://ww1.sinaimg.cn/large/006tNc79ly1g4dlbxvungj30yw0f4acu.jpg)

默认Xcode 是安装在 /Applications 目录下，并且Xcode的名称为: `Xcode.app`, 如果有多个Xcode，请自行修改脚本内的 Xcode 安装目录。如图所示: 

![](http://ww1.sinaimg.cn/large/006tNc79ly1g4dle03fmvj30wg0ayact.jpg)

- 3、遇到权限问题，如**cp: /Applications/Xcode.app/.../usr/lib/libstdc++.6.0.9.tbd: Permission denied**, 怎么办？


 答: 执行加上sudo，如下所示:
 
 ```bash
	sudo sh add_stdc++_to_Xcode.sh
```

 ![](http://ww3.sinaimg.cn/large/006tNc79ly1g4dgdge10qj315l0u07bo.jpg)
 
 - 4、编译报错 **Reason: no suitable image found.  Did find:
	/usr/lib/libstdc++.6.dylib: mach-o, but not built for iOS simulator** 是什么问题？

答：Xcode10+ 版本缺少libstdc++.6.0.9.dylib文件造成无法加载dylib，执行本脚本就会自动将文件复原到原目录内。报错如下：

![](http://ww1.sinaimg.cn/large/006tNc79ly1g4dmnd1yjfj31ek072ac7.jpg)








