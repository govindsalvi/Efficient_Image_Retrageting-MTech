function [R1,qa]=directcompress(R1,ppp,qqq,qa)
sz=size(R1);

Z=zeros(sz(1)-ppp,sz(2)-qqq,sz(3));


L=RGB2Lab(R1);

a1=R1(:,:,1);
b1=R1(:,:,2);
c1=R1(:,:,3);



p=0;
q=0;

 while p<ppp && q<qqq    
 [ga]=gradcsum(L);   
 [cy,row,minvr]=calmatcycsum1(ga);
 [cx,col,minvc]=calmatcxcsum1(ga);
 
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
 [cy,row]=calmatcycsum1(ga); 
     
          [L,a1,b1,c1]=seamlcsum(L,a1,b1,c1,cy,row);
          
     p=p+1;
     end
 end
 if q<qqq
     while q~=qqq
          
            [ga]=gradcsum(L);   
            [cx,col]=calmatcxcsum1(ga);          
            [L,a1,b1,c1]=seamwcsum(L,a1,b1,c1,cx,col);          
            
            [p1,p2,p3]=avgenergy3(gradcsum(a1),gradcsum(b1),gradcsum(c1));
            T1(q+1)=(p1+p2+p3)/3;
          
          q=q+1;
     end
 end
       
 Z(:,:,1)=a1;
 
 Z(:,:,2)=b1;
 
 
 Z(:,:,3)=c1;
 
 R1=Z;
