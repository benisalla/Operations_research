function str = gethead(M,choix)      %B,M
    [L,C] = size(M); 
    L=L-1;
    C=C-L-2;            % L = 3;C = 3;
    str = "B \ B-V  |        ";             %6spaces
    for i=1:C+L
        if i<=C
            str = strcat(str,"x"+num2str(i)+"      |      ");
        else
            str = strcat(str,"e"+num2str(i-C)+"       |      ");
        end
    end
    if choix == 0
        str = strcat(str,"-z        |       b");
    else
        str = strcat(str,"z        |       b");
    end
end