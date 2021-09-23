function [a] = setimagey(a)
sz=size(a);
for j=1:sz(2)
    for i=2:(sz(1)-1)
       if a(i,j)==0
           a(i,j)=((a(i-1,j)+a(i+1,j))/2);
       end
    end
end

