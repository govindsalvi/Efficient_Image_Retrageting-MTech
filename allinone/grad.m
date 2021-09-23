function [ga,gb,gc]=grad(a,b,c)
 sz=size(a);
 gax=zeros(sz(1),sz(2));
 gbx=zeros(sz(1),sz(2));
 gcx=zeros(sz(1),sz(2));
 gay=zeros(sz(1),sz(2));
 gby=zeros(sz(1),sz(2));
 gcy=zeros(sz(1),sz(2));
  for i=1:sz(1)
      for j=1:(sz(2)-1)
      gax(i,j)=abs(a(i,j)-a(i,j+1));
      gbx(i,j)=abs(b(i,j)-b(i,j+1));
      gcx(i,j)=abs(c(i,j)-c(i,j+1));
      end
 end 
 
for j=1:sz(2)
      for i=1:(sz(1)-1)
      gay(i,j)=abs(a(i,j)-a(i+1,j));
      gby(i,j)=abs(b(i,j)-b(i+1,j));
      gcy(i,j)=abs(c(i,j)-c(i+1,j));
      end
end 
ga=gax+gay;
gb=gbx+gby;
gc=gcx+gcy;


ga(:,sz(2))=1;
ga(sz(1),:)=1;
gb(:,sz(2))=1;
gb(sz(1),:)=1;
gc(:,sz(2))=1;
gc(sz(1),:)=1;
end
