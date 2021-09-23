function [I,I1]=seamstretchl2(a,a1,c,minr,q)
sz=size(c); 

 res=zeros(sz(1)+1,sz(2));
 I1=zeros(sz(1)+1,sz(2));
 
  for j=1:sz(2)
      jj=sz(2)-j+1;
      for i=1:minr
          res(i,jj)=a(i,jj);
          I1(i,jj)=a1(i,jj);
      end
      res(minr+1,jj)=0;
      if q==1
     I1(minr+1,jj)=1;
     else
         I1(minr+1,jj)=0;
     end
      
%       
%      if(minr) <= (sz(1)-1)
%      
%      I1(minr+1,jj)=(a1(minr,jj)+a1(minr+1,jj))/2;
%      I2(minr+1,jj)=(a2(minr,jj)+a2(minr+1,jj))/2;
%      I3(minr+1,jj)=(a3(minr,jj)+a3(minr+1,jj))/2;
%      else
%      
%       I1(minr+1,jj)=a1(minr,jj);
%       I2(minr+1,jj)=a2(minr,jj);
%       I3(minr+1,jj)=a3(minr,jj);
%      end
      for i=minr+2:(sz(1)+1)
          res(i,jj)=a(i-1,jj);
          I1(i,jj)=a1(i-1,jj);
      end     
      
      if jj~=1
      if minr==1
         minr=mins2(c(1,jj-1),1,c(2,jj-1),2);
      elseif minr==sz(1)
          minr=mins2(c(sz(1)-1,jj-1),sz(1)-1,c(sz(1),jj-1),sz(1));
      else
          minr=mins3(c(minr-1,jj-1),minr-1,c(minr,jj-1),minr,c(minr+1,jj-1),minr+1);
      end  
      end

  end
I=mat2gray(res);
I1=mat2gray(I1);
