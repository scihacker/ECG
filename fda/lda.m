function [prior, u, sigma] = lda(X, y)
%% Linear Discriminant Analysis
y_u = unique(y);
prior = zeros(size(y_u));
u = zeros(length(y_u), size(X, 2));
sigma = zeros(size(X, 2), size(X, 2));

for i = 1 : length(y_u)
    idx = (y == y_u(i));
    size_idx = sum(idx);
    u(i, :) = idx * X / size_idx;
    prior(i) = size_idx / length(y);
    sigma = sigma + (X(idx, :) - repmat(u(i, :), size_idx, 1))' * (X(idx, :) - repmat(u(i, :), size_idx, 1));
end
sigma = sigma / (length(y) - length(y_u));
end

