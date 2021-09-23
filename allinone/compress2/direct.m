%clear all
I = load_images('house3');

sz=size(I);
ppp=0;
qqq=1;
%showinputfigures(I);

Z=zeros(sz(1)-ppp,sz(2)-qqq,sz(3));

avgintensity=zeros(8,3);

R = exposure_fusion(I,[0 0 0]);

%figure('Name','Result without seam removal'); 
%imshow(R); 
% 
 ga=gradcsum(R(:,:,1));
 gb=gradcsum(R(:,:,2));
 gc=gradcsum(R(:,:,3));

 
[p1,p2,p3]=avgenergy3(ga,gb,gc);
T1(1)=(p1+p2+p3)/3;

 
%L=rgb2gray(R);
L=RGB2Lab(R);

%L= R(:,:,1)+R(:,:,2)+R(:,:,3);

a1=R(:,:,1);
b1=R(:,:,2);
c1=R(:,:,3);

[KK1 KK2 KK3]=avgenergy3(a1,b1,c1);
intensityin=[KK1 KK2 KK3];


p=0;
q=0;

 while p<ppp && q<qqq    
 [ga]=gradcsum(L);   
 [cy,row,minvr]=calmatcycsum(ga);
 [cx,col,minvc]=calmatcxcsum(ga);
 
 if minvc<minvr
          [L,a1,b1,c1]=seamwcsum(L,a1,b1,c1,cx,col);
          
     q=q+1;
 else
          [L,a1,b1,c1]=seamlcsum(L,a1,b1,c1,cy,row);
          
     p=p+1;
 end
 end
 
 if p<ppp
     while p~=ppp
 [ga]=gradcsum(L);   
 [cy,row]=calmatcycsum(ga); 
     
          [L,a1,b1,c1]=seamlcsum(L,a1,b1,c1,cy,row);
          
     p=p+1;
     end
 end
 if q<qqq
     while q~=qqq
          
            [ga]=gradcsum(L);   
            [cx,col]=calmatcxcsum(ga);          
            
            [d,d1,d2,d3]=seamwcsumshow(L,a1,b1,c1,cx,col);          
            siz=size(d1);
            W=zeros(siz(1),siz(2),3);
            W(:,:,1)=d1;
            W(:,:,2)=d2;
            W(:,:,3)=d3;
            imwrite(W,'seam.jpg','jpg');
            figure;imshow(W);
            
     
            [L,a1,b1,c1]=seamwcsum(L,a1,b1,c1,cx,col);          
            siz=size(a1);
            W=zeros(siz(1),siz(2),3);
            W(:,:,1)=a1;
            W(:,:,2)=b1;
            W(:,:,3)=c1;
            figure;imshow(W);
            
            %[p1,p2,p3]=avgenergy3(gradcsum(a1),gradcsum(b1),gradcsum(c1));
            %T1(q+1)=(p1+p2+p3)/3;
          
          q=q+1
     end
 end
       
 Z(:,:,1)=a1;
 Z(:,:,2)=b1;
 Z(:,:,3)=c1;
 
figure('Name','Result with seam removed'); 
imshow(Z); 

% [KK1 KK2 KK3]=avgenergy3(a1,b1,c1);
% intensityd=[KK1 KK2 KK3];

