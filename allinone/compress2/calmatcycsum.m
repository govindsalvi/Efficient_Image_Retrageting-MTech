function [cfinal,row,value] = calmatcycsum(ga)
sz=size(ga);
ca=zeros(sz(1),sz(2));

for i=1:sz(1)
    ca(i,1)=ga(i,1);
end

for j=2:sz(2)
    for i=1:sz(1)
        if i==1
            ca(i,j)=ga(i,j)+min([ca(i,j-1),ca(i+1,j-1)]);
        elseif i==sz(1)
            ca(i,j)=ga(i,j)+min([ca(i,j-1),ca(i-1,j-1)]);
        else
            ca(i,j)=ga(i,j)+min([ca(i,j-1),ca(i-1,j-1),ca(i+1,j-1)]);
        end 
    end
end

minimuma=ca(1,sz(2));
minra=1;
for i=2:sz(1)
    if minimuma>ca(i,sz(2))
        minimuma=ca(i,sz(2));
        minra=i;
    end
end
row=minra;
cfinal=ca;
value=(minimuma/sz(2));
