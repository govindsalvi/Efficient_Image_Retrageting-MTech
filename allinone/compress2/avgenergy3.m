function [avgin1,avgin2,avgin3]=avgenergy3(grad1,grad2,grad3)
%grad=uint8(255*grad);
i=double(grad1);
j=double(grad2);
k=double(grad3);
[r,c]=size(i);
l1=sum(i,2);
l1=sum(l1);


l2=sum(j,2);
l2=sum(l2);


l3=sum(k,2);
l3=sum(l3);

avgin1=((l1/((r-1)*(c-1))));
avgin2=((l2/((r-1)*(c-1))));
avgin3=((l3/((r-1)*(c-1))));

