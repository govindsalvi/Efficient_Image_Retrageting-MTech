clear all
t1=cputime;
I = load_images('eimage/chameleon');
ppp=0;
qqq=50;
R1 = exposure_fusion(I,[0 0 0]);
figure('Name','Result without seam removal'); 
imshow(R1); 

a=I(:,:,:,1);
b=I(:,:,:,2);
c=I(:,:,:,3);
qa=1;
for ll=1:11
pp=0;
%qq=400;
%qq=200;
qq=uint16((ll-0.8)^2);
%qq=uint16((2.5)^(7-ll));
%qa=2^(8-ll);
[a b c qa]=agreegateitretion(a,b,c,pp,qq,qa);

end

sz=size(a);
I=zeros(sz(1),sz(2),sz(3),3);
I(:,:,:,1)=a;
I(:,:,:,2)=b;
I(:,:,:,3)=c;

R = exposure_fusion(I,[0 0 0]);
figure('Name','Result with seam removal'); 
imshow(R); 