clear all
I = load_images('house');

%sz=size(I);
ppp=0;
qqq=0;
%showinputfigures(I);

%Z=zeros(sz(1)-ppp,sz(2)-qqq,sz(3),sz(4));
avgintensity=zeros(8,3);
R = exposure_fusion(I,[0 0 0]);
[ga,gb,gc]=grad(R(:,:,1),R(:,:,2),R(:,:,3));

avgintensity(7,1)=avginten(ga);
avgintensity(7,2)=avginten(gb);
avgintensity(7,3)=avginten(gc);
figure('Name','Result without seam removal'); 
imshow(R); 
sz=size(R);
Z=zeros(sz(1)-ppp,sz(2)-qqq,sz(3));
% 


%colrin=zeros(pp+1);
for qq=1:sz(3)

a1=R(:,:,qq);
    
a=RGB2Lab(R);


% [ga,gb,gc]=grad(a,b,c);
% avgintensity(1,qq)=avginten(ga);
% avgintensity(2,qq)=avginten(gb);
% avgintensity(3,qq)=avginten(gc);
p=0;
q=0;
 while p<ppp && q<qqq    
 [ga,gb,gc]=grad(a,b,c);   
 [cy,row,minvr]=calmatcy(ga,gb,gc);
 [cx,col,minvc]=calmatcx(ga,gb,gc);
 if minvc<minvr
     a=seamw(a,cx,col);
     b=seamw(b,cx,col);
     c=seamw(c,cx,col);    
     q=q+1;
 else
     a=seaml(a,cy,row);
     b=seaml(b,cy,row);
     c=seaml(c,cy,row);
     p=p+1;
 end
 end
 
 if p<ppp
     while p~=ppp
 [ga,gb,gc]=grad(a,b,c);   
 [finalc,row]=calmatcy(ga,gb,gc);
 a=seaml(a,finalc,row);
 b=seaml(b,finalc,row);
 c=seaml(c,finalc,row);
 p=p+1;
     end
 end
 if q<qqq
     while q~=qqq
          [ga,gb,gc]=grad(a,a,a);   
          [finalc,col]=calmatcx(ga);
          [a,a1]=seamw(a,a1,finalc,col);
          q=q+1;
     end
 end
       
 Z(:,:,qq)=a1;
 
% avgintensity(4,qq)=avginten(ga);
% avgintensity(5,qq)=avginten(gb);
% avgintensity(6,qq)=avginten(gc);
end
% % 
%   R = exposure_fusion(Z,[0 0 0]);
% [ga,gb,gc]=grad(R(:,:,1),R(:,:,2),R(:,:,3));
% avgintensity(8,1)=avginten(ga);
% avgintensity(8,2)=avginten(gb);
% avgintensity(8,3)=avginten(gc);
figure('Name','Result with seam removed'); 
imshow(Z); 
