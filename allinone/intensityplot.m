function intensityplot(L)

figure;
Y=L(1:2,1:3);
bar(Y,'hist');title('Average Energy in Exposure fusion and our Approach');
legend('blue', 'green', 'red');

% figure;
% Y=L(2:2,1:3);
% bar(Y,'hist'); title('Our Method')
% legend('red', 'green', 'blue');

% figure;
% Y=L(1:3,1:3);
% bar(Y,'hist');title('input images');
% legend('red', 'green', 'blue');
% 
% figure;
% Y=L(4:6,1:3);
% bar(Y,'hist'); title('same input images after seam removed')
% legend('red', 'green', 'blue');
% 
% figure;
% Y=L(7:8,1:3);
% bar(Y,.9,'hist'); title('comparision')
% legend('red', 'green', 'blue');
end

