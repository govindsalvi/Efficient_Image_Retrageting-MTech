%clear all
%[EV,EE]=dy;
I = load_images('eimagec\house');
sz=size(I);
ppp=0;
qqq=0;

Z=zeros(sz(1)-ppp,sz(2)-qqq,sz(3),sz(4));

%T=zeros(qqq);

R = exposure_fusion(I,[0 0 0]);
figure('Name','Result without seam removal'); 
imshow(R); 
F=focuse(R);
 F=F./max(max(F));
figure('Name','Focused region'); 
imshow(F); 

%[p1,p2,p3]=avgenergy3(gradcsum(R(:,:,1)),gradcsum(R(:,:,2)),gradcsum(R(:,:,3)));

%T4(1)=(p1+p2+p3)/3;


L1=RGB2Lab(I(:,:,:,1));
L2=RGB2Lab(I(:,:,:,2));
L3=RGB2Lab(I(:,:,:,3));


%L=L1+L2+L3;

    
a1=I(:,:,1,1);
b1=I(:,:,1,2);
c1=I(:,:,1,3);

a2=I(:,:,2,1);
b2=I(:,:,2,2);
c2=I(:,:,2,3);

a3=I(:,:,3,1);
b3=I(:,:,3,2);
c3=I(:,:,3,3);

% L1= a1+a2+a3;
% L2= b1+b2+b3;
% L3= c1+c2+c3;


p=0;
q=0;
 while p<ppp && q<qqq    
  
    [g1]=gradcsum(L1);   
    [g2]=gradcsum(L2);   
    [g3]=gradcsum(L3);   
    
          S=laplace(L1)+laplace(L2)+laplace(L3);
          ga=(laplace(L1)./S).*g1+(laplace(L2)./S).*g2+(laplace(L3)./S).*g3;
          %ga=g1+g2+g3;
    %ga=(avginten(g1))*g1+(avginten(g2))*g2+(avginten(g3))*g3;
    [cy,row,minvr]=calmatcycsum(ga);
    [cx,col,minvc]=calmatcxcsum(ga);
 
 if minvc<minvr
          [L1,a1,a2,a3]=seamwcsum(L1,a1,a2,a3,cx,col);
          [L2,b1,b2,b3]=seamwcsum(L2,b1,b2,b3,cx,col);
          [L3,c1,c2,c3]=seamwcsum(L3,c1,c2,c3,cx,col);
          
     q=q+1;
 else
          [L1,a1,a2,a3]=seamlcsum(L1,a1,a2,a3,cy,row);
          [L2,b1,b2,b3]=seamlcsum(L2,b1,b2,b3,cy,row);
          [L3,c1,c2,c3]=seamlcsum(L3,c1,c2,c3,cy,row);
     p=p+1;
 end
 end
 
 if p<ppp
     while p~=ppp
%           [g1]=gradcsum(L1);   
%           [g2]=gradcsum(L2);   
%           [g3]=gradcsum(L3);   
          [g1]=focuse(L1);   
          [g2]=focuse(L2);   
          [g3]=focuse(L3);   
          
          S=laplace(L1)+laplace(L2)+laplace(L3);
          ga=(laplace(L1)./S).*g1+(laplace(L2)./S).*g2+(laplace(L3)./S).*g3;
          %ga=g1+g2+g3;
          %ga=(avginten(g1))*g1+(avginten(g2))*g2+(avginten(g3))*g3;
          [cy,row]=calmatcycsum(ga); 
          [L1,a1,b1,c1]=seamlcsum(L1,a1,b1,c1,cy,row);
          [L2,a2,b2,c2]=seamlcsum(L2,a2,b2,c2,cy,row);
          [L3,a3,b3,c3]=seamlcsum(L3,a3,b3,c3,cy,row);
     p=p+1
     end
 end
 if q<qqq
     while q~=qqq
          
          [g1]=gradcsum(L1);   
          [g2]=gradcsum(L2);   
          [g3]=gradcsum(L3);   
          
          %T(q+1)=avginten(gradcsum(a1));
          
          S=laplace(L1)+laplace(L2)+laplace(L3);
          
          ga=(laplace(L1)./S).*g1+(laplace(L2)./S).*g2+(laplace(L3)./S).*g3;
          %ga=g1+g2+g3;
          
          %ga=(avginten(g1))*g1+(avginten(g2))*g2+(avginten(g3))*g3;
          
          [cx,col]=calmatcxcsum(ga);          
          
          [L1,a1,a2,a3]=seamwcsum(L1,a1,a2,a3,cx,col);
          [L2,b1,b2,b3]=seamwcsum(L2,b1,b2,b3,cx,col);
          [L3,c1,c2,c3]=seamwcsum(L3,c1,c2,c3,cx,col);     
          
%           sz1=size(a1);
%           N=zeros(sz1(1),sz1(2),3,3);
%           
%           
%             N(:,:,1,1)=a1;
%             N(:,:,1,2)=b1;
%             N(:,:,1,3)=c1;
%  
%             N(:,:,2,1)=a2;
%             N(:,:,2,2)=b2;
%             N(:,:,2,3)=c2;
%  
%  
%             N(:,:,3,1)=a3;
%             N(:,:,3,2)=b3;
%             N(:,:,3,3)=c3;
%  
%             R = exposure_fusion(N,[0 0 0]);
%             [p1,p2,p3]=avgenergy3(gradcsum(R(:,:,1)),gradcsum(R(:,:,2)),gradcsum(R(:,:,3)));
%             T4(q+1)=(p1+p2+p3)/3;
          
          
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
 
 
% [g1,g2,g3]=grad(Z(:,:,1,1),Z(:,:,2,1),Z(:,:,3,1));
% avgintensity(4,1)=avginten(g1);
% avgintensity(4,2)=avginten(g2);
% avgintensity(4,3)=avginten(g3);
% [g1,g2,g3]=grad(Z(:,:,1,2),Z(:,:,2,2),Z(:,:,3,2));
% avgintensity(5,1)=avginten(g1);
% avgintensity(5,2)=avginten(g2);
% avgintensity(5,3)=avginten(g3);
% [g1,g2,g3]=grad(Z(:,:,1,3),Z(:,:,2,3),Z(:,:,3,3));
% avgintensity(6,1)=avginten(g1);
% avgintensity(6,2)=avginten(g2);
% avgintensity(6,3)=avginten(g3);
 
R = exposure_fusion(Z,[0 0 0]);

%[ga,gb,gc]=grad(R(:,:,1),R(:,:,2),R(:,:,3));
% avgintensity(8,1)=avginten(ga);
% avgintensity(8,2)=avginten(gb);
% avgintensity(8,3)=avginten(gc);
figure('Name','Result with seam removed'); 
imshow(R); 
% [KK1 KK2 KK3]=avgenergy3(R(:,:,1),R(:,:,2),R(:,:,3));
% intensitya=[KK1 KK2 KK3];
