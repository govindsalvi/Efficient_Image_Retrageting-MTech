function [cfinal,col,value] = calmatcxcompress(ga)
sz=size(ga);
ca=zeros(sz(1),sz(2));
for j=1:sz(2)
    ca(1,j)=ga(1,j);
end


for i=2:sz(1)
    for j=1:sz(2)
        if j==1
            ca(i,j)=ga(i,j)+min([ca(i-1,j),ca(i-1,j+1)]);
        elseif j==sz(2)
            ca(i,j)=ga(i,j)+min([ca(i-1,j),ca(i-1,j-1)]);
        else
            ca(i,j)=ga(i,j)+min([ca(i-1,j),ca(i-1,j-1),ca(i-1,j+1)]);
        end 
    end
end

minimuma=ca(sz(1),1);
minca=1;
for j=2:sz(2)
    if minimuma>ca(sz(1),j)
        minimuma=ca(sz(1),j);
        minca=j;
    end
end
cfinal=ca;
col=minca;
value=(minimuma/sz(1));
