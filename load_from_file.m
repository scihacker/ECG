function [list] = load_from_file()
directory = dir('./data/');
list = {};
type_code = 0;

for i = 1 : size(directory, 1)
    if directory(i).isdir == 0 || strcmp(directory(i).name, '.') || strcmp(directory(i).name, '..')
        continue;
    end
    sub_dir = dir(['./data/' directory(i).name '/*.mat']);
    if (~isempty(sub_dir))
        type_code = type_code + 1;
    end
    for j = 1 : size(sub_dir, 1)
        data = load(['./data/' directory(i).name '/' sub_dir(j).name]);
        data = data.Beats;
        data.type = type_code;
        list{end + 1} = data;
    end
end
end