function [ga]=grad1(a)
if size(a,3)~=1
    a=rgb2gray(a);
end
sz=size(a);
  gax=zeros(sz(1),sz(2));
  gay=zeros(sz(1),sz(2));
for i=1:(sz(1)-1)
    for j=1:sz(2)
        gax(i,j)=abs(a(i+1,j)-a(i,j));
    end
end

for i=1:(sz(1))
    for j=1:(sz(2)-1)
        gay(i,j)=abs(a(i,j+1)-a(i,j));
    end
end
%ga=gax+gay;
ga=double(gax+gay);

end
