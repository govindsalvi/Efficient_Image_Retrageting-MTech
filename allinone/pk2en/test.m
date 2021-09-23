a=[100 102 104 107;106 105 102 100;100 109 101 108;100 103 102 100];
for p=0:10
sz=size(a);
b=zeros(sz(1)-1,sz(2));
c=zeros(sz(1),sz(2));
for j=1:sz(2)
    for i=1:(sz(1)-1)
        b(i,j)=abs(a(i+1,j)-a(i,j));
    end
end
 sz=size(b);
for i=1:sz(1)
     c(i,1)=b(i,1);
end
%imshow(b);
% 
 for j=2:sz(2)
     for i=1:sz(1)
         if i==1
             c(i,j)=b(i,j)+max2(c(i,j-1),c(i+1,j-1));
         elseif i==sz(1)
             c(i,j)=b(i,j)+max2(c(i,j-1),c(i-1,j-1));
         else
             c(i,j)=b(i,j)+max3(c(i,j-1),c(i-1,j-1),c(i+1,j-1));
         end 
     end
 end
 maximum=c(1,sz(2));
 maxr=1;
 for i=2:sz(1)
     if maximum<c(i,sz(2))
         maximum=c(i,sz(2));
         maxr=i;
     end
 end

 maxr=maxr+1;
 sz=size(a);
 res=zeros(sz(1)+1,sz(2));

  for j=1:sz(2)
      jj=sz(2)-j+1;
      for i=1:maxr
          res(i,jj)=a(i,jj);
      end
      res(maxr+1,jj)=a(maxr,jj);
      for i=maxr+2:sz(1)+1;
          res(i,jj)=a(i-1,jj);
      end     
      if jj~=1
      if maxr==1
         maxr=maxs2(c(1,jj-1),1,c(2,jj-1),2);
      elseif maxr==sz(1)
          maxr=maxs2(c(sz(1),jj-1),sz(1),c(sz(1)-1,jj-1),sz(1)-1);
      else
          maxr=maxs3(c(maxr,jj-1),maxr,c(maxr-1,jj-1),maxr-1,c(maxr+1,jj-1),maxr+1);
      end  
      end
      maxr=maxr+1;
  end
  
 a=res;
 a
end
% % imshow(a);
% figure; imshow(res);