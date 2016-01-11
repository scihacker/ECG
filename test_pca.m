data = load_from_file();
[train, test] = data_division(data, 5);
[X, y] = pca_data_load(train, 1);
[res, Eig_vecs] = pca_cont(X, 20);
rank = prd(X', Eig_vecs, 20);
disp(['The PRD of the subspace is ' num2str(rank) '.']);
models = train_svm(res, y');
percentage = pca_test(models, test, Eig_vecs, 1);
