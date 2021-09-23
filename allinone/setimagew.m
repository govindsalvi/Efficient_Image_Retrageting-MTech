function [a] = setimagew(a)
sz=size(a);
for i=1:sz(1)
    for j=2:(sz(2)-1)
       if a(i,j)==0
           a(i,j)=((a(i,j-1)+a(i,j+1))/2);
       end
    end
end

