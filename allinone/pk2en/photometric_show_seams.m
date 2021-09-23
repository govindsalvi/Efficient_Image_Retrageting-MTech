%clear all
t1=cputime;
I=imread('sun.jpg');
ppp=1;
qqq=0;
sz=size(I);
%I=I(18:(sz(1)-60),(100:sz(2)-100),:);
figure; imshow(I);
%Depth1=Depth(18:(sz(1)-60),(100:sz(2)-100));
sz=size(I);

K1=zeros(sz(1)+ppp,sz(2)+qqq,sz(3));


%R = exposure_fusion(I,[0 0 0]);
%R=I(:,:,:,1);
R=I;
for h=1:1
%R=I(:,:,:,h);
L1=R(:,:,1);
%L1=Depth1;
for q=1:3
   a2=R(:,:,q);
   L=L1;
 for j=1:ppp
  [ga1]=grad(L);
  [c]=calmatcy(ga1);
  [mv1,mc1]=insertl(c);
  [L,a2]=seamstretchl2(L,a2,c,mc1(j),q);
 end
 K1(:,:,q)=a2;
 end
figure;imshow(K1);
end
 t2=cputime;
 ll=t2-t1;
 ll