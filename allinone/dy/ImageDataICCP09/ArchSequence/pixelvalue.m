clc
clear all
%%

file={'A_1.jpg','A_2_03.jpg','A_3_02.jpg','A_4_06.jpg','A_5_01.jpg'};

a=importfile('pixellocation.xls');
[k1 k2]=size(a);
[ m n ]=size(file);

for k=1:n
    I=double(imread(file{k}));
    for i=1:k1            
         x1=a(i,1)+1;
         y1=a(i,2)+1;
        R(i,k)=I(x1,y1,1);
        G(i,k)=I(x1,y1,2);
        B(i,k)=I(x1,y1,3);
    end
end
%%

% B1=A1';
% B2=A2';
% B3=A3';
% 
% z_min=1;
% z_max=256;
% for i=1:256;
%     z=i;
%     if i<=((z_min+z_max)/2);
%         w(i)=z-z_min;
%     else
%         w(i)=z_max-z;
%     end
% end
% E=[4 8 16 20 24 28 32 64 88 128 176 224 326];
% b=log(E);
%%
% importfile('G.xls');
% Z=Sheet1;
% importfile1('exposure.xls');
% importfile2('w.xls');
% l=800;
% [g,lE]=gsolve(Z,B,l,w);
% i=1:256;
% plot(g,i);
% 
% 

