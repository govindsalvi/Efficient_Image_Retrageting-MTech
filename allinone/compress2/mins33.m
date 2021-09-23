function [y,y1] = mins33(a,i,b,j,c,k)
if a<b
    if a<c
        y=a;
        y1=i;
    else
        y=c;
        y1=k;
    end 
elseif c<b
    y=c;
    y1=k;
else
    y=b;
    y1=j;
end
end
