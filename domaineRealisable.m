function domaineRealisable(A, b,C,choix)
    if choix == 0
        A = -A; b = -b;
    end
    A=[A;-1 0;0 -1];
    b=[b;0;0];
    [n,~]= size(A);
    node = [];
    for i=1:n-1
          for j=i+1:n
                M = [A(i,:); A(j,:)];
                bm = b([i,j]);
                 x = M \ bm;
                if (A*x <= b)
                  node = [node, x];
                end
          end
    end
    if choix == 0
        node = [node,[0;max(-b)],[max(-b);0],[max(-b);max(-b)]];
    end
    ax = [0 max(node(1,:))+1 0 max(node(2,:)+1)];
    %tirer les sommet de dolygone
    k = convhull(node(1,:), node(2,:));
    sommet(1,:) = node(1,k)';
    sommet(2,:) = node(2,k)';
    
    %fill the polygone
    fill(sommet(1,:), sommet(2,:), 'r','edgecolor', 'b');
    hold on
    
    %tracer la fonction en fonction de k
    sol=[];
    for i=1:length(node)
        s= C(1,1)*node(1,i)+ C(1,2)*node(2,i);
        sol = [sol s];
    end
    valeur=max(sol);
    x = 0:0.01:max(node(1,:))+1;
    for k =0:valeur/10:valeur
        f = (k-C(1,1)*x)/C(1,2);
        if( k == valeur)
            plot(x,f,'r-');
            hold on
        else
            plot(x,f,'k-');
            hold on
        end
    end
     axis(ax);
end