function [percentage] = test_fda(test_data, Eig_vecs, prior, u, sigma, channel)
%% FDA Testing Function
sum = 0;correct = 0;
[X, y] = data_load(test_data, channel);
for i = 1 : length(y)
    %{
    for c = 1: 12
        piece = zeros(size(Eig_vecs{c}, 1), 1);
        temp = beat_data{k}(:, c);
        piece(1:min(size(piece), numel(temp))) = temp(1:min(size(piece), numel(temp)));
        new_vec = [new_vec;Eig_vecs{c}' * piece];
    end
    %}
    piece = zeros(size(Eig_vecs, 1), 1);
    temp = X(i, :);
    piece(1:min(size(piece), numel(temp))) = temp(1:min(size(piece), numel(temp)));
    new_vec = Eig_vecs' * piece;
    
    if ismatrix(sigma)
        type = lda_classify(new_vec', prior, u, sigma);
    else
        type = qda_classify(new_vec', prior, u, sigma);
    end
    if (type == y(i))
        correct = correct + 1;
    end
    sum = sum + 1;
end
percentage = correct / sum;
end
