function [y] = knn(X, Y, x, n)
%% K-Nearest Neighbor Algorithm
distance = X - repmat(x', size(X, 1), 1);
d = sum(distance .* distance, 2);
[~, I] = sort(d, 'ascend');
y = mode(Y(I(1 : n)));
end