function [models] = train_svm(X, y)
%% Train n SVMs to achieve n-class svm classification
types = unique(y);
types = sort(types);
models = {};
for i = 1 : numel(types)
    tmp = y;
    tmp(tmp ~= types(i)) = 0;
    svm_model = svmtrain(X, tmp, 'kernel_function', 'polynomial');
    models{end+1} = svm_model;
end
end

