function [I,J,B] = EnterSortir(mat,B)
    [N,C] = size(mat);
    %cherchons l'entrant
    J = entrant(mat);
    %cherchons l'sortant
    for i=1:N-1
        if mat(i,J) == 0    % evite la division sur 0
            mat(i,J) = -1;
        end
    end
    a = mat(1:N-1,J);
    rap = mat(1:N-1,C)./mat(1:N-1,J);
    m = min(rap(rap >=0 & a > 0));
    V = find(rap == m);
    %la regle de blinde
    
    minimal = B(V(1));
    I = V(1);
    for i=1:length(V)   % ----
        if minimal > B(V(i))
            I = V(i);
            minimal = B(V(i));
        end
    end
    B(I) = J;
end