function [percentage] = direct_test(svm_models, test_data, feature_length, channel)
%% Direct Testing Function
sum = 0;correct = 0;
for i = 1 : numel(test_data)
    for j = 1 : numel(test_data{i})
        beat_data = test_data{i}{j}.beatData;
        for k = 1 : numel(beat_data)
            result = zeros(numel(svm_models), 1);
            
            new_vec = zeros(feature_length, 1);
            temp = beat_data{k}(:, channel);
            new_vec(1:min(size(new_vec), numel(temp))) = temp(1:min(size(new_vec), numel(temp)));

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



