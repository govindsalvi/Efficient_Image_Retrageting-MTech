function [y] = min3(a,b,c)
if a<b
    if a<c
        y=a;
    else
        y=c;
    end 
elseif c<b
    y=c;
else
    y=b;
end
end