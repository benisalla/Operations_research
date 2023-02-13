function [mat1,mat2,B1,B2,mess,sol] = Tabulaire(A,b,C,choix)
    [n,c] = size(A);
    %---------------dans le cas de minimisation--------------------
    %choix = 0 => minimisation || choix = 1 => maximisation 
    if choix == 0
        C = -C;
    end
    %-------------construire tableau de simplexe-------------------
    A = [A;C];
    I = [eye(n);zeros(1,n)];
    B = [b;0];
    Z = [zeros(n,1);-1];
    mat1 = horzcat(A,I,Z,B);
    mat = mat1;          %the initial simplexe table
    h = c+1;
    B = [h:n+c]';
    B1 = B;               %the initial base 
    sol = zeros(1,n+c);
    %--------------------------------------------------------------
    [~,C] = size(mat);
   test = 1;
   matT = mat;
   if isBorne(mat)==0
       test = 0;
       while isOptim(mat) == 0
           [matT,B] = SolutionOptim(mat,B);
           if isBorne(matT) ~= 0
               test = 1;
               break;
           end
           mat = matT;   %if the probleme is not possible then this could is not reachable
       end
       for k=1:length(B)
           sol(B(k)) = matT(k,C);
       end
       % test to see if the solution is unique or not
       if IsUnique(mat,B) == 0
           mess = "le system admet une solution unique";
       else
           mess = "le system admet plusieurs solutions";
       end
       
   end
   if isBorne(mat) == 1 && test == 1
       mess = "le probleme n'est pas admissible";
   elseif isBorne(mat) == 2 && test == 1
       mess = "le probleme n'est pas borne";
   end
   mat2 = matT;           %the simplexe table at the end
   B2 = B;               %the base at the end 
end