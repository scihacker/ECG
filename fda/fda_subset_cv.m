addpath('../common/');

data = load_from_file();
data = pre_process(data);

percentages = [];
for j = 1 : 5
percentage = 0;
for k = 1 : 10
    [train, test] = data_division(data, k);
    [X, y] = data_load(train, 1);
    [res, V] = fda(X, y);
    res = res(:, 1 : j);
    Eig_vecs = V(:, 1 : j);
    [prior, u, sigma] = lda(res, y);
    percentage = percentage + test_fda(test, Eig_vecs, prior, u, sigma, 1);
end
disp('Iteration Finished');
percentage = percentage / 10;
percentages(end + 1) = percentage;
end