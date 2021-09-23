function [ga,gb,gc]=entropy(a,b,c)
 sz=size(a);
 gax=zeros(sz(1),sz(2));
 gbx=zeros(sz(1),sz(2));
 gcx=zeros(sz(1),sz(2));
 
 [counta,xa]=imhist(a,101);
 [countb,xb]=imhist(b,101);
 [countc,xc]=imhist(c,101);
 
  for i=1:sz(1)
      for j=1:sz(2)
          cpa=a(i,j);
          cpa=uint8(100*cpa);
          pa=counta(cpa+1);
          pa=(pa/(sz(1)*sz(2)));
      gax(i,j)=abs(-pa*log2(pa));
      cpb=b(i,j);
      cpb=uint8(100*cpb);
          pb=countb(cpb+1);
          pb=(pb/(sz(1)*sz(2)));
      gbx(i,j)=abs(-pb*log2(pb));
      cpc=c(i,j);
      cpc=uint8(100*cpc);
          pc=countc(cpc+1);
          pc=(pc/(sz(1)*sz(2)));
      gcx(i,j)=abs(-pc*log2(pc));
      end
  end 
 ga=gax;
 gb=gbx;
 gc=gcx;
