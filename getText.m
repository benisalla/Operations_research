function arr = getText(M,B,choix)
    [L,C] = size(M);
    if choix == 0
        M(L,:) = -1*M(L,:);
    end
    str = "";
    for i=1:L
        for j=1:C
            str = strcat(str,"|"+num2str(round(M(i,j)*1000)/1000));
        end
        str = strcat(str,'#');
    end
    %----------------------------------------------------
    tab = split(str,"#");        % s = ["x    ","x    ","x    ","x    ","x    "]';
    tab(end,:) = [];
    S = getside(M,B,choix);
    H = gethead(M,choix);
    tab = S+tab;
    tab = [H;tab];
    arr = cellstr(tab);
end