clear all
I = load_images('ImageDataICCP09/ArchSequence');
%R = exposure_fusion(I,[0 0 0]);
sz=size(I);
Igray=zeros(sz(1),sz(2),sz(4));
for k=1:sz(4)
    Igray(:,:,k)=rgb2gray(I(:,:,:,k));
end

%imshow(Igray(:,:,2));

Ek=zeros(sz(1),sz(2),sz(4));

for k=1:sz(4)
    for i=1:sz(1)
        for j=1:sz(2)
            Ek(i,j,k)=exp(-(((Igray(i,j,k)-0.5)^2)/(2*((0.2)^2))));
        end
    end
end

Eksum=zeros(sz(1),sz(2));

for i=1:sz(1)
   for j=1:sz(2)
       for k=1:sz(4)
           Eksum(i,j)=Eksum(i,j)+Ek(i,j,k);
       end
   end 
end

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


maxv=max(max(V))
min(min(V))
maxv=(.25)*maxv

% WEIGHTED VARIANCE MATRIX PREPRATION
%##############################################################################################################################
%##############################################################################################################################

M=coffmat();

q=1;
t=1;

%Coefficients:
  p1 = 0.93768;
  p2 = -1.419;
  p3 = 0.23317;
  p4 = 1.3008;
  p5 = 0.020849;

%yy = p1*x^4 + p2*x^3 +
 %    p3*x^2 + p4*x +
  %   p5 

q=1;
t=1;
for i=1:sz(1)
    for j=1:sz(2)
      if V(i,j) < maxv 
          
    %     use when we have the polynomial
            l=(Igray(i,j,2)- p1*(Igray(i,j,1)^4) - p2*(Igray(i,j,1)^3) -p3*(Igray(i,j,1)^2) - p4*Igray(i,j,1)-p5);
             if l>= -0.06 && l<=0.06
                 x(t)=Igray(i,j,1);
                 y(t)=Igray(i,j,2);
                 t=t+1;
             end
                 
      end
    end
end
figure; plot(x,y,'o');
% checkdy(Igray(:,:,1),Igray(:,:,2));
% Refimgid=1;
% targetimid=5;
% R=I;
% 
% d=0;
% s=0;
% window=5;
% for i=1:window:(sz(1)-window)
%      for j=1:window:(sz(2)-window)
%          L=checkdy(Igray(i:(i+window-1),j:(j+window-1),1),Igray(i:(i+window-1),j:(j+window-1),targetimid),V(i:(i+window-1),j:(j+window-1)),maxv,M,targetimid);
%          if L==0
%              s=s+1;
%          else
%              R(i:(i+window-1),j:(j+window-1),:,targetimid)=mark_dy_region(R(i:(i+window-1),j:(j+window-1),:,1),R(i:(i+window-1),j:(j+window-1),:,targetimid),window,M,targetimid);
%              d=d+1;
%          end
%      end
%  end
% d
% s
% 
% 
% figure; plot(x,y,'-');
% figure; plot(xx,yy,'o');
% 
% plot(x1,y1,'o');
% 
% 
% figure('Name','Result with goast effect'); 
% imshow(R);
% 
% 
% figure('Name','REFERENCE IMAGE');
% imshow(I(:,:,:,1));
% 
% figure('Name','IMAGE WITH DYNAMIC SCENE');
% imshow(I(:,:,:,targetimid));
% 
% figure('Name','TARGET IMAGE');
% imshow(R(:,:,:,targetimid));



