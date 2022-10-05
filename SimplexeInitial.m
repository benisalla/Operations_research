function [mat,B,sol,mess] = SimplexeInitial(A,b,C,choix)
    [n,c] = size(A);
    if choix == 0
        C = -C;
    end
    %-------------construire tableau de simplexe-------------------
    A = [A;C];
    I = [eye(n);zeros(1,n)];
    B = [b;0];
    Z = [zeros(n,1);-1];
    mat = horzcat(A,I,Z,B);    %the initial simplexe table
    h = c+1;
    B = [h:n+c]';              %the initial base 
    sol = zeros(1,n+c);
    [~,Cm] = size(mat);
    for k=1:length(B)
           sol(B(k)) = mat(k,Cm);
    end
    if isBorne(mat)==0
        mess = "";
    elseif isBorne(mat)==1
        mess = "the problem is not acceptable";
    else
        mess = "the problem is unlimited";
    end
end