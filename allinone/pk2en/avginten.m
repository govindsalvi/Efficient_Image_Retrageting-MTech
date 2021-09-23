function [avgin]=avginten(grad)
%grad=uint8(255*grad);
i=double(grad);
[r,c]=size(i);
l=sum(i,2);
l=sum(l);
avgin=((l/(r*c)));

