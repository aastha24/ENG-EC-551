clear;
close all;

Input_IMG = imread('1.png');
Input_BW = rgb2gray(Input_IMG);
subplot(1,3,1), imshow(Input_IMG); title('Original Image');
subplot(1,3,2), imshow(Input_BW);  title('Grey Image');
A=importdata('outimage.txt');

out=zeros(98,98);
count=1;
for i=1:98
    for j=1:98
        if count<9509
            out(i,j)=A(count);
            count=count+1;
        else
            out(i,j)=0;
        end
    end
end

outimage=uint8(out);
subplot(1,3,3), imshow(outimage);  title('Edge Detected Image');