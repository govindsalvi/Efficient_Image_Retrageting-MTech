function [sh] = mark_sheloette(E)
sh=zeros(size(E));
sz=size(E);
for i=2:(sz(1)-1)
    for j=2:(sz(2)-1)
        p=0;
        if E(i,j)>0
                        for l=i-1:(i+1)  
                            for k=(j-1):(j+1)
                                if E(l,k)>0
                                    p=p+1;
                                end
                            end
                        end
        
                        if p<7
                            sh(i,j)=1;
                        end      
        end
    end
end
% 
%         for i=2:sz(1)-1
%             for j=2:sz(2)-1
%                 if sh(i,j)>0
%                     sh(j-1)=1;
%                     sh(j+1)=1;
%                 end
%             end
%         end

end

