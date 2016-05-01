clear all;clc; close all
N = 3;
%hist = zeros(256,256,256);
hist = zeros(256,256);
for k = 1 : N
    i='0'+mod(k,10);
    if k<10
        j='';
    else
        j='0'+ k/10;
    end
    Im =imread([j i '.png']); %0.jpg,1.jpg...
    [m,n,r] = size(Im);
    t = 1.0000/(m*n);
    for i = 1: m
        for j = 1: n
            %c1 = Im(i,j,1);
            c2 = Im(i,j,2);
            c3 = Im(i,j,3);
            %hist(c1+1,c2+1,c3+1) = hist(c1+1,c2+1,c3+1) + t;
            hist(c2+1,c3+1) = hist(c2+1,c3+1) + t;
        end
    end
end
hist = hist/N;
figure;
I_n = imread('7.bmp');
I = I_n;
imshow(I);
[m2,n2,r2] = size(I);
for i= 1:m2
    for j = 1:n2
        %c21 = I(i,j,1);
        c22 = I(i,j,2);
        c23 = I(i,j,3);
        %if hist(c21+1,c22+1,c23+1) > 0
        if hist(c22+1,c23+1) > 0.007
            I(i,j,1) = 255;
            I(i,j,2) = 255;
            I(i,j,3) = 255;
        else
            I(i,j,1) = 0;
            I(i,j,2) = 0;
            I(i,j,3) = 0;
        end
    end
end
figure;
imshow(im2bw(I));
%
I2 = bwareaopen(im2bw(I),300,4);

%imLabel = bwlabel(imBw);                %?????????
%stats = regionprops(imLabel,'Area');    %????????
%area = cat(1,stats.Area);               
%index = find(area > thres);             %?????????????
%img = ismember(imLabel,index(:));        %???????
figure;
imshow(I2);
hold on;

[L,num] = bwlabel(I2,8);
num

% main.m  

[m_n,n_n] = size(I2);
[x1,y1,x2,y2] = plotline(I2,m_n,n_n);

pointAll = [x2,y2];  
windSize = [y1 - y2,x1 -x2];  
  
[state,results]=draw_rect(I_n,pointAll,windSize);  

 


