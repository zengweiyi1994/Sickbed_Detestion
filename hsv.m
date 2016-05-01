clear all;clc; close all
N = 3;
%hist = zeros(256,256,256);
histr = zeros(256,1);
histg = zeros(256,1);
histb = zeros(256,1);
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
            c1 = Im(i,j,1);
            c2 = Im(i,j,2);
            c3 = Im(i,j,3);
            histr(c1+1) = histr(c1+1) + t;
            histg(c2+1) = histg(c2+1) + t;
            histb(c3+1) = histb(c3+1) + t;
            %hist(c1+1,c2+1,c3+1) = hist(c1+1,c2+1,c3+1) + t;
            %hist(c1+1,c3+1) = hist(c1+1,c3+1) + t;
        end
    end
end
histr = histr/N;
histg = histg/N;
histb = histb/N;
xr = 1:256;
plot(xr,histr,'r');
figure;
plot(xr,histg,'g');
figure;
plot(xr,histb,'b');

I = imread('7.bmp');

        



