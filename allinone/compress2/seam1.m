%clear all
I = load_images('eimagec\house');

sz=size(I);
ppp=200;
qqq=618;
%showinputfigures(I);

Z=zeros(sz(1)-ppp,sz(2)-qqq,sz(3),sz(4));

avgintensity=zeros(8,3);

R = exposure_fusion(I,[0 0 0]);
[ga,gb,gc]=grad(R(:,:,1),R(:,:,2),R(:,:,3));
% 
% avgintensity(7,1)=avginten(ga);
% avgintensity(7,2)=avginten(gb);
% avgintensity(7,3)=avginten(gc);
figure('Name','Result without seam removal'); 
imshow(R); 

[p1,p2,p3]=avgenergy3(ga,gb,gc);
T2(1)=(p1+p2+p3)/3;

L1=RGB2Lab(I(:,:,:,1));
L2=RGB2Lab(I(:,:,:,2));
L3=RGB2Lab(I(:,:,:,3));


a1=I(:,:,1,1);
b1=I(:,:,1,2);
c1=I(:,:,1,3);

a2=I(:,:,2,1);
b2=I(:,:,2,2);
c2=I(:,:,2,3);

a3=I(:,:,3,1);
b3=I(:,:,3,2);
c3=I(:,:,3,3);

% 
% L1= a1+a2+a3;
% L2= b1+b2+b3;
% L3= c1+c2+c3;


    
a=L1;
b=L2;
c=L3;

p=0;
q=0;
 while p<ppp && q<qqq    
 [ga,gb,gc]=grad(a,b,c);   
 [cy,row,minvr]=calmatcy(ga,gb,gc);
 [cx,col,minvc]=calmatcx(ga,gb,gc);
 if minvc<minvr
     
          [a,a1,a2,a3]=seamwcsum(a,a1,a2,a3,cx,col);
          [b,b1,b2,b3]=seamwcsum(b,b1,b2,b3,cx,col);
          [c,c1,c2,c3]=seamwcsum(c,c1,c2,c3,cx,col);   
     q=q+1;
 else
          [a,a1,a2,a3]=seamlcsum(a,a1,a2,a3,cy,row);
          [b,b1,b2,b3]=seamlcsum(b,b1,b2,b3,cy,row);
          [c,c1,c2,c3]=seamlcsum(c,c1,c2,c3,cy,row);
     p=p+1;
 end
 end
 
 if p<ppp
     while p~=ppp
            [ga,gb,gc]=grad(a,b,c);   
            [cy,row]=calmatcy(ga,gb,gc); 
     
          [a,a1,a2,a3]=seamlcsum(a,a1,a2,a3,cy,row);
          [b,b1,b2,b3]=seamlcsum(b,b1,b2,b3,cy,row);
          [c,c1,c2,c3]=seamlcsum(c,c1,c2,c3,cy,row);
     p=p+1
     end
 end
 if q<qqq
     while q~=qqq
          
          [ga,gb,gc]=grad(a,b,c);   
          [cx,col]=calmatcx(ga,gb,gc);
          
          [a,a1,a2,a3]=seamwcsum(a,a1,a2,a3,cx,col);
          [b,b1,b2,b3]=seamwcsum(b,b1,b2,b3,cx,col);
          [c,c1,c2,c3]=seamwcsum(c,c1,c2,c3,cx,col);     
%           sz1=size(a1);
%           N=zeros(sz1(1),sz1(2),3,3);
%           
%           
%  N(:,:,1,1)=a1;
%  N(:,:,1,2)=b1;
%  N(:,:,1,3)=c1;
%  
%  N(:,:,2,1)=a2;
%  N(:,:,2,2)=b2;
%  N(:,:,2,3)=c2;
%  
%  
%  N(:,:,3,1)=a3;
%  N(:,:,3,2)=b3;
%  N(:,:,3,3)=c3;
%  
%             R = exposure_fusion(N,[0 0 0]);
%  
%             [p1,p2,p3]=avgenergy3(gradcsum(R(:,:,1)),gradcsum(R(:,:,2)),gradcsum(R(:,:,3)));
%             T2(q+1)=(p1+p2+p3)/3;
          
          
          q=q+1
     end
 end
       
 Z(:,:,1,1)=a1;
 Z(:,:,1,2)=b1;
 Z(:,:,1,3)=c1;
 
 Z(:,:,2,1)=a2;
 Z(:,:,2,2)=b2;
 Z(:,:,2,3)=c2;
 
 
 Z(:,:,3,1)=a3;
 Z(:,:,3,2)=b3;
 Z(:,:,3,3)=c3;
 
 R = exposure_fusion(Z,[0 0 0]);
%[ga,gb,gc]=grad(R(:,:,1),R(:,:,2),R(:,:,3));
% avgintensity(8,1)=avginten(ga);
% avgintensity(8,2)=avginten(gb);
% avgintensity(8,3)=avginten(gc);
figure('Name','Result with seam removed'); 
 imshow(R); 
% [KK1 KK2 KK3]=avgenergy3(R(:,:,1),R(:,:,2),R(:,:,3));
% intensityim=[KK1 KK2 KK3];

