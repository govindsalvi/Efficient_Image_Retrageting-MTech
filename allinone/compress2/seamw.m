function [I,I2]=seamw(a,a1,c,minc)
sz=size(c);

res=zeros(sz(1),sz(2)-1);
I2=zeros(sz(1),sz(2)-1);
for i=1:sz(1)
    ii=sz(1)-i+1;
    for j=1:(minc-1)
        res(ii,j)=a(ii,j);
        I2(ii,j)=a1(ii,j);
    end
    for j=minc:(sz(2)-1)
        res(ii,j)=a(ii,j+1);
        I2(ii,j)=a1(ii,j+1);
    end    
    if ii~=1
    if minc==1
        minc=mins2(c(ii-1,1),1,c(ii-1,2),2);
    elseif minc==sz(2)
        minc=mins2(c(ii-1,sz(2)-1),sz(2)-1,c(ii-1,sz(2)),sz(2));
    else
        minc=mins3(c(ii-1,minc-1),minc-1,c(ii-1,minc),minc,c(ii-1,minc+1),minc+1);
    end  
    end
end
%a=res;
%end
I=mat2gray(res);
I2=mat2gray(I2);
%figure;imshow(I);

