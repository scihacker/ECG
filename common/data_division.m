function [train, test] = data_division(data, test_part)
%% 10-fold cross validation
if test_part <= 0 || test_part > 10
    error('test_part error');
end
test = {};
train = data;
for i = 1 : size(train, 2)
    length = size(train{i}, 2);
    j = floor(length / 10 * (test_part - 1)) + 1 : floor(length / 10 * test_part);
    test{i} = train{i}(j);
    train{i}(j) = [];
end
end

