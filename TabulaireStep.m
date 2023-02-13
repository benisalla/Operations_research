function [mat,B,mess,sol,stop] = TabulaireStep(mat,B,sol)
   [~,C] = size(mat);
   test = 1;
   stop = 0;
   mess = "";
   if isBorne(mat)==0
       test = 0;
       if isOptim(mat) == 0
           [mat,B] = SolutionOptim(mat,B);
       end
       
       if isOptim(mat) == 1
           stop = 1;
       end
       
       sol = zeros(1,C-2);
       for k=1:length(B)
            sol(B(k)) = mat(k,C);
       end
       
       if stop == 1
           % test to see if the solution is unique or not
           if IsUnique(mat,B) == 0
               mess = "le system admet une solution unique";
           else
               mess = "le system admet plusieurs solutions";
           end
       end
       
   end
   if isBorne(mat) == 1 && test == 1
       mess = "le probleme n'est pas admissible";
   elseif isBorne(mat) == 2 && test == 1
       mess = "le probleme n'est pas borne";
   end
end