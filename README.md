# Mura-image-data-generation-and-augmentation

Mura缺陷代表一种典型的不均匀显示缺陷。随着液晶显示器发展，Mura缺陷出现的几率大大增加，必须在 LCD 制作过程中，通过缺陷检测来保证产品质量。
利用学习算法对Mura缺陷进行特征提取和分类，需要足够的训练样本。只利用少量的图片数据进行训练，很可能发生过拟合等问题。可以利用样本增强方法生成大量图像数据。
 
## 数据生成：
由背景+干扰+mura缺陷三部分共同合成，通过分别改变旋转角度，位置和亮度来生成不同图像。

除此之外，Mura和背景的融合调整，以及重叠问题都有考虑并处理。

## 使用方法（Matlab ）：
generation.m


