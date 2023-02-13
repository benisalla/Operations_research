function arr = getside(M,B,choix)      %B,M
    [L,C] = size(M); L=L-1;C=C-L-2;     %L = 3;C = 3; B = [5 4 3]; T = 3;
    T = length(B);
    str = ""; 
    for i=1:T
        if B(i)<=C
            str = strcat(str,"x"+num2str(B(i))+"#");  %5spaces
        else
            str = strcat(str,"e"+num2str(B(i)-C)+"#");
        end
    end
    if choix == 0
        str = strcat(str,"-z");
    else
        str = strcat(str,"z");
    end
    arr = split(str,"#");
%     arr(end,:)= [];
end