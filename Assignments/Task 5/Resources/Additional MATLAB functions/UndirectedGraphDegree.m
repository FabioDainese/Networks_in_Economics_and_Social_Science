% generate a radom graph
n=100;                        % number of nodes
edgeprob=(0.1:0.1:0.9);
np=length(edgeprob);
lgnd=cell(np,1);
for i=1:np
    p=edgeprob(i);
    rm=triu(rand(n,n)<p);  % iid bernulli random variables
    A=rm+rm';                 % symmetric adjacency matrix
    A=A-diag(diag(A));     % remove self-loop
    G=graph(A);
    figure(1)
    subplot(2,1,1)
    plot(G,'EdgeAlpha',0.1)
    pause(2)
    [f,xi] = ksdensity(degree(G),'Bandwidth',0.2,'support',[0 n]);
    subplot(2,1,2)
    plot(xi,f,'color',[p 0 0]);
    hold on;
    xline(p*n,'k--');
    lgnd{i}=['p=',num2str(p,2)];
end
hold off
title('Node degree distributions for Erdos-Renyi')
xlabel('Degree of node')
ylabel('Frequency of nodes')
legend(lgnd,'Location','NorthWestOutside')
