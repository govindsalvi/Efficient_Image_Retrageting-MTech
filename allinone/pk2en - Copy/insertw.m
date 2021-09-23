function [mva,mca] = insertw(ca)

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





% 
% minimuma=ca(sz(1),1);
% minimumb=cb(sz(1),1);
% minimumc=cc(sz(1),1);
% minca=1;
% mincb=1;
% mincc=1;
% for j=2:sz(2)
%     if minimuma>ca(sz(1),j)
%         minimuma=ca(sz(1),j);
%         minca=j;
%     end
%     if minimumb>cb(sz(1),j)
%         minimumb=cb(sz(1),j);
%         mincb=j;
%     end
%     if minimumc>cc(sz(1),j)
%         minimumc=cc(sz(1),j);
%         mincc=j;
%     end
% end
% 
% value=min3(minimuma,minimumb,minimumc);
% %minarr=[minimuma minimumb minimumc];
% %value=max(minarr);
% 
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
% value=(value/sz(1));
