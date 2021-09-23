function [I]=seamstretchw1(a1,mc1,a,mc,c,c1)
%a1=seamstretchw1(a1,mc1(i),a,mc(i),c);
%figure;imshow(a);
%figure;imshow(a1);
sz=size(a1);

sz1=size(a);

res=zeros(sz(1),sz(2)+1);

 for i=1:sz(1)
     ii=sz(1)-i+1;
     for j=1:mc1-1
         res(ii,j)=a(ii,j);
     end
     
     res(ii,mc1)=a1(ii,mc);
     
     for j=mc1:sz(2)
         res(ii,j+1)=a1(ii,j);
     end
     
     if ii~=1
     if mc==1
         mc=mins2(c(ii-1,1),1,c(ii-1,2),2);
     elseif mc==sz1(2)
         mc=mins2(c(ii-1,sz1(2)-1),sz1(2)-1,c(ii-1,sz1(2)),sz1(2));
     else
         mc=mins3(c(ii-1,mc-1),mc-1,c(ii-1,mc),mc,c(ii-1,mc+1),mc+1);
     end
     if mc1==1
         mc1=mins2(c1(ii-1,1),1,c1(ii-1,2),2);
     elseif mc1==sz(2)
         mc1=mins2(c1(ii-1,sz(2)-1),sz(2)-1,c1(ii-1,sz(2)),sz(2));
     else
         mc1=mins3(c1(ii-1,mc1-1),mc1-1,c1(ii-1,mc1),mc1,c1(ii-1,mc1+1),mc1+1);
     end     
     end
 end
 
I=mat2gray(res);
