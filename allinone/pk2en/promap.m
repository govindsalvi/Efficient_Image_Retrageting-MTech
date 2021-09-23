 % Assume we Have 8 bit images
 function P=promap(a)
 %a=imread('ch1.jpg');
 %a=imread('ch.jpg');
 sz=size(a);
 if size(a,3)~=1
     a=rgb2gray(a);
 end
 P=zeros(size(a));
 total=sz(1)*sz(2);
 if isinteger(a)==0
     a=a.*255;
     a=uint8(a);
 end
 %a=double(a)/255;
 [c,x]=imhist(a);
 %figure;imshow(a);
 %figure;imhist(a)
 for i=1:sz(1)
     for j=1:sz(2)
         k=a(i,j);
         P(i,j)=1-(c(k+1)/total);
     end
 end
 %P=1-P;
 %imshow(mat2gray(1-P));
 %imwrite(P,'promap.jpg','jpg')
 %L=1-P;
 %imwrite(L,'inverse_promap.jpg','jpg')
 end