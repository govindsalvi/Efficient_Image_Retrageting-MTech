function [a,b,c]=seamcompressadjust(a,b,c,ppp,qqq)

sz=size(a);
Z=zeros(sz(1)-ppp,sz(2)-qqq,sz(3),3);


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


p=0;
q=0;
 while p<ppp && q<qqq    
 [ga,gb,gc]=grad(L1,L2,L3);   
 [cy,row,minvr]=calmatcyc(ga,gb,gc);
 [cx,col,minvc]=calmatcxc(ga,gb,gc);
 if minvc<minvr
     
          [L1,a1,a2,a3]=seamwcsum1(L1,a1,a2,a3,cx,col);
          [L2,b1,b2,b3]=seamwcsum1(L2,b1,b2,b3,cx,col);
          [L3,c1,c2,c3]=seamwcsum1(L3,c1,c2,c3,cx,col);   
     q=q+1;
 else
          [L1,a1,a2,a3]=seamlcsum1(L1,a1,a2,a3,cy,row);
          [L2,b1,b2,b3]=seamlcsum1(L2,b1,b2,b3,cy,row);
          [L3,c1,c2,c3]=seamlcsum1(L3,c1,c2,c3,cy,row);
     p=p+1;
 end
 end
 
 if p<ppp
     while p~=ppp
           [ga,gb,gc]=grad(L1,L2,L3);   
           [cy,row]=calmatcyc(ga,gb,gc); 
          [L1,a1,a2,a3]=seamlcsum1(L1,a1,a2,a3,cy,row);
          [L2,b1,b2,b3]=seamlcsum1(L2,b1,b2,b3,cy,row);
          [L3,c1,c2,c3]=seamlcsum1(L3,c1,c2,c3,cy,row);
     p=p+1;
     end
 end
 if q<qqq
     while q~=qqq
          
          [ga,gb,gc]=grad(L1,L2,L3);   
          [cx,col]=calmatcxc(ga,gb,gc);
          
          [L1,a1,a2,a3]=seamwcsum1(L1,a1,a2,a3,cx,col);
          [L2,b1,b2,b3]=seamwcsum1(L2,b1,b2,b3,cx,col);
          [L3,c1,c2,c3]=seamwcsum1(L3,c1,c2,c3,cx,col);     
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