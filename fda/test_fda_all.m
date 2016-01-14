function [percentage] = test_fda_all(test_data, Eig_vecs, prior, u, sigma)
%% PCA Testing Function
sum = 0;correct = 0;
for i = 1 : numel(test_data)
    for j = 1 : numel(test_data{i})
        beat_data = test_data{i}{j}.beatData;
        for k = 1 : numel(beat_data)
            new_vec = [];
            for c = 1: 12
                piece = zeros(size(Eig_vecs{c}, 1), 1);
                temp = beat_data{k}(:, c);
                piece(1:min(size(piece), numel(temp))) = temp(1:min(size(piece), numel(temp)));
                piece_new = Eig_vecs{c}' * piece;
                new_vec = [new_vec;piece_new];
            end
            
            if ismatrix(sigma)
                type = lda_classify(new_vec', prior, u, sigma);
            else
                type = qda_classify(new_vec', prior, u, sigma);
            end
            if (type == i)
                correct = correct + 1;
            end
            sum = sum + 1;
        end
    end
end
percentage = correct / sum;
end