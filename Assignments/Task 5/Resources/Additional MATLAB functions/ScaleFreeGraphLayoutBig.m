clear all;
clc;
% generate a radom graph
n=500;                        % number of nodes
%m0=round(n/2);
%m=round(m0/2);                         % between 2 and m0-1
cnt='degree';
%%
figure(1)
m0=5;
m=4;
A=AlbertBarabasi(n, m0, m);
G=graph(A);
%pp=plot(G,'EdgeAlpha',0.1);
%pp=plot(G,'EdgeAlpha',0.01,'layout','circle');
pp=plot(G,'EdgeAlpha',0.1,'layout','force','Iterations',10,'UseGravity',true);
%plot(G,'EdgeAlpha',0.1,'layout','force','Iterations',10);
%pp=plot(G,'EdgeAlpha',0.1,'layout','subspace','Dimension',n/2);
%pp=plot(G,'EdgeAlpha',0.1,'layout','subspace3');
dg=centrality(G,cnt).^(1/n);
wdg=((dg-min(dg))/(max(dg)-min(dg))+0.01)*5;
pp.MarkerSize=wdg;
title(['Node degree distributions for Barabasi-Albert','$(N=',num2str(n,3),', m= ',num2str(m,2),', m_0= ',num2str(m0,2),')$'],'interpreter','latex')
print(gcf,'Figures\BA5_4','-dpng');
print(gcf,'Figures\BA5_4','-djpeg');
%%
figure(2)
m0=10;
m=4;
A=AlbertBarabasi(n, m0, m);
G=graph(A);
%pp=plot(G,'EdgeAlpha',0.1);
%pp=plot(G,'EdgeAlpha',0.01,'layout','circle');
pp=plot(G,'EdgeAlpha',0.1,'layout','force','Iterations',10,'UseGravity',true);
%plot(G,'EdgeAlpha',0.1,'layout','force','Iterations',10);
%pp=plot(G,'EdgeAlpha',0.1,'layout','subspace','Dimension',n/2);
%pp=plot(G,'EdgeAlpha',0.1,'layout','subspace3');
dg=centrality(G,cnt).^(1/n);
wdg=((dg-min(dg))/(max(dg)-min(dg))+0.01)*5;
pp.MarkerSize=wdg;
title(['Node degree distributions for Barabasi-Albert','$(N=',num2str(n,3),', m= ',num2str(m,2),', m_0= ',num2str(m0,2),')$'],'interpreter','latex')
print(gcf,'Figures\BA10_4','-dpng');
print(gcf,'Figures\BA10_4','-djpeg');
%%
figure(3)
m0=10;
m=9;
A=AlbertBarabasi(n, m0, m);
G=graph(A);
%pp=plot(G,'EdgeAlpha',0.1);
%pp=plot(G,'EdgeAlpha',0.01,'layout','circle');
pp=plot(G,'EdgeAlpha',0.1,'layout','force','Iterations',10,'UseGravity',true);
%plot(G,'EdgeAlpha',0.1,'layout','force','Iterations',10);
%pp=plot(G,'EdgeAlpha',0.1,'layout','subspace','Dimension',n/2);
%pp=plot(G,'EdgeAlpha',0.1,'layout','subspace3');
dg=centrality(G,cnt).^(1/n);
wdg=((dg-min(dg))/(max(dg)-min(dg))+0.01)*5;
pp.MarkerSize=wdg;
title(['Node degree distributions for Barabasi-Albert','$(N=',num2str(n,3),', m= ',num2str(m,2),', m_0= ',num2str(m0,2),')$'],'interpreter','latex')
print(gcf,'Figures\BA10_9','-dpng');
print(gcf,'Figures\BA10_9','-djpeg');