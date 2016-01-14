addpath('../common/');

data = load_from_file();
data = pre_process(data);
[train, test] = data_division(data, 1);

final = [];
Eig_vecs = {};
for i = 1 : 12
[X, y] = data_load(train, i);
[res, V] = fda(X, y);
final = [final res];
Eig_vecs{end + 1} = V;
end
[prior, u, sigma] = qda(final, y);

percentage = test_fda_all(test, Eig_vecs, prior, u, sigma);
