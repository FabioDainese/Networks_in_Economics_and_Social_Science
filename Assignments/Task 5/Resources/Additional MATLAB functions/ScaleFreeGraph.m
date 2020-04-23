clear all;
clc;
% generate a radom graph
n=100;                        % number of nodes
m0=10;
prefatt=(2:1:m0-1);
np=length(prefatt);
lgnd=cell(np,1);
for i=1:np
    m=prefatt(i);
    A=AlbertBarabasi(n, m0, m);
    G=graph(A);
    figure(1)
    subplot(2,1,1)
    pp=plot(G,'EdgeAlpha',0.1)
    ec=centrality(G,'eigenvector');
    wec=ec/max(ec)*10;
    dg=degree(G);
    wdg=dg/max(dg)*10;
    pp.MarkerSize=wdg;
    pause(2)
    d=degree(G);
    [f,xi] = ksdensity(d,'Bandwidth',0.2,'support',[0 n]);
    subplot(2,1,2)
    plot(xi,f,'color',[m/m0 0 0]);
    xlim([0,30]);
    hold on;
    xline(mean(d),'k--');
    lgnd{i}=['m=',num2str(m,2)];
    title('Node degree distributions for Albert-Barabasi')
    xlabel('Degree of node')
    ylabel('Frequency of nodes')
    legend(lgnd(1:i),'Location','NorthWestOutside')
end
hold off

