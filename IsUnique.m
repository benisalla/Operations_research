function a = IsUnique(mat,B)
    [L,C] = size(mat);
    a = 0; %solution is unique
    for i=1:C-2
        if mat(L,i) == 0 && ~ismember(i,B)
            a = 1; %solution is not unique
        end
    end
end