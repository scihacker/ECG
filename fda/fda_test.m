addpath('../common/');
data = load_from_file();
data = pre_process(data);
[train, test] = data_division(data, 1);
