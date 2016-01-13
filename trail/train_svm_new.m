function [models] = train_svm_new(X, y)
%% Train n SVMs to achieve n-class svm classification
types = unique(y);
types = sort(types);
models = {};
for i = 1 : numel(types)
    for j = i + 1 : numel(types)
        tmp = y;
        tmp_X = X;
        part = tmp ~= types(i) & tmp ~= types(j);
        tmp(part) = [];
        tmp_X(part, :) = [];
        svm_model = svmtrain(tmp_X, tmp, 'kernel_function', 'rbf');
        models{end+1} = svm_model;
    end
end
end
