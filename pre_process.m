function [data] = pre_process(data)
%% Left shifting the R wave to 200.
for i = 1 : numel(data)
    for j = 1 : numel(data{i})
        for k = 1 : numel(data{i}{j}.beatData)
            [~, m] = max(data{i}{j}.beatData{k}(:, 1));
            if m > 200
                data{i}{j}.beatData{k} = data{i}{j}.beatData{k}(m - 200 : end, :);
            end
        end
    end
end
end

