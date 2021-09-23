I = load_images('new');

sz=size(I);

RR1=zeros(sz(1),sz(2),3);

    for i=1:window:sz(1)
            for j=1:window:sz(2)
                
                    for c=1:3
                         RR1(i:(i+window-1),j:(j+window-1-1),c)=gradxy(I(i:(i+window-1),j:(j+window-1),c,1));
                    end
        
            end        
    end    
    