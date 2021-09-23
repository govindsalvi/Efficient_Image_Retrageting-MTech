function [sh]=dy()
clear all
I = load_images('ArchSequence');
%R = exposure_fusion(I,[0 0 0]);
sz=size(I);
Igray=zeros(sz(1),sz(2),sz(4));
for k=1:sz(4)
    Igray(:,:,k)=rgb2gray(I(:,:,:,k));
end

EE=zeros(sz(1),sz(2),sz(4));

Ek=zeros(sz(1),sz(2),sz(4));

for k=1:sz(4)
    for i=1:sz(1)
        for j=1:sz(2)
            Ek(i,j,k)=exp(-(((Igray(i,j,k)-0.5)^2)/(2*((0.2)^2))));
        end
    end
end


Eksum=sum(Ek,3);


V=zeros(sz(1),sz(2));

numretor=V;
denominator=V;

for i=1:sz(1)
    for j=1:sz(2)
        for k=1:sz(4)
            numretor(i,j)=numretor(i,j)+Ek(i,j,k)*(Igray(i,j,k)^2);
        end
        numretor(i,j)=numretor(i,j)/Eksum(i,j);
    end
end

for i=1:sz(1)
    for j=1:sz(2)
        for k=1:sz(4)
            denominator(i,j)=denominator(i,j)+Ek(i,j,k)*(Igray(i,j,k));
        end
        denominator(i,j)=denominator(i,j)^2;
        denominator(i,j)=denominator(i,j)/(Eksum(i,j)^2);
    end
end


for i=1:sz(1)
    for j=1:sz(2)
        V(i,j)=(numretor(i,j)/denominator(i,j))-1;
    end
end

% PP=V(:);
% var(PP)
% median(PP)
% mean(PP)
% max(PP)
% min(PP)

maxv1=max(max(V));
maxv=(.99)*maxv1;

%maxv=median(PP);
%maxv=max(PP)/2;
% WEIGHTED VARIANCE MATRIX PREPRATION
%##############################################################################################################################
%##############################################################################################################################

%maxv=.5;

order_of_poly=4;

M=zeros(order_of_poly+1,sz(4)-1);

for imid=2:sz(4)
    t=1;
for i=1:sz(1)
    for j=1:sz(2)
      if V(i,j) < maxv 
          
                 x(t)=Igray(i,j,1);
                 y(t)=Igray(i,j,imid);
                 t=t+1;
                    
      end
    end
end
M(:,imid-1)=polyfit(x,y,order_of_poly);
end

% COFFECIENT MATRIX PREPRATION
%##############################################################################################################################
%##############################################################################################################################



%maxv=(.99*maxv1)
Refimgid=1;
R=I;
d=0;
s=0;
window=2;
for targetimid=2:sz(4)
for i=1:window:(sz(1)-window)
     for j=1:window:(sz(2)-window)
         L=checkdy(Igray(i:(i+window-1),j:(j+window-1),Refimgid),Igray(i:(i+window-1),j:(j+window-1),targetimid),V(i:(i+window-1),j:(j+window-1)),maxv,M,targetimid);
         if L==0
             s=s+1;
         else
             [R(i:(i+window-1),j:(j+window-1),:,targetimid),EE(i:(i+window-1),j:(j+window-1),targetimid)]=mark_dy_region(R(i:(i+window-1),j:(j+window-1),:,Refimgid),R(i:(i+window-1),j:(j+window-1),:,targetimid),window,M,targetimid);
             d=d+1;
         end
     end
end
 
end

% DYNAMIC REGION MAKING
%##############################################################################################################################
%##############################################################################################################################


EV=sum(EE,3);

 %R1=exposure_fusion(I,[0 0 0]);
 %figure('Name','RESULT WITH GHOST EFFECT'); 
 %imshow(R1);

 for i=1:size(R,4)   
     id = num2str(i);
     filename = strcat( 'new/' ,id, '.jpg');
     imwrite(R(:,:,:,i),filename, 'jpg');
 end
 
 sh=mark_sheloette(EV);
 
%  
R1=exposure_fusion(R,[0 0 0]);
figure('Name','ALGORITHM RESULT');
imshow(R1);

PP=zeros(size(R));

RR1=zeros(sz(1)-1,sz(2),3);



% figure;imshow(R(:,:,:,4));
 %EV=EV./(max(max(EV)));
