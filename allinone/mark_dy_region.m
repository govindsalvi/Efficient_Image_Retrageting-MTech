function [I2] =mark_dy_region(I1,I2,w)


  p1 = 0.93768;
  p2 = -1.419;
  p3 = 0.23317;
  p4 = 1.3008;
  p5 = 0.020849;
  
  


        for ii=1:w
            for jj=1:w
                for c=1:3
                intensity=p1*I1(ii,jj,c)^4 + p2*I1(ii,jj,c)^3+p3*I1(ii,jj,c)^2 + p4*I1(ii,jj,c) +p5 ;
                %I2(ii,jj,c)=intensity;
                I2(ii,jj,c)=0;
                end
            end
        end

end

