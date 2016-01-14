good = 0;
for i = 1 : size(res, 1)
    type = lda_classify(res(i, :), prior, u, sigma);
    if (type == y(i))
        good = good + 1;
    end
end