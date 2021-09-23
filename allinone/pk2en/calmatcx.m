function [ca] = calmatcx(ga)

sz=size(ga);
ca=zeros(sz(1),sz(2));

for j=1:sz(2)
    ca(1,j)=ga(1,j);
end
%imshow(b);

for i=2:sz(1)
    for j=1:sz(2)
        if j==1
            ca(i,j)=ga(i,j)+min2(ca(i-1,j),ca(i-1,j+1));
        elseif j==sz(2)
            ca(i,j)=ga(i,j)+min2(ca(i-1,j),ca(i-1,j-1));
        else
            ca(i,j)=ga(i,j)+min3(ca(i-1,j),ca(i-1,j-1),ca(i-1,j+1));
        end 
    end
end
ca=ca;


% mincolarra=zeros(sz(2));
% mincolvala=zeros(sz(2));
% 
% mincolarrb=zeros(sz(2));
% mincolvalb=zeros(sz(2));
% 
% mincolarrc=zeros(sz(2));
% mincolvalc=zeros(sz(2));
% 
% for j=1:sz(2)
%     mincolvala(j)=ca(sz(1),j);
%     mincolarra(j)=j;
%     mincolvalb(j)=cb(sz(1),j);
%     mincolarrb(j)=j;
%     mincolvalc(j)=cc(sz(1),j);
%     mincolarrc(j)=j;
% end
% t=0;
% for i=1:sz(2)
%     for j=1:sz(2)-1
%         if mincolvala(j)>mincolvala(j+1)
%             t=mincolvala(j);
%             mincolvala(j)=mincolvala(j+1);
%             mincolvala(j+1)=t;
%             t=mincolarra(j);
%             mincolarra(j)=mincolarra(j+1);
%             mincolarra(j+1)=t;
%             
%         end
%         if mincolvalb(j)>mincolvalb(j+1)
%             t=mincolvalb(j);
%             mincolvalb(j)=mincolvalb(j+1);
%             mincolvalb(j+1)=t;
%             t=mincolarrb(j);
%             mincolarrb(j)=mincolarrb(j+1);
%             mincolarrb(j+1)=t;
%             
%         end
%         if mincolvalc(j)>mincolvalc(j+1)
%             t=mincolvalc(j);
%             mincolvalc(j)=mincolvalc(j+1);
%             mincolvalc(j+1)=t;
%             t=mincolarrc(j);
%             mincolarrc(j)=mincolarrc(j+1);
%             mincolarrc(j+1)=t;
%             
%         end
%     end
% end
% mincvarra=mincolvala;
% minca=mincolarra;
% 
% mincvarrb=mincolvalb;
% mincb=mincolarrb;
% 
% mincvarrc=mincolvalc;
% mincc=mincolarrc;
% 
% % minimuma=ca(sz(1),1);
% % minimumb=cb(sz(1),1);
% % minimumc=cc(sz(1),1);
% % minca=1;
% % mincb=1;
% % mincc=1;
% % for j=2:sz(2)
% %     if minimuma>ca(sz(1),j)
% %         minimuma=ca(sz(1),j);
% %         minca=j;
% %     end
% %     if minimumb>cb(sz(1),j)
% %         minimumb=cb(sz(1),j);
% %         mincb=j;
% %     end
% %     if minimumc>cc(sz(1),j)
% %         minimumc=cc(sz(1),j);
% %         mincc=j;
% %     end
% % end
% % 
% % value=min3(minimuma,minimumb,minimumc);
% % %minarr=[minimuma minimumb minimumc];
% % %value=max(minarr);
% % 
% % if value==minimuma
% %     cfinal=ca;
% %     col=minca;
% % elseif value==minimumb
% %     cfinal=cb;
% %     col=mincb;
% %     
% % elseif value==minimumc
% %     cfinal=cc;
% %     col=mincc;
% % end
% % value=(value/sz(1));
