function [PRD] = prd(m, V, num)
%% Compare m with k * Eig_vecs
m = m - mean(m, 2) * ones(1, size(m, 2));
Eig_vecs = V(:, 1 : num);
k = Eig_vecs' * m;
constructed = Eig_vecs * k;
PRD = mean(sqrt(sum((m - constructed) .^ 2)) ./ sqrt(sum(m .^ 2)));
end

