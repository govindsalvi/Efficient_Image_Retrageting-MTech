function [L] = checkdy(I1,I2,V,maxv,MATC)
   
         w=size(I1,1);
         p=0;
         
  
%yy = p1*x^4 + p2*x^3 +
 %     p3*x^2 + p4*x +
  %    p5 
  
  q=1;
  
         for i=1:w
             for j=1:w
                 if V(i,j) < maxv
                    l= I2(i,j)- MATC(1,1)*(I1(i,j)^4) - MATC(2,1)*(I1(i,j)^3) -MATCON(3,1)*(I1(i,j)^2) - MATC(4,1)*I1(i,j) -MATC(5,1) ;
                    if l>=-.04 && l<=.04
                     p=p+1;
                    end     
                 end
             end
         end
         
         friction_static=p/(w*w);
         
         if friction_static < 0.75
             L=1;
         else
             L=0;
         end
         
end

