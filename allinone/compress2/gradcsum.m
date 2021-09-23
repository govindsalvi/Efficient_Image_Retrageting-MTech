function [ga]=gradcsum(a)
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
ga=gax+gay;
%ga(sz(1),:)=ga(sz(1)-1,:);
%ga(:,sz(2))=ga(:,sz(2)-1);
end
