clear all;
imb=imread('1-b.png'); 
imq=imread('mura7.png');
img=imread('ganrao82.bmp');
if size(imb,3)>1  %转换为灰度图
imb=rgb2gray(imb);
end
if size(imq,3)>1  %转换为灰度图
imq=rgb2gray(imq);
end
if size(img,3)>1  %转换为灰度图
img=rgb2gray(img);
end

img=img';%旋转干扰
imq=imq;%mura旋转

img=im2bw(img,0.1);
img=255-img*255;

%尺寸
imb=imb+10;  %背景亮度
qq=3;%mura 亮度
imq=imresize(imq,[20,20]);
img=imresize(img,[64,64]);
img=im2bw(img,0.8);
img=img*255;
% figure,imshow(imb);
% figure,imshow(imq);
%取位置
global imbs;
global imqs;
global imgs;
imbs=size(imb);
imqs=size(imq);
imgs=size(img);
T=imbs(1)-imqs(1);
x=round(T*rand(1,1));
y=round(T*rand(1,1));

hist_im=imhist(imb); %计算直方图
hist_im2=imhist(imq);
% figure,bar(hist_im);%画直方图
% figure,bar(hist_im2);

%Mura缺陷添加
m1=mean(imb(x,y:y+imqs(1)-1));  %m为背景灰度指定
m2=mean(imb(x+imqs(2)-1,y:y+imqs(1)-1));
m3=mean(imb(x:x+imqs(2)-1,y));
m4=mean(imb(x:x+imqs(2)-1,y+imqs(1)-1));
m=(m1+m2+m3+m4)/4;
n1=mean(imq(1:2,:));  %n为缺陷周围灰度
n2=mean(imq((imqs(1)-2):imqs(1),:)); 
n3=mean(imq(:,1:2)); 
n4=mean(imq(:,(imqs(2)-2):imqs(2))); 
nn=mean(n1)+mean(n2)+mean(n3)+mean(n4);
n=nn/4;
%Mura整体灰度调整
m_n=m-n;
imq=imq+m_n+qq;
hist_im2=imhist(imq);
% figure,subplot(1,2,1)
% bar(hist_im);
% subplot(1,2,2);
% bar(hist_im2);

for i=x:1:x+imqs(2)-1
  for j=y:1:y+imqs(1)-1
  yichu1=double(imb(i,j));
  yichu2=double(imq(i-x+1,j-y+1));
  yichu=yichu1+yichu2-m;
 imb(i,j)=yichu;
  end
end
%防止重叠
P=imbs(1)-imgs(1);
L=imbs(2)-imgs(2);
gg=chongdie(P,L,x,y);


for i=gg(1):1:gg(1)+imgs(1)-1
    for j=gg(2):1:gg(2)+imgs(2)-1
    imb(i,j)=imb(i,j)+img(i-gg(1)+1,j-gg(2)+1);
    end
end
[a,b]=find(imb==255)
for i=1:1:length(a)
imb(a(i,1),b(i,1))=0;
end
imwrite(imb,'正样本/zresult150.jpg')
%   imwrite(imb,'负样本/result260.jpg')
figure,imshow(imb);







