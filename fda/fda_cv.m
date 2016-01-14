addpath('../common/');

data = load_from_file();
data = pre_process(data);

percentage = 0;
for k = 1 : 10
    [train, test] = data_division(data, k);
    final = [];
    Eig_vecs = {};
    for i = 1 : 12
        [X, y] = data_load(train, i);
        [res, V] = fda(X, y);
        final = [final res];
        Eig_vecs{end + 1} = V;
    end
    [prior, u, sigma] = lda(final, y);

    percentage = percentage + test_fda_all(test, Eig_vecs, prior, u, sigma);
end
percentage = percentage / 10;