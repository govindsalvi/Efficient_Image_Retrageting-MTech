function [I2,EE] =mark_dy_region(I1,I2,w,MATC,imageid)
        EE=zeros(size(I1,1),size(I1,2));
        for i=1:w
            for j=1:w
                    m=imageid-1;
                    %intensity=MATC(1,m).*(I1(i,j,:).^4) + MATC(2,m).*(I1(i,j,:).^3) + MATC(3,m).*(I1(i,j,:).^2) + MATC(4,m).*I1(i,j,:) + MATC(5,m) ;
                    intensity=I1(i,j,:);
                    I2(i,j,:)=intensity;
                    EE(i,j)=1;
            end
        end

end

