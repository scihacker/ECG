function [percentage] = pca_test(svm_models, test_data, Eig_vecs, average, channel)
%% PCA Testing Function
sum = 0;correct = 0;
for i = 1 : numel(test_data)
    for j = 1 : numel(test_data{i})
        beat_data = test_data{i}{j}.beatData;
        for k = 1 : numel(beat_data)
            result = zeros(numel(svm_models), 1);
            new_vec = [];
            if channel == 0
                for c = 1: 12%[1 2 3 4 5 6 7 10 11 12]
                    piece = zeros(size(Eig_vecs{c}, 1), 1);
                    temp = beat_data{k}(:, c);
                    piece(1:min(size(piece), numel(temp))) = temp(1:min(size(piece), numel(temp)));
                    % piece = piece - mean(piece);
                    % piece = piece / std(piece, 1);
                    piece = piece - average{c};
                    new_vec = [new_vec;Eig_vecs{c}' * piece];
                end
            else
                piece = zeros(size(Eig_vecs, 1), 1);
                temp = beat_data{k}(:, channel);
                piece(1:min(size(piece), numel(temp))) = temp(1:min(size(piece), numel(temp)));
                % piece = piece - mean(piece);
                % piece = piece / std(piece, 1);
                piece = piece - average;
                new_vec = Eig_vecs' * piece;
            end
            for l = 1 : numel(svm_models)
                g = svmclassify(svm_models{l}, new_vec');
                if g ~= 0
                    result(g) = result(g) + 1;
                end
            end
            if result(i) == max(result) && result(i) ~= 0
                correct = correct + 1;
            end
            sum = sum + 1;
        end
    end
end
percentage = correct / sum;
end

