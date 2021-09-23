clear all
t1=cputime;
I = load_images('eimage/chameleon');
ppp=0;
qqq=150;
R1 = exposure_fusion(I,[0 0 0]);
figure('Name','Result without seam removal'); 
imshow(R1); 
pl=zeros(2,3);
qa=1;
qb=1;
[pl(1,1) pl(1,2) pl(1,3)]=avgenergy3(gradcsum(R1(:,:,3)),gradcsum(R1(:,:,2)),gradcsum(R1(:,:,1)));
a=I(:,:,:,1);
b=I(:,:,:,2);
c=I(:,:,:,3);


[a b c]=aggregatecompress(a,b,c,ppp,qqq);

[a b c qa]=agreegateenlarge(a,b,c,ppp,qqq,qa);

%[a b c qa]=seamenlageadjust(a,b,c,ppp,qqq,qa);
%[a,b,c]=seamcompressadjust(a,b,c,ppp,qqq);

%     for h=1:1
%     pp=0;
%     qq=400;
%     %qq=uint16((2.5)^(7-h));
%     [a b c]=aggregatecompress(a,b,c,pp,qq);
%     [R1,qb]=directcompress(R1,pp,qq,qb);
%     end

sz=size(a);
I=zeros(sz(1),sz(2),sz(3),3);
I(:,:,:,1)=a;
I(:,:,:,2)=b;
I(:,:,:,3)=c;

R = exposure_fusion(I,[0 0 0]);
figure('Name','Result with better Expo'); 
imshow(R); 
[pl(2,1) pl(2,2) pl(2,3)]=avgenergy3(gradcsum(R(:,:,3)),gradcsum(R(:,:,2)),gradcsum(R(:,:,1)));

figure('Name','direct'); 
imshow(R1);