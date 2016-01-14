addpath('../common/');
data = load_from_file();
data = pre_process(data);
lst = zeros(7, 1);
for j = [1 2 5 10 20 50 100]
    percentage = 0;
    for i = 1 : 10
        [train, test] = data_division(data, i);
        [X, y] = data_load(train, 1);
        [res, Eig_vecs, average] = pca_cont(X, j);
        rank = prd(X', Eig_vecs, j);
        disp(['The PRD of the subspace is ' num2str(rank) '.']);
        models = train_svm(res, y');
        percentage = percentage + pca_test(models, test, Eig_vecs, average, 1);
    end
    percentage = percentage / 10;
    lst(j) = percentage;
end