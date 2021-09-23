function [L] = checkdy(I1,I2,V,maxv,MATC,imageid)
   
         w=size(I1,1);
         p=0;
         m=imageid-1;
         
         for i=1:w
             for j=1:w
                 if V(i,j) < maxv
                        l= I2(i,j)- MATC(1,m)*(I1(i,j)^4) - MATC(2,m)*(I1(i,j)^3) -MATC(3,m)*(I1(i,j)^2) - MATC(4,m)*I1(i,j) -MATC(5,m) ;
                        if l>=-0.2 && l<=0.2
                        p=p+1;
                        end     
                 end
             end
         end
         
         friction_static=p/(w*w);         
         if friction_static < .75
             L=1;
         else
             L=0;
         end
         
end

