function test = isBorne(mat)
    [n,~] = size(mat);
    J = entrant(mat);
    M = max(mat(1:n-1,J));
    somme = sum(abs(mat(1:n-1,J)));
    test = 0; %la solution existe
    if M <= 0
        test = 1;   %le probleme n'est admissible
    end
    if somme == 0
        test = 2;   %le probleme n'est pas borner
    end        
end