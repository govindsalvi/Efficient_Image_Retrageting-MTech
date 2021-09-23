function [mva,mra] = insertl(ca)

sz=size(ca);

for i=1:sz(1)
    mva(i)=ca(i,sz(2))/sz(1);
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
