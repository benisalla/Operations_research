function J = entrant(mat)
    [N,C] = size(mat);
%     v2 = max(mat(N,1:C-2));
%     for j = 1:C-2
%         if v2 == mat(N,j)
%             J = j;   %J represent index de premier 
%             break;   %element entrant (regle de bland).
%         end
%     end
    V = find(mat(N,1:C-2) == max(mat(N,1:C-2)));
    J = V(1);
end