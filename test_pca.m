data = load_from_file();
data = pre_process(data);
[train, test] = data_division(data, 1);
[X, y] = pca_data_load(train, 1);
[res, Eig_vecs, average] = pca_cont(X, 1);
rank = prd(X', Eig_vecs, 1);
disp(['The PRD of the subspace is ' num2str(rank) '.']);
models = train_svm(res, y');
percentage = pca_test(models, test, Eig_vecs, average, 1);
