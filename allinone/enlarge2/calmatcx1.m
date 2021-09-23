function [cfinal,col,value] = calmatcx1(ga,gb,gc,q)
sz=size(ga);

ca=zeros(sz(1),sz(2));
cb=zeros(sz(1),sz(2));
cc=zeros(sz(1),sz(2));

for j=1:sz(2)
    ca(1,j)=ga(1,j);
    cb(1,j)=gb(1,j);
    cc(1,j)=gc(1,j);
end
%imshow(b);

for i=2:sz(1)
    for j=1:sz(2)
        if j==1
            ca(i,j)=ga(i,j)+min([ca(i-1,j),ca(i-1,j+1)]);
            cb(i,j)=gb(i,j)+min([cb(i-1,j),cb(i-1,j+1)]);
            cc(i,j)=gc(i,j)+min([cc(i-1,j),cc(i-1,j+1)]);
        elseif j==sz(2)
            ca(i,j)=ga(i,j)+min([ca(i-1,j),ca(i-1,j-1)]);
            cb(i,j)=gb(i,j)+min([cb(i-1,j),cb(i-1,j-1)]);
            cc(i,j)=gc(i,j)+min([cc(i-1,j),cc(i-1,j-1)]);
        else
            ca(i,j)=ga(i,j)+min([ca(i-1,j),ca(i-1,j-1),ca(i-1,j+1)]);
            cb(i,j)=gb(i,j)+min([cb(i-1,j),cb(i-1,j-1),cb(i-1,j+1)]);
            cc(i,j)=gc(i,j)+min([cc(i-1,j),cc(i-1,j-1),cc(i-1,j+1)]);
        end 
    end
end

sz=size(ca);

for j=1:sz(2)
    mva(j)=ca(sz(1),j);
    mca(j)=j;
    mvb(j)=cb(sz(1),j);
    mcb(j)=j;
    mvc(j)=cc(sz(1),j);
    mcc(j)=j;
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
        
        if mvb(j)>mvb(j+1)
            t=mvb(j);
            mvb(j)=mvb(j+1);
            mvb(j+1)=t;
            t=mcb(j);
            mcb(j)=mcb(j+1);
            mcb(j+1)=t; 
        end
        
        if mvc(j)>mvc(j+1)
            t=mvc(j);
            mvc(j)=mvc(j+1);
            mvc(j+1)=t;
            t=mcc(j);
            mcc(j)=mcc(j+1);
            mcc(j+1)=t; 
        end
    end
end

%mv=min([mva(q),mvb(q),mvc(q)]);
% if mv==mva(q)
%     cfinal=ca;
%     col=mca(q);
% elseif mv==mva(q)
%     cfinal=cb;
%     col=mcb(q);
% else
%     cfinal=cc;
%     col=mcc(q);
% end

col=adjust(mca(q),ca,mcb(q),cb,mcc(q),cc);
if col==mca(q)
    cfinal=ca;
    mv=mva(q);
elseif col==mcb(q)
    cfinal=cb;
    mv=mvb(q);
else
    cfinal=cc;
    mv=mvc(q);
end
value=mv/(sz(1));
