function [col] = adjust(col1,c1,col2,c2,col3,c3)
sz=size(c1);
v1=c1(sz(1),col1)+c2(sz(1),col1)+c3(sz(1),col1);
v2=c1(sz(1),col2)+c2(sz(1),col2)+c3(sz(1),col2);
v3=c1(sz(1),col3)+c2(sz(1),col3)+c3(sz(1),col3);

col=mins3(v1,col1,v2,col2,v3,col3);

end

