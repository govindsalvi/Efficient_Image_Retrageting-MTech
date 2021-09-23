function [gax,gay]=gradcsum(a)
 sz=size(a);
 
 gax=zeros(sz(1),sz(2));
 gay=zeros(sz(1),sz(2));
 
  for i=1:sz(1)
      for j=1:(sz(2)-1)
      gax(i,j)=abs(a(i,j)-a(i,j+1));
      end
 end 
 
for j=1:sz(2)
      for i=1:(sz(1)-1)
      gay(i,j)=abs(a(i,j)-a(i+1,j));
      end
end 

end
