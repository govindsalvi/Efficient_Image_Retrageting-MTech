clear all
t1=cputime;
I = load_images('eimage/tubingen');

sz=size(I);
ppp=0;
qqq=300;
%showinputfigures(I);
avgintensity=zeros(8,3);
[g1,g2,g3]=grad(I(:,:,1,1),I(:,:,2,1),I(:,:,3,1));
avgintensity(1,1)=avginten(g1);
avgintensity(1,2)=avginten(g2);
avgintensity(1,3)=avginten(g3);
[g1,g2,g3]=grad(I(:,:,1,2),I(:,:,2,2),I(:,:,3,2));
avgintensity(2,1)=avginten(g1);
avgintensity(2,2)=avginten(g2);
avgintensity(2,3)=avginten(g3);
[g1,g2,g3]=grad(I(:,:,1,3),I(:,:,2,3),I(:,:,3,3));
avgintensity(3,1)=avginten(g1);
avgintensity(3,2)=avginten(g2);
avgintensity(3,3)=avginten(g3);

Z=zeros(sz(1)+ppp,sz(2)+qqq,sz(3),sz(4));



R = exposure_fusion(I,[0 0 0]);
figure('Name','Result without seam removal'); 
imshow(R); 


[g1,g2,g3]=grad(R(:,:,1),R(:,:,2),R(:,:,3));

avgintensity(7,1)=avginten(g1);
avgintensity(7,2)=avginten(g2);
avgintensity(7,3)=avginten(g3);


% 
%colrin=zeros(pp+1);


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

    L=L1+L2+L3;

a=L;
qa=1;
qb=1;
qc=1;

%[ga,gb,gc]=grad(a,b,c);

p=0;
q=0;


 while p<ppp && q<qqq    
     
    [g1]=gradcsum(L1);   
    [g2]=gradcsum(L2);   
    [g3]=gradcsum(L3);
    ga=(1/avginten(g1))*g1+(1/avginten(g2))*g2+(1/avginten(g3))*g3;
 [cx,col,mvc]=calmatcxcsum(ga,qa);
 [cy,row,mvr]=calmatcycsum(ga,qa);
   if mvr<mvc
           qa=qa+1;
           [L1,a1,a2,a3]=seamstretchl1(L1,a1,a2,a3,cy,row);
           [L2,b1,b2,b3]=seamstretchl1(L2,b1,b2,b3,cy,row);
           [L3,c1,c2,c3]=seamstretchl1(L3,c1,c2,c3,cy,row);           
           p=p+1;
   else
            qa=qa+1;
           [L1,a1,a2,a3]=seamstretchw1(L1,a1,a2,a3,cx,col);
           [L2,b1,b2,b3]=seamstretchw1(L2,b1,b2,b3,cx,col);
           [L3,c1,c2,c3]=seamstretchw1(L3,c1,c2,c3,cx,col);
           q=q+1;
   end
 
 end
 
 if p<ppp
     while p~=ppp
           
                [g1]=gradcsum(L1);   
                [g2]=gradcsum(L2);   
                [g3]=gradcsum(L3);
                ga=(1/avginten(g1))*g1+(1/avginten(g2))*g2+(1/avginten(g3))*g3;
           [cy,row,mv]=calmatcycsum(ga,qa);
            qa=qa+1;           
           [L1,a1,a2,a3]=seamstretchl1(L1,a1,a2,a3,cy,row);
           [L2,b1,b2,b3]=seamstretchl1(L2,b1,b2,b3,cy,row);
           [L3,c1,c2,c3]=seamstretchl1(L3,c1,c2,c3,cy,row);           
 p=p+1;
     end
 end
 if q<qqq
     while q~=qqq
                [g1]=gradcsum(L1);   
                [g2]=gradcsum(L2);   
                [g3]=gradcsum(L3);
                ga=(1/avginten(g1))*g1+(1/avginten(g2))*g2+(1/avginten(g3))*g3;
                 %ga=(.3)*g1+(.4)*g2+(.3)*g3;
           [cx,col,mv]=calmatcxcsum(ga,qa);
            qa=qa+1;
           [L1,a1,a2,a3]=seamstretchw1(L1,a1,a2,a3,cx,col);
           [L2,b1,b2,b3]=seamstretchw1(L2,b1,b2,b3,cx,col);
           [L3,c1,c2,c3]=seamstretchw1(L3,c1,c2,c3,cx,col);        
          q=q+1;
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
 


 
[g1,g2,g3]=grad(Z(:,:,1,1),Z(:,:,2,1),Z(:,:,3,1));
avgintensity(4,1)=avginten(g1);
avgintensity(4,2)=avginten(g2);
avgintensity(4,3)=avginten(g3);
[g1,g2,g3]=grad(Z(:,:,1,2),Z(:,:,2,2),Z(:,:,3,2));
avgintensity(5,1)=avginten(g1);
avgintensity(5,2)=avginten(g2);
avgintensity(5,3)=avginten(g3);
[g1,g2,g3]=grad(Z(:,:,1,3),Z(:,:,2,3),Z(:,:,3,3));
avgintensity(6,1)=avginten(g1);
avgintensity(6,2)=avginten(g2);
avgintensity(6,3)=avginten(g3);
 

  R = exposure_fusion(Z,[0 0 0]);
  
[ga,gb,gc]=grad(R(:,:,1),R(:,:,2),R(:,:,3));

% ga=RGB2Lab(R(:,:,1));
% gb=RGB2Lab(R(:,:,2));
% gc=RGB2Lab(R(:,:,3));

avgintensity(8,1)=avginten(ga);
avgintensity(8,2)=avginten(gb);
avgintensity(8,3)=avginten(gc);
figure('Name','Result with seam inserted'); 
imshow(R); 
t2=cputime;

ll=t2-t1;
ll