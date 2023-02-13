function [mat,B] = SolutionOptim(mat,B)
    [n,c] = size(mat);
    [I,J,B] = EnterSortir(mat,B);
    mat(I,:) = mat(I,:)/mat(I,J);
    for i=1:n
        if i ~= I
            mat(i,:) = mat(i,:)-mat(i,J)*mat(I,:);
        end
    end
end