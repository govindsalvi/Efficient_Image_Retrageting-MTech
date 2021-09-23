function [R qa]=directenlarge(R,ppp,qqq,qa)
sz=size(R);

Z=zeros(sz(1)+ppp,sz(2)+qqq,sz(3));



L1=RGB2Lab(R);


a1=R(:,:,1);
a2=R(:,:,2);
a3=R(:,:,3);

    
a=L1;




p=0;
q=0;


 while p<ppp && q<qqq    
     
 [ga]=gradcsum(a);   
 [cx,col,mvc]=calmatcxcsum(ga,qa);
 [cy,row,mvr]=calmatcycsum(ga,qa);
 
   if mvr<mvc
           qa=qa+1;
           [a,a1,a2,a3]=seamstretchl1(a,a1,a2,a3,cy,row);           
           p=p+1;
   else
            qa=qa+1;
           [a,a1,a2,a3]=seamstretchw1(a,a1,a2,a3,cx,col);
           q=q+1;
   end
 
 end
 
 if p<ppp
     while p~=ppp
           [ga]=gradcsum(a);
           [cy,row,mv]=calmatcycsum(ga,qa);
            qa=qa+1;
           [a,a1,a2,a3]=seamstretchl1(a,a1,a2,a3,cy,row);           
 p=p+1;
     end
 end
 if q<qqq
     while q~=qqq
          [ga]=gradcsum(a);
          [cx,col,mv]=calmatcxcsum(ga,qa);
            qa=qa+1;
           [a,a1,a2,a3]=seamstretchw1(a,a1,a2,a3,cx,col);
          q=q+1;
     end
 end

 Z(:,:,1)=a1;
 
 Z(:,:,2)=a2;
 
 
 Z(:,:,3)=a3;
 
 R=Z;