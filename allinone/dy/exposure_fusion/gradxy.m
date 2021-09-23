function [gx,gy] = gradxy(I)

sz=size(I);
gx=zeros(sz(1),sz(2));
gy=zeros(sz(1),sz(2));

for i=1:sz(1)
    for j=1:sz(2)-1
        gx(i,j)=(I(i,j+1)-I(i,j));
    end
end
for i=1:sz(1)-1
    for j=1:sz(2)
        gy(i,j)=(I(i+1,j)-I(i,j));
    end
end

end

