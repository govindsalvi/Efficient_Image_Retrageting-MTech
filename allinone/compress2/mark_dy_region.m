function [I2,EE] =mark_dy_region(I1,I2,w,MATC,imageid)
        EE=zeros(size(I1,1),size(I1,2));
        for i=1:w
            for j=1:w
                for c=1:3
                    
                    
                     if imageid==2
                         intensity=MATC(1,1)*(I1(i,j,c)^4) + MATC(2,1)*(I1(i,j,c)^3) + MATC(3,1)*(I1(i,j,c)^2) + MATC(4,1)*I1(i,j,c) + MATC(5,1) ;
                     elseif imageid==3
                        intensity=MATC(1,2)*I1(i,j,c)^4 + MATC(2,2)*I1(i,j,c)^3 + MATC(3,2)*I1(i,j,c)^2 + MATC(4,2)*I1(i,j,c) +MATC(5,2); 
                     elseif imageid==4
                         intensity=+MATC(1,3)*I1(i,j,c)^4 +MATC(2,3)*I1(i,j,c)^3 +MATC(3,3)*I1(i,j,c)^2 +MATC(4,3)*I1(i,j,c) +MATC(5,3); 
                     elseif imageid==5
                         intensity= MATC(1,4)*I1(i,j,c)^4 + MATC(2,4)*I1(i,j,c)^3 +MATC(3,4)*I1(i,j,c)^2 + MATC(4,4)*I1(i,j,c) +MATC(5,4); 
                     end
                I2(i,j,c)=intensity;
                EE(i,j)=1;
                %I2(ii,jj,c)=0;
                end
            end
        end

end

