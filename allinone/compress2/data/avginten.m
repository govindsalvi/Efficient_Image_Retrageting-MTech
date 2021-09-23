function [avgin]=avginten(a)
grad=grad1(a);
%grad=uint8(255*grad);
%i=double(grad);
[r,c]=size(grad);
l=sum(grad,2);
l=sum(l);
avgin=((l/((r-1)*(c-1))));

