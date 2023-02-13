function test = isOptim(mat)
    [n,c] = size(mat);
    test = 1; %optimum est attient
    M = max(mat(n,1:c-2));
    if M > 0
        test = 0;
    end
end