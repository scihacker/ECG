function [PRD] = prd(m, V, num)
%% Compare m with k * Eig_vecs
Eig_vecs = V(:, 1 : num);
k = Eig_vecs' * m;
constructed = Eig_vecs * k;
PRD = mean(sqrt(sum((m - constructed) .^ 2)) ./ sqrt(sum(m .^ 2)));
end

