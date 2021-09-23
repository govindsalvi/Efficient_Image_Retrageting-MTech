function [L] = checkdy(I1,I2,V,maxv,MATC,imageid)
   
         w=size(I1,1);
         p=0;
         
  
%yy = p1*x^4 + p2*x^3 +
 %     p3*x^2 + p4*x +
  %    p5 
  
  q=1;
  
         for i=1:w
             for j=1:w
                 if V(i,j) < maxv
                     if imageid==2
                         l= I2(i,j)- MATC(1,1)*(I1(i,j)^4) - MATC(2,1)*(I1(i,j)^3) -MATC(3,1)*(I1(i,j)^2) - MATC(4,1)*I1(i,j) -MATC(5,1) ;
                     elseif imageid==3
                        l=I2(i,j) - MATC(1,2)*I1(i,j)^4 - MATC(2,2)*I1(i,j)^3 -MATC(3,2)*I1(i,j)^2 - MATC(4,2)*I1(i,j) -MATC(5,2); 
                     elseif imageid==4
                         l=I2(i,j) - MATC(1,3)*I1(i,j)^4 - MATC(2,3)*I1(i,j)^3 -MATC(3,3)*I1(i,j)^2 - MATC(4,3)*I1(i,j) -MATC(5,3); 
                     elseif imageid==5
                         l=I2(i,j) - MATC(1,4)*I1(i,j)^4 - MATC(2,4)*I1(i,j)^3 -MATC(3,4)*I1(i,j)^2 - MATC(4,4)*I1(i,j) -MATC(5,4); 
                     end
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

