function example;

I = load_images('new');

figure('Name','Input sequence');
subplot(2,2,1); imshow(I(:,:,:,1));
subplot(2,2,2); imshow(I(:,:,:,2));
subplot(2,2,3); imshow(I(:,:,:,3));
subplot(2,2,4); imshow(I(:,:,:,4));

R = exposure_fusion(I,[0 0 0]);
figure('Name','Result'); 
imshow(R); 
 imwrite(R,'staticexpo.tif','tif')