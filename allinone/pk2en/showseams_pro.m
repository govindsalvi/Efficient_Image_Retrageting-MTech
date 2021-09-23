clear all
t1=cputime;
%I = load_images('sun.jpg');
I=imread('ch1.jpg');
ppp=0;
qqq=20;

sz=size(I);
K1=zeros(sz(1)+ppp,sz(2)+qqq,sz(3));

%R = exposure_fusion(I,[0 0 0]);
 R=I(:,:,:,1);
%R=I(:,:,:,h);
L1=rgb2gray(R);
for q=1:3
   a2=R(:,:,q);
   L=L1;
   imwrite(L,'ch.jpg','jpg');
 for i=1:qqq
   L=imread('ch.jpg');
  [ga1]=promap(L);
  [c]=calmatcx(ga1);
  [mv1,mc1]=insertw(c);
  q
  [L,a2]=seamstretchw2(L,a2,c,mc1(i),q);
  imwrite(L,'ch.jpg','jpg')
 end
%  for j=1:qqq
%   [ga1]=grad(L);
%   [c]=calmatcy(ga1);
%   [mv1,mc1]=insertl(c);
%   [L,a2]=seamstretchl2(L,a2,c,mc1(i),q);
%  end
 K1(:,:,q)=a2;
end
 
figure;imshow(K1);

 t2=cputime;
 ll=t2-t1;
 ll