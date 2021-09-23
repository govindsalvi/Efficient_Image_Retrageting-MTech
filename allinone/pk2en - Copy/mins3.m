function [y] = mins3(a,i,b,j,c,k)
if a<b
    if a<c
        y=i;
    else
        y=k;
    end 
elseif c<b
    y=k;
else
    y=j;
end
end
