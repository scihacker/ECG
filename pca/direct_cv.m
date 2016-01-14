% feed the entire feature directly into SVM
addpath('../common/');
data = load_from_file();
data = pre_process(data);
percentage = 0;
for i = 1 : 1
    [train, test] = data_division(data, i);
    [X, y] = pca_data_load(train, 1);
    models = train_svm(X, y');
    percentage = percentage + direct_test(models, test, size(X, 2), 1);
end
percentage = percentage / 10;