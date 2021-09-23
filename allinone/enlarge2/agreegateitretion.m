function [a,b,c,qa]=agreegateitretion(a,b,c,ppp,qqq,qa)

sz=size(a);

Z=zeros(sz(1)+ppp,sz(2)+qqq,sz(3),3);

%avgintensity=zeros(8,3);

L1=RGB2Lab(a);
L2=RGB2Lab(b);
L3=RGB2Lab(c);

a1=a(:,:,1);
b1=b(:,:,1);
c1=c(:,:,1);

a2=a(:,:,2);
b2=b(:,:,2);
c2=c(:,:,2);

a3=a(:,:,3);
b3=b(:,:,3);
c3=c(:,:,3);

 %   L=L1+L2+L3;

%a=L;
%qa=1;
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
                %ga=(1/avginten(g1))*g1+(1/avginten(g2))*g2+(1/avginten(g3))*g3;
                ga=(avginten(g1))*g1+(avginten(g2))*g2+(avginten(g3))*g3;
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
 

 a=Z(:,:,:,1);
 b=Z(:,:,:,2);
 c=Z(:,:,:,3);
 