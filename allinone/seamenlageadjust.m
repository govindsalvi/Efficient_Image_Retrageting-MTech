function [a b c qa]=seamenlageadjust(a,b,c,ppp,qqq,qa)
%showinputfigures(I);
sz=size(a);
Z=zeros(sz(1)+ppp,sz(2)+qqq,sz(3),3);


% L1=RGB2Lab(a);
% L2=RGB2Lab(b);
% L3=RGB2Lab(c);


L1=a(:,:,1)+a(:,:,2)+a(:,:,3);
L2=b(:,:,1)+b(:,:,2)+b(:,:,3);
L3=c(:,:,1)+c(:,:,2)+c(:,:,3);

a1=a(:,:,1);
b1=b(:,:,1);
c1=c(:,:,1);

a2=a(:,:,2);
b2=b(:,:,2);
c2=c(:,:,2);

a3=a(:,:,3);
b3=b(:,:,3);
c3=c(:,:,3);

    
a=L1;
b=L2;
c=L3;


p=0;
q=0;


 while p<ppp && q<qqq    
     
 [ga,gb,gc]=grad(a,b,c);   
 [cx,col,mvc]=calmatcx1(ga,gb,gc,qa);
 [cy,row,mvr]=calmatcy1(ga,gb,gc,qa);
   if mvr<mvc
           qa=qa+1;
           [a,a1,a2,a3]=seamstretchl1(a,a1,a2,a3,cy,row);
           [b,b1,b2,b3]=seamstretchl1(b,b1,b2,b3,cy,row);
           [c,c1,c2,c3]=seamstretchl1(c,c1,c2,c3,cy,row);           
           p=p+1;
   else
            qa=qa+1;
           [a,a1,a2,a3]=seamstretchw1(a,a1,a2,a3,cx,col);
           [b,b1,b2,b3]=seamstretchw1(b,b1,b2,b3,cx,col);
           [c,c1,c2,c3]=seamstretchw1(c,c1,c2,c3,cx,col);
           q=q+1;
   end
 
 end
 
 if p<ppp
     while p~=ppp
           [ga,gb,gc]=grad(a,b,c);
           [cy,row,mv]=calmatcy1(ga,gb,gc,qa);
            qa=qa+1;
           [a,a1,a2,a3]=seamstretchl1(a,a1,a2,a3,cy,row);
           [b,b1,b2,b3]=seamstretchl1(b,b1,b2,b3,cy,row);
           [c,c1,c2,c3]=seamstretchl1(c,c1,c2,c3,cy,row);           
 p=p+1;
     end
 end
 if q<qqq
     while q~=qqq
          [ga,gb,gc]=grad(a,b,c);
          [cx,col,mv]=calmatcx1(ga,gb,gc,qa);
            qa=qa+1;
           [a,a1,a2,a3]=seamstretchw1(a,a1,a2,a3,cx,col);
           [b,b1,b2,b3]=seamstretchw1(b,b1,b2,b3,cx,col);
           [c,c1,c2,c3]=seamstretchw1(c,c1,c2,c3,cx,col);          
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