function [y] = lda_classify(x, prior, u, sigma)
%% LDA classification
discriminants = zeros(size(prior));
inv_sigma = inv(sigma);
for i = 1 : length(prior)
    discriminants(i) = x * inv_sigma * u(i, :)' - 1 / 2 * u(i, :) * inv_sigma * u(i, :)' + log(prior(i));
end
[~, y] = max(discriminants);
end

