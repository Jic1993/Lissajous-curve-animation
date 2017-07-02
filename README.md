# Lissajous-curve-animation

在别人的博文里看到 Lissajous曲线的动态图， 感觉还挺帅，于是自己也想玩一下。

![最终效果](http://upload-images.jianshu.io/upload_images/4066522-3f41aa9bc6d2e54f.gif?imageMogr2/auto-orient/strip)


---------------
## 具体实现
- 环境： Matlab R2017a

### Animated Line 实现动画效果
首先用`animatedline`创建初始动画线条对象**<sup>[ [1] ][animatedline]</sup>**，接着在循环中动态地向线条中添加点，并使用 `drawnow` 在屏幕上显示该新添加的点，然后用`getframe`捕获的当前图像。

[animatedline]:https://cn.mathworks.com/help/matlab/ref/animatedline.html

### 写入GIF动图
将`getframe`捕获的每一个图像，写入 **GIF** 动画文件**<sup>[ [2] ][imwrite]</sup>**。

[imwrite]:https://cn.mathworks.com/help/matlab/ref/imwrite.html?searchHighlight=gifs&s_tid=doc_srchtitle#btv452g-1


## 参考
1. http://www.matrix67.com/blog/archives/6947
2. https://codepen.io/handsomeone/full/Kgmbqg
3. https://cn.mathworks.com/matlabcentral/fileexchange/28987-lissajous-curve
4. https://cn.mathworks.com/examples/matlab/community/22655-lissajous-curves
