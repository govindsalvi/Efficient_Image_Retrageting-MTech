I = load_images('new');
sz=size(I);
step=2;
in=(I(:,:,:,4));

resx=zeros(sz(1),sz(2),3);
resy=zeros(sz(1),sz(2),3);



for i=1:step:(sz(1)-step)
    for j=1:(step-1):(sz(2)-step)
        win=in(i:(i+step-1),j:(j+step-1),1);
        [gx,gy]=gradxy(win);
        resx(i:(i+step-1),j:(j+step-1),1)=gx;
        
        win=in(i:(i+step-1),j:(j+step-1),2);
        [gx,gy]=gradxy(win);
        resx(i:(i+step-1),j:(j+step-1),2)=gx;
        
        win=in(i:(i+step-1),j:(j+step-1),3);
        [gx,gy]=gradxy(win);
        resx(i:(i+step-1),j:(j+step-1),3)=gx;
        
    end
end


for i=1:step-1:(sz(1)-step),
    for j=1:step:(sz(2)-step)
        win=in(i:(i+step-1),j:(j+step-1),1);
        [gx,gy]=gradxy(win);
        resy(i:(i+step-1),j:(j+step-1),1)=gy;
        
        win=in(i:(i+step-1),j:(j+step-1),2);
        [gx,gy]=gradxy(win);
        resy(i:(i+step-1),j:(j+step-1),2)=gy;
        
        win=in(i:(i+step-1),j:(j+step-1),3);
        [gx,gy]=gradxy(win);
        resy(i:(i+step-1),j:(j+step-1),3)=gy;
    end
end

sz=size(resx);


 for i=1:3
     gx1=resx(1:sz(1)-3,1:sz(2)-3,i);
     gy1=resy(1:sz(1)-3,1:sz(2)-3,i);
     res1=poisson_solver_function_neumann(gx1,gy1);
     res2=(res1-min(res1(:)));
     res2=res2./max(res2(:));
     res(:,:,i)=res2;
 end

figure;imshow(res);

        