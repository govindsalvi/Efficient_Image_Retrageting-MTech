function F=focuse(a)
L=laplace(a);
L=double(L)/255;


F=zeros(size(L));
sz=size(F);

window=3;

for i=(1+window):sz(1)-window
    for j=(1+window):sz(2)-window
            
            for u=-window:window
                for v=-window:window
                    F(i,j)=F(i,j)+L(i-u,j-v);
                end
            end
        
    end
end
%F=F./max(max(F));

The=max(max(F))/2;

% for i=1:sz(1)
%     for j=1:sz(2)
%         if F(i,j)<The
%             F(i,j)=0;
%         end
%     end
% end
end