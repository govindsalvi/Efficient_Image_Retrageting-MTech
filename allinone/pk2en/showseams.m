clear all
t1=cputime;
%I = load_images('sun.jpg');
I=imread('sun.jpg');
ppp=0;
qqq=4;

sz=size(I);
K1=zeros(sz(1)+ppp,sz(2)+qqq,sz(3));

%R = exposure_fusion(I,[0 0 0]);
R=I(:,:,:,1);
%R=I(:,:,:,h);
L1=R(:,:,1);
for q=1:3
   a2=R(:,:,q);
   L=L1;
 for i=1:qqq
  [ga1]=grad(L);
  [c]=calmatcx(ga1);
  [mv1,mc1]=insertw(c);
  q
  [L,a2]=seamstretchw2(L,a2,c,mc1(i),q);
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