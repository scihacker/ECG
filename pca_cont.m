function [res, V] = pca_cont(X, num)
%% PCA continue
[~, ~, V] = svd(X);
Eig_vecs = V(:, 1 : num);
res = X * Eig_vecs;
end