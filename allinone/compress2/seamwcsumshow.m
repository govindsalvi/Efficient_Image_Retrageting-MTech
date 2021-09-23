function [I,I1,I2,I3]=seamwcsumshow(a,a1,b1,c1,c,minc)
sz=size(c);
res=zeros(sz(1),sz(2));
I1=zeros(sz(1),sz(2));
I2=zeros(sz(1),sz(2));
I3=zeros(sz(1),sz(2));
for i=1:sz(1)
    ii=sz(1)-i+1;
    for j=1:(minc-1)
        res(ii,j)=a(ii,j);
        I1(ii,j)=a1(ii,j);
        I2(ii,j)=b1(ii,j);
        I3(ii,j)=c1(ii,j);
    end
    res(ii,minc)=0;
    I1(ii,minc)=1;
    I2(ii,minc)=0;
    I3(ii,minc)=0;
    for j=minc+1:(sz(2))
        res(ii,j)=a(ii,j);
        I1(ii,j)=a1(ii,j);
        I2(ii,j)=b1(ii,j);
        I3(ii,j)=c1(ii,j);
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

I=res;
I1=I1;
I2=I2;
I3=I3;

% I=mat2gray(res);
% I1=mat2gray(I1);
% I2=mat2gray(I2);
% I3=mat2gray(I3);

