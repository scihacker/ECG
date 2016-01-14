function [X, y] = data_load(data, channel)
lst = {};
y = [];
idx = 1;
max_size = 0;
for i = 1 : numel(data)
    for j = 1 : numel(data{i})
        for k = 1 : numel(data{i}{j}.beatData)
            lst{idx} = data{i}{j}.beatData{k};
            if size(data{i}{j}.beatData{k}, 1) > max_size
                max_size = size(data{i}{j}.beatData{k}, 1);
            end
            y(idx) = i;
            idx = idx + 1;
        end
    end
end
idx = idx - 1;
if channel == 0
    X = zeros(idx, max_size * 12);
    for i = 1 : idx
        for j = 1 : 12
            X(i, (j - 1) * max_size + 1 : (j - 1) * max_size + size(lst{i}, 1)) = lst{i}(:, j);
        end
    end
else
    X = zeros(idx, max_size);
    for i = 1 : idx
        X(i, 1 : numel(lst{i}(:, channel))) = lst{i}(:, channel);
    end
end
% X = X - repmat(mean(X, 2), 1, size(X, 2));
% X = X ./ repmat(std(X, 1, 2), 1, size(X, 2));
end