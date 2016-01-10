function [X, y] = pca_data_load(data, channel)
lst = {};
y = [];
idx = 1;
max_size = 0;
for i = 1 : numel(data)
    for j = 1 : numel(data{i})
        for k = 1 : numel(data{i}{j}.beatData)
            lst{idx} = data{i}{j}.beatData(k);
            if size(data{i}{j}.beatData(k), 1) > max_size
                max_size = size(data{i}{j}.beatData(k), 1);
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
        X(i, 1 : numel(lst{i}{1})) = reshape(lst{i}{1}, 1, []);
    end
else
    X = zeros(idx, max_size);
    for i = 1 : idx
        X(i, 1 : numel(lst{i}{1}(:, channel))) = lst{i}{1}(:, channel);
    end
end
X = X - repmat(mean(X, 2), 1, size(X, 2));
X = X ./ repmat(std(X, 1, 2), 1, size(X, 2));
end