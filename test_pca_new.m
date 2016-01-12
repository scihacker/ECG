
data = load_from_file();
[train, test] = data_division(data, 9);
train{4}(10:45) = [];
final = [];
for i = 1 : 12
[X, y] = pca_data_load(train, i);
[res, Eig_vecs, average] = pca_cont(X, 2);
rank = prd(X', Eig_vecs, 1);
disp(['The ' num2str(i) 'th PRD of the subspace is ' num2str(rank) '.']);
final = [final res];
end
models = train_svm(final, y');

percentage = pca_test(models, test, Eig_vecs, average, 0);
