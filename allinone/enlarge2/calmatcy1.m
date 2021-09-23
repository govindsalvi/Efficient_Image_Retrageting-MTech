function [cfinal,row,value] = calmatcy1(ga,gb,gc,q)
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
            ca(i,j)=ga(i,j)+min([ca(i,j-1),ca(i+1,j-1)]);
            cb(i,j)=gb(i,j)+min([cb(i,j-1),cb(i+1,j-1)]);
            cc(i,j)=gc(i,j)+min([cc(i,j-1),cc(i+1,j-1)]);
        elseif i==sz(1)
            ca(i,j)=ga(i,j)+min([ca(i,j-1),ca(i-1,j-1)]);
            cb(i,j)=gb(i,j)+min([cb(i,j-1),cb(i-1,j-1)]);
            cc(i,j)=gc(i,j)+min([cc(i,j-1),cc(i-1,j-1)]);
        else
            ca(i,j)=ga(i,j)+min([ca(i,j-1),ca(i-1,j-1),ca(i+1,j-1)]);
            cb(i,j)=gb(i,j)+min([cb(i,j-1),cb(i-1,j-1),cb(i+1,j-1)]);
            cc(i,j)=gc(i,j)+min([cc(i,j-1),cc(i-1,j-1),cc(i+1,j-1)]);
        end 
    end
end


sz=size(ca);

for i=1:sz(1)
    mva(i)=ca(i,sz(2));
    mra(i)=i;
    
    mvb(i)=cb(i,sz(2));
    mrb(i)=i;
    
    mvc(i)=cc(i,sz(2));
    mrc(i)=i;
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
        if mvb(j)>mvb(j+1)
            t=mvb(j);
            mvb(j)=mvb(j+1);
            mvb(j+1)=t;
            
            t=mrb(j);
            mrb(j)=mrb(j+1);
            mrb(j+1)=t; 
        end
        if mvc(j)>mvc(j+1)
            t=mvc(j);
            mvc(j)=mvc(j+1);
            mvc(j+1)=t;
            
            t=mrc(j);
            mrc(j)=mrc(j+1);
            mrc(j+1)=t; 
        end
    end
end

% mv=min([mva(q),mvb(q),mvc(q)]);
% 
% if mv==mva(q)
%     cfinal=ca;
%     row=mra(q);
% elseif mv==mva(q)
%     cfinal=cb;
%     row=mrb(q);
% else
%     cfinal=cc;
%     row=mrc(q);
% end


row=adjust(mra(q),ca,mrb(q),cb,mrc(q),cc);
if row==mra(q)
    cfinal=ca;
    mv=mva(q);
elseif row==mrb(q)
    cfinal=cb;
    mv=mvb(q);
else
    cfinal=cc;
    mv=mvc(q);
end
value=mv/(sz(2));
