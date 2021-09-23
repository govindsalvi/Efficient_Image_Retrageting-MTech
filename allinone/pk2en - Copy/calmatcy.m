function [cfinal,row,value] = calmatcy(ga,gb,gc)
sz=size(ga);
ca=zeros(sz(1),sz(2));
cb=zeros(sz(1),sz(2));
cc=zeros(sz(1),sz(2));

for i=1:sz(1)
    ca(i,1)=ga(i,1);
    cb(i,1)=gb(i,1);
    cc(i,1)=gc(i,1);
end

for j=2:sz(2)
    for i=1:sz(1)
        if i==1
            ca(i,j)=ga(i,j)+min2(ca(i,j-1),ca(i+1,j-1));
            cb(i,j)=gb(i,j)+min2(cb(i,j-1),cb(i+1,j-1));
            cc(i,j)=gc(i,j)+min2(cc(i,j-1),cc(i+1,j-1));
        elseif i==sz(1)
            ca(i,j)=ga(i,j)+min2(ca(i,j-1),ca(i-1,j-1));
            cb(i,j)=gb(i,j)+min2(cb(i,j-1),cb(i-1,j-1));
            cc(i,j)=gc(i,j)+min2(cc(i,j-1),cc(i-1,j-1));
        else
            ca(i,j)=ga(i,j)+min3(ca(i,j-1),ca(i-1,j-1),ca(i+1,j-1));
            cb(i,j)=gb(i,j)+min3(cb(i,j-1),cb(i-1,j-1),cb(i+1,j-1));
            cc(i,j)=gc(i,j)+min3(cc(i,j-1),cc(i-1,j-1),cc(i+1,j-1));
        end 
    end
end

minimuma=ca(1,sz(2));
minimumb=cb(1,sz(2));
minimumc=cc(1,sz(2));
minra=1;
minrb=1;
minrc=1;
for i=2:sz(1)
    if minimuma>ca(i,sz(2))
        minimuma=ca(i,sz(2));
        minra=i;
    end
    if minimumb>cb(i,sz(2))
        minimumb=cb(i,sz(2));
        minrb=i;
    end
    if minimumc>cc(i,sz(2))
        minimumc=cc(i,sz(2));
        minrc=i;
    end
end

value=min3(minimuma,minimumb,minimumc);
%minarr=[minimuma minimumb minimumc];
%value=max(minarr);

if value==minimuma
    cfinal=ca;
    row=minra;
elseif value==minimumb
    cfinal=cb;
    row=minrb;
elseif value==minimumc
    cfinal=cc;
    row=minrc;
end
value=(value/sz(2));

