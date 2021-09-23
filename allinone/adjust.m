function [col] = adjust(col1,ca,col2,cb,col3,cc)

sz=size(ca);

v1=ca(sz(1),col1)+cb(sz(1),col1)+cc(sz(1),col1);
v2=ca(sz(1),col2)+cb(sz(1),col2)+cc(sz(1),col2);
v3=ca(sz(1),col3)+cb(sz(1),col3)+cc(sz(1),col3);

col=mins3(v1,col1,v2,col2,v3,col3);

end

