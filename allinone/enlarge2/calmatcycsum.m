function [cfinal,row,value] = calmatcycsum(ga,q)
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
            ca(i,j)=ga(i,j)+min([ca(i-1,j-1),ca(i,j-1)]);
        else
            ca(i,j)=ga(i,j)+min([ca(i-1,j-1),ca(i,j-1),ca(i+1,j-1)]);
        end 
    end
end


sz=size(ca);

for i=1:sz(1)
    mva(i)=ca(i,sz(2));
    mra(i)=i;
    
end

t=0;
for i=1:sz(1)
    for j=1:sz(1)-1
        if mva(j)>mva(j+1)
            t=mva(j);
            mva(j)=mva(j+1);
            mva(j+1)=t;
            
            t=mra(j);
            mra(j)=mra(j+1);
            mra(j+1)=t; 
        end
    end
end
row=mra(q);
cfinal=ca;
value=mva(q)/sz(2);


