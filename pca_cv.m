data = load_from_file();
data = pre_process(data);
percentage = 0;
for i = 1 : 10
[train, test] = data_division(data, i);
[X, y] = pca_data_load(train, 1);
[res, Eig_vecs, average] = pca_cont(X, 1);
rank = prd(X', Eig_vecs, 1);
disp(['The PRD of the subspace is ' num2str(rank) '.']);
models = train_svm(res, y');
percentage = percentage + pca_test(models, test, Eig_vecs, average, 1);
end
percentage = percentage / 10;