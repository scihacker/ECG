data = load_from_file();
data = pre_process(data);
[train, test] = data_division(data, 9);
train{4}(10:45) = [];
final = [];
Eig_vecs = {};
averages = {};
for i = 1 : 12%[1 2 3 4 5 6 7 10 11 12]
    [X, y] = pca_data_load(train, i);
    [res, Eig_vec, average] = pca_cont(X, 1);
    rank = prd(X', Eig_vec, 1);
    disp(['The ' num2str(i) 'th PRD of the subspace is ' num2str(rank) '.']);
    final = [final res];
    Eig_vecs{end + 1} = Eig_vec;
    averages{end + 1} = average;
end
models = train_svm(final, y');
percentage = pca_test(models, test, Eig_vecs, averages, 0);
