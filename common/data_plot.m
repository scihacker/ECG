function [  ] = data_plot(data, type, id1, id2)
%% Plot a series of 12-lead ECG graph
graph = data{type}{id1}.beatData{1, id2};
figure;title(['ECG graph of patient No. ' int2str(id1) ', ' int2str(id2) 'th beat.']);
for i = 1 : 12
    subplot(4, 3, i);
    plot(graph(:,i))
end
end

