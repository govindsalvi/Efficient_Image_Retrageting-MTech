function [y]=laplace(a)
b=size(a);
c=zeros(b(1),b(2));
d=zeros(b(1),b(2));
l=zeros(b(1),b(2));
for i=2:(b(1)-1)
     for j=2:(b(2)-1)         
     c(i,j,1)=abs(a(i-1,j,1)+a(i+1,j,1)-2*a(i,j,1));
     d(i,j,1)=abs(a(i,j-1,1)+a(i,j+1,1)-2*a(i,j,1));
     l(i,j,1)=c(i,j,1)+d(i,j,1);
     end
end 
l(1,:)=1;
l(:,1)=1;
l(b(1),:)=1;
l(:,b(2))=1;
y=l;
%imshow(a);
%figure; imshow(l);
%figure; imshow(a);