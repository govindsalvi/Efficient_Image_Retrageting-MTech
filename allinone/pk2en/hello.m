I = load_images('chrome');
sz=size(I);
for i=1:sz(4)
    L=I(18:(sz(1)-50),(100:sz(2)-100),:,i);
    id=num2str(i-1);
    filename=strcat('chrome1/chrome1.',id,'.png')
    imwrite(L,filename,'png')
end