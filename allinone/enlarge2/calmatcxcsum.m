function [cfinal,col,value] = calmatcxcsum(ga,q)
sz=size(ga);

ca=zeros(sz(1),sz(2));
for j=1:sz(2)
    ca(1,j)=ga(1,j);
end
%imshow(b);

for i=2:sz(1)
    for j=1:sz(2)
        if j==1
            ca(i,j)=ga(i,j)+min([ca(i-1,j),ca(i-1,j+1)]);
            
        elseif j==sz(2)
            ca(i,j)=ga(i,j)+min([ca(i-1,j-1),ca(i-1,j)]);
            
        else
            ca(i,j)=ga(i,j)+min([ca(i-1,j-1),ca(i-1,j),ca(i-1,j+1)]);
            
        end 
    end
end

sz=size(ca);

for j=1:sz(2)
    mva(j)=ca(sz(1),j);
    mca(j)=j;
end

t=0;
for i=1:sz(2)
    for j=1:sz(2)-1
        if mva(j)>mva(j+1)
            t=mva(j);
            mva(j)=mva(j+1);
            mva(j+1)=t;
            t=mca(j);
            mca(j)=mca(j+1);
            mca(j+1)=t; 
        end
    end
end

col=mca(q);
value=mva(q)/sz(1);
cfinal=ca;
