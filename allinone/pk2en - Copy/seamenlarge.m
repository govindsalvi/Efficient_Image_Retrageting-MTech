 clear all
 t1=cputime;
 I = load_images('house');
ppp=0;
qqq=200;

a=I(:,:,:,1);
b=I(:,:,:,2);
c=I(:,:,:,3);

R = exposure_fusion(I,[0 0 0]);
figure('Name','Result without seam removal'); 
imshow(R);

sz=size(I);

K=zeros(sz(1)+ppp,sz(2)+qqq,sz(3));

L1=RGB2Lab(a);
L2=RGB2Lab(b);
L3=RGB2Lab(c);
 
 for q=1:3
 %a2=R(:,:,q);
 %a1=a(:,:,1);
 a2=a(:,:,q);
 b2=b(:,:,q);
 c2=c(:,:,q);
 L=L1+L2+L3;
 %[L]=RGB2Lab(R);
 for i=1:qqq
     
 [ga1]=grad(L);
 [c1]=calmatcx(ga1);
 [mv1,mc1]=insertw(c1);

 [L,a2,b2,c2]=seamstretchw(L,a2,b2,c2,c1,mc1(i));
 end

 K(:,:,q,1)=a2;
 K(:,:,q,2)=b2;
 K(:,:,q,3)=c2;
 end
R = exposure_fusion(K,[0 0 0]);
figure('Name','Result with seam removal'); 
imshow(R);
t2=cputime;
ll=t2-t1;
ll
% figure;imshow(K);