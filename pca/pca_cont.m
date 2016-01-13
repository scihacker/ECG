function [res, Eig_vecs, average] = pca_cont(X, num)
%% PCA continue
average = mean(X)';
X = X - (mean(X)' * ones(1, size(X, 1)))';
[~, ~, V] = svd(X);
Eig_vecs = V(:, 1 : num);
res = X * Eig_vecs;
end