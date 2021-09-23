clear all
t1=cputime;
I = load_images('house');
ppp=0;
qqq=20;

R = exposure_fusion(I,[0 0 0]);
figure('Name','Result without seam removal'); 
imshow(R);

% [L1]=RGB2Lab(I(:,:,:,1));
% [L2]=RGB2Lab(I(:,:,:,2));
% [L3]=RGB2Lab(I(:,:,:,3));

%sz=size(I);

sz=size(R);

%K=zeros(sz(1)+ppp,sz(2)+qqq,sz(3),sz(4));

K1=zeros(sz(1)+ppp,sz(2)+qqq,sz(3));
R=I(:,:,:,2);
%L1=RGB2Lab(R);
L1=R(:,:,1);
 
  for q=1:3
   a2=R(:,:,q);
%  a2=I(:,:,q,1);
%  b2=I(:,:,q,2);
%  c2=I(:,:,q,3);
 %a1=a(:,:,1);
 %L=L1+L2+L3;
 L=L1;
 for i=1:qqq
     
  [ga1]=grad(L);
  [c]=calmatcx(ga1);
  [mv1,mc1]=insertw(c);

 %[L,a2,b2,c2]=seamstretchw(L,a2,b2,c2,c,mc1(i));
  [L,a2]=seamstretchw2(L,a2,c,mc1(i));
 end
 K1(:,:,q)=a2;
% 
%  K(:,:,q,1)=a2;
%  K(:,:,q,2)=b2;
%  K(:,:,q,3)=c2;
%  
  end
%  R = exposure_fusion(K,[0 0 0]);
% figure('Name','Result without seam removal'); 
figure;imshow(K1);
 t2=cputime;
 ll=t2-t1;
 ll