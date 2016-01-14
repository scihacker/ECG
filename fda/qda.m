function [prior, u, sigma] = qda(X, y)
%% Quadratic Discriminant Analysis
y_u = unique(y);
prior = zeros(size(y_u));
u = zeros(length(y_u), size(X, 2));
sigma = zeros(length(y_u), size(X, 2), size(X, 2));

for i = 1 : length(y_u)
    idx = (y == y_u(i));
    size_idx = sum(idx);
    u(i, :) = idx * X / size_idx;
    prior(i) = size_idx / length(y);
    sigma(i, :, :) = (X(idx, :) - repmat(u(i, :), size_idx, 1))' * (X(idx, :) - repmat(u(i, :), size_idx, 1)) / (size_idx - 1);
end
end

