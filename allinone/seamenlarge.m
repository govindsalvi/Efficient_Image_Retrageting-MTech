clear all
t1=cputime;
I = load_images('house');

sz=size(I);
ppp=5;
qqq=5;
%showinputfigures(I);

Z=zeros(sz(1)+ppp,sz(2)+qqq,sz(3),sz(4));

avgintensity=zeros(8,3);

R = exposure_fusion(I,[0 0 0]);
[ga,gb,gc]=grad(R(:,:,1),R(:,:,2),R(:,:,3));

% ga=RGB2Lab(R(:,:,1));
% gb=RGB2Lab(R(:,:,2));
% gc=RGB2Lab(R(:,:,3));

 avgintensity(7,1)=avginten(ga);
 avgintensity(7,2)=avginten(gb);
 avgintensity(7,3)=avginten(gc);
figure('Name','Result without seam removal'); 
imshow(R); 

% 
%colrin=zeros(pp+1);

L1=RGB2Lab(I(:,:,:,1));
L2=RGB2Lab(I(:,:,:,2));
L3=RGB2Lab(I(:,:,:,3));

for qq=1:sz(3)


a1=I(:,:,qq,1);
b1=I(:,:,qq,2);
c1=I(:,:,qq,3);

a=L1;
b=L2;
c=L3;

% 
% a1=R(:,:,qq);
% b1=R(:,:,qq);
% c1=R(:,:,qq);
% 
% a=RGB2Lab(R);
% b=RGB2Lab(R);
% c=RGB2Lab(R);


qa=1;
qb=1;
qc=1;

 [ga,gb,gc]=grad(a,b,c);

 avgintensity(1,qq)=avginten(ga);
 avgintensity(2,qq)=avginten(gb);
 avgintensity(3,qq)=avginten(gc);
p=0;
q=0;


 while p<ppp && q<qqq    
 [ga,gb,gc]=grad(a,b,c);   
 
 [ca1,cb1,cc1]=calmatcy(ga,gb,gc);
 [ca2,cb2,cc2]=calmatcx(ga,gb,gc);
 
 [mva1,mra]=insertl(ca1);
 [mvb1,mrb]=insertl(cb1);
 [mvc1,mrc]=insertl(cc1);
 
 
 [mva2,mca]=insertw(ca2);
 [mvb2,mcb]=insertw(cb2);
 [mvc2,mcc]=insertw(cc2);
 
 mv1=median([mva1(1),mvb1(1),mvc1(1)]);
 mv2=median([mva2(1),mvb2(1),mvc2(1)]);
 
            if mv1<mv2
                
               if mv1==mva1(1)
               finalc=ca1;
               mr=mra(1);
              elseif mv1==mvb1(1)
               finalc=cb1;
               mr=mrb(1);
              else
               finalc=cc1;
               mr=mrc(1);
               end
               [a,a1]=seamstretchl(a,a1,finalc,mr);
               [b,b1]=seamstretchl(b,b1,finalc,mr);
               [c,c1]=seamstretchl(c,c1,finalc,mr);
          
               
             p=p+1;   
                
            elseif mv1>=mv2
                
               if mv2==mva2(1)
               finalc=ca2;
               mc=mca(1);
              elseif mv2==mvb2(1)
               finalc=cb2;
               mc=mcb(1);
              else
               finalc=cc2;
               mc=mcc(1);
               end
            
            [a,a1]=seamstretchw(a,a1,finalc,mc);
            [b,b1]=seamstretchw(b,b1,finalc,mc);
            [c,c1]=seamstretchw(c,c1,finalc,mc);
                          
                
             q=q+1;
            end
 
 end
 
 if p<ppp
     while p~=ppp
         [ga,gb,gc]=grad(a,b,c);   
         [ca,cb,cc]=calmatcy(ga,gb,gc);
         [mva,mra]=insertl(ca);
         [mvb,mrb]=insertl(cb);
         [mvc,mrc]=insertl(cc);
         
           %mv=min([mva(1),mvb(1),mvc(1)]);
           mv=median([mva(1),mvb(1),mvc(1)]);
%          %mv=max([mva(qa),mvb(qb),mvc(qc)]);
           %mc=adjust(mca(qa),ca,mcb(qb),cb,mcc(qc),cc);
           
           if mv==mva(1)
               finalc=ca;
               mr=mra(1);
               %qa=qa+1;
%              
           elseif mv==mvb(1)
               finalc=cb;
               mr=mrb(1);
               %qb=qb+1;
           else
               finalc=cc;
               mr=mrc(1);
               %qc=qc+1;
           end
%             
%             if mc==mca(qa)
%                 finalc=ca;
%                 qa=qa+1;
%             elseif mc==mcb(qb)
%                 finalc=cb;
%                 qb=qb+1;
%                         
%             else                %mc==mcc(qc)
%                 finalc=cc;
%                 qc=qc+1;
%             end

          [a,a1]=seamstretchl(a,a1,finalc,mr);
          [b,b1]=seamstretchl(b,b1,finalc,mr);
          [c,c1]=seamstretchl(c,c1,finalc,mr);
          
           
 p=p+1;
     end
 end
 if q<qqq
     while q~=qqq
         [ga,gb,gc]=grad(a,b,c);
         [ca,cb,cc]=calmatcx(ga,gb,gc);
         [mva,mca]=insertw(ca);
         [mvb,mcb]=insertw(cb);
         [mvc,mcc]=insertw(cc);
%          
           %mv=min([mva(1),mvb(1),mvc(1)]);
           mv=median([mva(1),mvb(1),mvc(1)]);
%          %mv=max([mva(qa),mvb(qb),mvc(qc)]);
           %mc=adjust(mca(qa),ca,mcb(qb),cb,mcc(qc),cc);
           
           if mv==mva(1)
               finalc=ca;
               mc=mca(1);
               %qa=qa+1;
%              
           elseif mv==mvb(1)
               finalc=cb;
               mc=mcb(1);
               %qb=qb+1;
           else
               finalc=cc;
               mc=mcc(1);
               %qc=qc+1;
           end
%             
%             if mc==mca(qa)
%                 finalc=ca;
%                 qa=qa+1;
%             elseif mc==mcb(qb)
%                 finalc=cb;
%                 qb=qb+1;
%                         
%             else                %mc==mcc(qc)
%                 finalc=cc;
%                 qc=qc+1;
%             end

          [a,a1]=seamstretchw(a,a1,finalc,mc);
          [b,b1]=seamstretchw(b,b1,finalc,mc);
          [c,c1]=seamstretchw(c,c1,finalc,mc);
          
          q=q+1;
     end
 end

 Z(:,:,qq,1)=a1;
 Z(:,:,qq,2)=b1;
 Z(:,:,qq,3)=c1;
 
avgintensity(4,qq)=avginten(ga);
avgintensity(5,qq)=avginten(gb);
avgintensity(6,qq)=avginten(gc);
end
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