function [percentage] = pca_test(svm_models, test_data, Eig_vecs, channel)
%% PCA Testing Function
sum = 0;correct = 0;
for i = 1 : numel(test_data)
    for j = 1 : numel(test_data{i})
        beat_data = test_data{i}{j}.beatData;
        result = zeros(numel(svm_models), 1);
        for k = 1 : numel(beat_data)
            piece = zeros(size(Eig_vecs, 1), 1);
            temp = beat_data{k}(:, channel);
            piece(1:numel(temp)) = temp;
            piece = piece - mean(piece);
            piece = piece / std(piece, 1);
            new_vec = Eig_vecs' * piece;
            for l = 1 : numel(svm_models)
                g = svmclassify(svm_models{l}, new_vec');
                if g ~= 0
                    result(g) = result(g) + 1;
                end
            end
        end
        if result(i) == max(result)
            correct = correct + 1;
        end
        sum = sum + 1;
    end
end
percentage = correct / sum;
end

