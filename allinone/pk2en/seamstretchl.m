function [I]=seamstretchl(a,c,minr)
sz=size(c); 

 res=zeros(sz(1)+1,sz(2));
 
  for j=1:sz(2)
      jj=sz(2)-j+1;
      for i=1:minr
          res(i,jj)=a(i,jj);
      end
      res(minr+1,jj)=a(minr,jj);
      for i=minr+2:sz(1)+1;
          res(i,jj)=a(i-1,jj);
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

I=mat2gray(res);

