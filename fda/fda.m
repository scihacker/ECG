function [res, V] = fda(X, y)
%% Reduced Rank LDA(Fisher LDA)
% The dimensionality reduction part.
[~, dim] = size(X);
m = mean(X)';
Sw = zeros(dim, dim);Sb = zeros(dim, dim);
y_u = unique(y);

for i = 1 : length(y_u)
    ks = (y == y_u(i));
    m_i = mean(X(ks, :))';
    S_xi = (X(ks, :)' - repmat(m_i, 1, size(X(ks, :), 1))) * (X(ks, :)' - repmat(m_i, 1, size(X(ks, :), 1)))';
    Sw = Sw + S_xi;
    Sb = Sb + length(y_u) * (m_i - m) * (m_i - m)';
end
clear m_i S_xi m; 
[V, D] = eig(pinv(Sw) * Sb);
V = real(V);
[~, I] = sort(diag(D), 'descend');

V = V(:, I(1 : length(y_u) - 1));
res = X * V;
end