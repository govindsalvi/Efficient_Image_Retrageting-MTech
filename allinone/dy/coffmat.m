function [M] = coffmat()

  MATC=zeros(5,4);
  
  % Constants for image 2
  MATC(1,1)= 0.93768;
  MATC(2,1)= -1.419;
  MATC(3,1)= 0.23317;
  MATC(4,1)= 1.3008;
  MATC(5,1)= 0.020849;
  
  % Constants for image 3
  MATC(1,2)= 0.96786;
  MATC(2,2)= -1.3296;
  MATC(3,2)= -0.75591;
  MATC(4,2)= 2.0957;
  MATC(5,2)= 0.061604;

  % Constants for image 4
  
  MATC(1,3)= 1.0065;
  MATC(2,3)= 0.33957;
  MATC(3,3)= -3.5355;
  MATC(4,3)= 3.0795;
  MATC(5,3) = 0.11999;
  
  % Constants for image 5
  
  
  MATC(1,4)= -6.2082;
  MATC(2,4)= 14.79;
  MATC(3,4)= -13.093;
  MATC(4,4)= 5.1674;
  MATC(5,4)= 0.22424;
  
 M=MATC;
end

