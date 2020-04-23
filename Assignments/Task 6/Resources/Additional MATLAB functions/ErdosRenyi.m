function G=ErdosRenyi(n,p)
    rm=triu(rand(n,n)<p);  % iid bernulli random variables
    A=rm+rm';                 % symmetric adjacency matrix
    A=A-diag(diag(A));     % remove self-loop
    G=graph(A);
    