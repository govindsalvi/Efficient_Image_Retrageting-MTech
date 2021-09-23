function [cfinal,col,value] = calmatcx(ga,gb,gc)
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
            ca(i,j)=ga(i,j)+min([ca(i-1,j-1),ca(i-1,j)]);
            cb(i,j)=gb(i,j)+min([cb(i-1,j-1),cb(i-1,j)]);
            cc(i,j)=gc(i,j)+min([cc(i-1,j-1),cc(i-1,j)]);
        else
            ca(i,j)=ga(i,j)+min([ca(i-1,j-1),ca(i-1,j),ca(i-1,j+1)]);
            cb(i,j)=gb(i,j)+min([cb(i-1,j-1),cb(i-1,j),cb(i-1,j+1)]);
            cc(i,j)=gc(i,j)+min([cc(i-1,j-1),cc(i-1,j),cc(i-1,j+1)]);
        end 
    end
end

minimuma=ca(sz(1),1);
minimumb=cb(sz(1),1);
minimumc=cc(sz(1),1);
minca=1;
mincb=1;
mincc=1;
for j=2:sz(2)
    if minimuma>ca(sz(1),j)
        minimuma=ca(sz(1),j);
        minca=j;
    end
    if minimumb>cb(sz(1),j)
        minimumb=cb(sz(1),j);
        mincb=j;
    end
    if minimumc>cc(sz(1),j)
        minimumc=cc(sz(1),j);
        mincc=j;
    end
end

col=adjust(minca,ca,mincb,cb,mincc,cc);

%value=min([minimuma,minimumb,minimumc]);
%value=median([minimuma,minimumb,minimumc]);
%minarr=[minimuma minimumb minimumc];
%value=max(minarr);

% if value==minimuma
%     cfinal=ca;
%     col=minca;
% elseif value==minimumb
%     cfinal=cb;
%     col=mincb;
%      
% elseif value==minimumc
%     cfinal=cc;
%     col=mincc;
% end
% 
% value=(value/sz(1));

if col==minca
    cfinal=ca;
    value=minimuma;
elseif col==mincb
    cfinal=cb;
    value=minimumb;
else
    cfinal=cc;
    value=minimumc;
end
value=(value/sz(1));
