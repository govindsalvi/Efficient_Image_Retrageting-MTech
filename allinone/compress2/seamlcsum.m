function [I,I1,I2,I3]=seamlcsum(a,a1,b1,c1,c,minr)
sz=size(c);
res=zeros(sz(1)-1,sz(2));
I1=zeros(sz(1)-1,sz(2));
I2=zeros(sz(1)-1,sz(2));
I3=zeros(sz(1)-1,sz(2));
 
 for j=1:sz(2)
     jj=sz(2)-j+1;
     for i=1:(minr-1)
         res(i,jj)=a(i,jj);
         I1(i,jj)=a1(i,jj);
         I2(i,jj)=b1(i,jj);
         I3(i,jj)=c1(i,jj);
     end
     
     for i=minr:sz(1)-1;
         res(i,jj)=a(i+1,jj);
         I1(i,jj)=a1(i+1,jj);
         I2(i,jj)=b1(i+1,jj);
         I3(i,jj)=c1(i+1,jj);
     end
     
     if jj~=1
     if minr==1
         minr=mins2(c(1,jj-1),1,c(2,jj-1),2);
     elseif minr==sz(1)
         minr=mins2(c(sz(1),jj-1),sz(1),c(sz(1)-1,jj-1),sz(1)-1);
     else
         minr=mins3(c(minr,jj-1),minr,c(minr-1,jj-1),minr-1,c(minr+1,jj-1),minr+1);
     end  
     end
 end
 I=res;
%  
%  I=mat2gray(res);
%  I1=mat2gray(I1);
%  I2=mat2gray(I2);
%  I3=mat2gray(I3);
 
 
