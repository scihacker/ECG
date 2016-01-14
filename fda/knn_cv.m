addpath('../common/');

data = load_from_file();
data = pre_process(data);

percentages = [];
for j = [2 5 10 20 30 40 50]
percentage = 0;
for k = 1 : 10
    [train, test] = data_division(data, k);
    
    [X, y] = data_load(train, 1);
    [res, V] = fda(X, y);
    
    sum = 0;correct = 0;
    
    [X_test, y_test] = data_load(test, 1);
    for i = 1 : length(y_test)
        piece = zeros(size(V, 1), 1);
        temp = X_test(i, :);
        piece(1:min(size(piece), numel(temp))) = temp(1:min(size(piece), numel(temp)));
        new_vec = V' * piece;

        type = knn(res, y, new_vec, j);
        if (type == y_test(i))
            correct = correct + 1;
        end
        sum = sum + 1;
    end
    percentage = percentage + correct / sum;
end
percentage = percentage / 10;
percentages(end + 1) = percentage;
end