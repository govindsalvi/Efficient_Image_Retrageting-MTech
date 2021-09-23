clear all
t1=cputime;
I = load_images('eimage/beach');

sz=size(I);
ppp=300;
qqq=0;
%showinputfigures(I);

Z=zeros(sz(1)+ppp,sz(2)+qqq,sz(3));

avgintensity=zeros(8,3);

R = exposure_fusion(I,[0 0 0]);
figure('Name','Result without seam removal'); 
imshow(R); 

% 
%colrin=zeros(pp+1);


L1=RGB2Lab(R);


a1=R(:,:,1);
a2=R(:,:,2);
a3=R(:,:,3);

    
a=L1;


qa=1;

%

p=0;
q=0;


 while p<ppp && q<qqq    
     
 [ga]=gradcsum(a);   
 [cx,col,mvc]=calmatcxcsum(ga,qa);
 [cy,row,mvr]=calmatcycsum(ga,qa);
 
   if mvr<mvc
           qa=qa+1;
           [a,a1,a2,a3]=seamstretchl1(a,a1,a2,a3,cy,row);           
           p=p+1;
   else
            qa=qa+1;
           [a,a1,a2,a3]=seamstretchw1(a,a1,a2,a3,cx,col);
           q=q+1;
   end
 
 end
 
 if p<ppp
     while p~=ppp
           [ga]=gradcsum(a);
           [cy,row,mv]=calmatcycsum(ga,qa);
            qa=qa+1;
           [a,a1,a2,a3]=seamstretchl1(a,a1,a2,a3,cy,row);           
 p=p+1
     end
 end
 if q<qqq
     while q~=qqq
          [ga]=gradcsum(a);
          [cx,col,mv]=calmatcxcsum(ga,qa);
            qa=qa+1;
%            [d,d1,d2,d3]=seamstretchwshow(a,a1,a2,a3,cx,col);
%            siz=size(d1);
%            W=zeros(siz(1),siz(2),3);
%            W(:,:,1)=d1;
%            W(:,:,2)=d2;
%            W(:,:,3)=d3;
%            figure;imshow(W);
           [a,a1,a2,a3]=seamstretchw1(a,a1,a2,a3,cx,col);           
%            siz=size(a1);
%            W=zeros(siz(1),siz(2),3);
%            W(:,:,1)=a1;
%            W(:,:,2)=a2;
%            W(:,:,3)=a3;
%            figure;imshow(W);
          q=q+1
     end
 end

 Z(:,:,1)=a1;
 
 Z(:,:,2)=a2;
 
 
 Z(:,:,3)=a3;
 
 figure('Name','Result with seam inserted'); 
 imshow(Z); 

%  R = exposure_fusion(Z,[0 0 0]);
%   
% [ga,gb,gc]=grad(R(:,:,1),R(:,:,2),R(:,:,3));
% 
% % ga=RGB2Lab(R(:,:,1));
% % gb=RGB2Lab(R(:,:,2));
% % gc=RGB2Lab(R(:,:,3));
% 
% avgintensity(8,1)=avginten(ga);
% avgintensity(8,2)=avginten(gb);
% avgintensity(8,3)=avginten(gc);
% figure('Name','Result with seam inserted'); 
% imshow(R); 
t2=cputime;

ll=t2-t1;
ll