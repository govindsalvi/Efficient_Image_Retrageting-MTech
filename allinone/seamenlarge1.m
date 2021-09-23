clear all
t1=cputime;
I = load_images('eimage/tubingen');

sz=size(I);
ppp=200;
qqq=0;
%showinputfigures(I);

Z=zeros(sz(1)+ppp,sz(2)+qqq,sz(3),sz(4));

avgintensity=zeros(8,3);

R = exposure_fusion(I,[0 0 0]);
figure('Name','Result without seam removal'); 
imshow(R); 

% 
%colrin=zeros(pp+1);


L1=RGB2Lab(I(:,:,:,1));
L2=RGB2Lab(I(:,:,:,2));
L3=RGB2Lab(I(:,:,:,3));

a1=I(:,:,1,1);
b1=I(:,:,1,2);
c1=I(:,:,1,3);

a2=I(:,:,2,1);
b2=I(:,:,2,2);
c2=I(:,:,2,3);

a3=I(:,:,3,1);
b3=I(:,:,3,2);
c3=I(:,:,3,3);

    
a=L1;
b=L2;
c=L3;


qa=1;
qb=1;
qc=1;

[ga,gb,gc]=grad(a,b,c);

p=0;
q=0;


 while p<ppp && q<qqq    
     
 [ga,gb,gc]=grad(a,b,c);   
 [cx,col,mvc]=calmatcx1(ga,gb,gc,qa);
 [cy,row,mvr]=calmatcy1(ga,gb,gc,qa);
   if mvr<mvc
           qa=qa+1;
           [a,a1,a2,a3]=seamstretchl1(a,a1,a2,a3,cy,row);
           [b,b1,b2,b3]=seamstretchl1(b,b1,b2,b3,cy,row);
           [c,c1,c2,c3]=seamstretchl1(c,c1,c2,c3,cy,row);           
           p=p+1;
   else
            qa=qa+1;
           [a,a1,a2,a3]=seamstretchw1(a,a1,a2,a3,cx,col);
           [b,b1,b2,b3]=seamstretchw1(b,b1,b2,b3,cx,col);
           [c,c1,c2,c3]=seamstretchw1(c,c1,c2,c3,cx,col);
           q=q+1;
   end
 
 end
 
 if p<ppp
     while p~=ppp
           [ga,gb,gc]=grad(a,b,c);
           [cy,row,mv]=calmatcy1(ga,gb,gc,qa);
            qa=qa+1;
           [a,a1,a2,a3]=seamstretchl1(a,a1,a2,a3,cy,row);
           [b,b1,b2,b3]=seamstretchl1(b,b1,b2,b3,cy,row);
           [c,c1,c2,c3]=seamstretchl1(c,c1,c2,c3,cy,row);           
 p=p+1;
     end
 end
 if q<qqq
     while q~=qqq
          [ga,gb,gc]=grad(a,b,c);
          [cx,col,mv]=calmatcx1(ga,gb,gc,qa);
            qa=qa+1;
           [a,a1,a2,a3]=seamstretchw1(a,a1,a2,a3,cx,col);
           [b,b1,b2,b3]=seamstretchw1(b,b1,b2,b3,cx,col);
           [c,c1,c2,c3]=seamstretchw1(c,c1,c2,c3,cx,col);          
          q=q+1;
     end
 end

 Z(:,:,1,1)=a1;
 Z(:,:,1,2)=b1;
 Z(:,:,1,3)=c1;
 
 Z(:,:,2,1)=a2;
 Z(:,:,2,2)=b2;
 Z(:,:,2,3)=c2;
 
 
 Z(:,:,3,1)=a3;
 Z(:,:,3,2)=b3;
 Z(:,:,3,3)=c3;
 

  R = exposure_fusion(Z,[0 0 0]);
  
[ga,gb,gc]=grad(R(:,:,1),R(:,:,2),R(:,:,3));

% ga=RGB2Lab(R(:,:,1));
% gb=RGB2Lab(R(:,:,2));
% gc=RGB2Lab(R(:,:,3));

avgintensity(8,1)=avginten(ga);
avgintensity(8,2)=avginten(gb);
avgintensity(8,3)=avginten(gc);
figure('Name','Result with seam inserted'); 
imshow(R); 
t2=cputime;

ll=t2-t1;
ll