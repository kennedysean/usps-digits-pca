load('USPS.mat');
M = mean(A);
centered = A - M;
[U,S,V] = svd(centered);
p_list = [10 50 100 200];
reconstruction_errors = zeros(1,4);
% perform PCA with p values in p_list
for i=1:size(p_list,2)
    dim = p_list(i);
    proj = U(:,1:dim)*S(1:dim,1:dim);
    reconstruct = proj * V(:,1:dim)';
    reconstruction_errors(i) = norm(centered - reconstruct, 'fro')^2;
    test_images = [1 2 301 601 901]; % reconstruct test images
    reconstruct1 = reshape(reconstruct(test_images(1),:), 16, 16);
    subplot(5,size(p_list,2),i), imshow(reconstruct1','InitialMagnification','fit');
    reconstruct2 = reshape(reconstruct(test_images(2),:), 16, 16);
    subplot(5,size(p_list,2),4+i), imshow(reconstruct2','InitialMagnification','fit');
    reconstruct3 = reshape(reconstruct(test_images(3),:), 16, 16);
    subplot(5,size(p_list,2),8+i), imshow(reconstruct3','InitialMagnification','fit');
    reconstruct4 = reshape(reconstruct(test_images(4),:), 16, 16);
    subplot(5,size(p_list,2),12+i), imshow(reconstruct4','InitialMagnification','fit');
    reconstruct5 = reshape(reconstruct(test_images(5),:), 16, 16);
    subplot(5,size(p_list,2),16+i), imshow(reconstruct5','InitialMagnification','fit');
end
disp('Errors for p in p_list: ')
disp(reconstruction_errors);
