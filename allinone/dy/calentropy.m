function [E] = calentropy(a)
if size(a,3)~=1
a=rgb2gray(a);
end
count=zeros(256,1);
totalp=size(a,1)*size(a,2);
sz=size(a);
for i=1:sz(1)
    for j=1:sz(2)
        count(a(i,j)+1,1)=count(a(i,j)+1,1)+1;        
    end
end
E=0;
for i=1:256
    if count(i,1)~=0
    E=E-(count(i,1)/totalp)*log2((count(i,1)/totalp));
    end
end



