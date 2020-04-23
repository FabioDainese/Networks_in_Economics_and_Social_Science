clear all;
clc;
% generate a radom graph
n=500;                        % number of nodes
%m0=round(n/2);
%m=round(m0/2);                         % between 2 and m0-1
m0=10;
m=9;
A=AlbertBarabasi(n, m0, m);
G=graph(A);
cnt='eigenvector';
%%
figure(1)
%pp=plot(G,'EdgeAlpha',0.1);
%pp=plot(G,'EdgeAlpha',0.01,'layout','circle');
pp=plot(G,'EdgeAlpha',0.1,'layout','force','Iterations',10,'UseGravity',true);
%plot(G,'EdgeAlpha',0.1,'layout','force','Iterations',10);
%pp=plot(G,'EdgeAlpha',0.1,'layout','subspace','Dimension',n/2);
%pp=plot(G,'EdgeAlpha',0.1,'layout','subspace3');
dg=centrality(G,cnt).^(1/n);
wdg=((dg-min(dg))/(max(dg)-min(dg))+0.01)*5;
pp.MarkerSize=wdg;
title(['Node degree distributions for Barabasi-Albert','$(m= ',num2str(m,2),', m_0= ',num2str(m0,2),')$'],'interpreter','latex')
print(gcf,'Figures\sBA10_9','-dpng');
print(gcf,'Figures\sBA10_9','-djpeg');

%%
figure(2)
dAB=degree(G);
mdAB=round(mean(dAB));
[f,xi] = ksdensity(dAB,'Bandwidth',0.2,'support',[0 n]);
plot(xi,f,'color',[m/m0 0 0]);
xlim([0,max(dAB)*2]);
hold on;
xline(mdAB,'k--');
title(['Node degree distributions for Barabasi-Albert','$(m= ',num2str(m,2),', m_0= ',num2str(m0,2),')$'],'interpreter','latex')
xlabel('Degree of node')
ylabel('Frequency of nodes')
hold off
print(gcf,'Figures\sDegreeBA10_9','-dpng');
print(gcf,'Figures\sDegreeBA10_9','-djpeg');
%%
%AB
dAB=degree(G);
ccAB=clustering_coef_bu(G.adjacency);
plAB=mean(distances(G));
%WS
h1 = WattsStrogatz(n,round(mean(dAB)/2),0.1);
dWS=degree(h1);
ccWS=clustering_coef_bu(h1.adjacency);
plWS=mean(distances(h1));
%ER
p=sum(dAB)/(n*(n-1));
h2 = ErdosRenyi(n,p);
dER=degree(h2);
ccER=clustering_coef_bu(h2.adjacency);
plER=mean(distances(h2));
figure(3)
[f,xi] = ksdensity(dAB,'Bandwidth',0.2,'support',[-0.0001 n]);
plot(xi,f,'color',[m/m0 0 0]);
xlim([0,max(dAB)*1.1]);
hold on;
[f,xi] = ksdensity(dWS,'Bandwidth',0.2,'support',[-0.0001 n]);
plot(xi,f,'color',[0 0 1]);
[f,xi] = ksdensity(dER,'Bandwidth',0.2,'support',[-0.0001 n]);
plot(xi,f,'color',[0 1 0]);
hold off
legend('BA','WS','ER');
title('Degree');
print(gcf,'Figures\sDegreeERBA10_9','-dpng');
print(gcf,'Figures\sDegreeERBA10_9','-djpeg');
%%
figure(4)
[f,xi] = ksdensity(ccAB,'Bandwidth',0.2,'support',[-0.0001 n]);
plot(xi,f,'color',[m/m0 0 0]);
xlim([0,max(ccWS)*1.1]);
hold on;
[f,xi] = ksdensity(ccWS,'Bandwidth',0.2,'support',[-0.0001 n]);
plot(xi,f,'color',[0 0 1]);
[f,xi] = ksdensity(ccER,'Bandwidth',0.2,'support',[-0.0001 n]);
plot(xi,f,'color',[0 1 0]);
hold off
legend('BA','WS','ER');
title('Clustering Coefficient');
print(gcf,'Figures\sClustBA10_9','-dpng');
print(gcf,'Figures\sClustBA10_9','-djpeg');
%%
figure(5)
[f,xi] = ksdensity(plAB,'Bandwidth',0.2,'support',[0 n]);
plot(xi,f,'color',[m/m0 0 0]);
xlim([0,max(plAB)*2]);
hold on;
[f,xi] = ksdensity(plWS,'Bandwidth',0.2,'support',[0 n]);
plot(xi,f,'color',[0 0 1]);
[f,xi] = ksdensity(plER,'Bandwidth',0.2,'support',[0 n]);
plot(xi,f,'color',[0 1 0]);
hold off
legend('BA','WS','ER');
title('Average Path Length');
print(gcf,'Figures\sAplBA10_9','-dpng');
print(gcf,'Figures\sAplBA10_9','-djpeg');
%%
figure(6)
scatter(dWS,ccWS,'MarkerFaceColor',[0,0,1]);
hold on; 
scatter(dAB,ccAB,'MarkerFaceColor',[1,0,0]);
scatter(dER,ccER,'MarkerFaceColor',[0,1,0]);
hold off;
xlabel('d');
ylabel('cc');
legend('WS','BA','ER')
%%
figure(7)
scatter(dWS,plWS,'MarkerFaceColor',[0,0,1]);
hold on; 
scatter(dAB,plAB,'MarkerFaceColor',[1,0,0]);
scatter(dER,plER,'MarkerFaceColor',[0,1,0]);
hold off;
xlabel('d');
ylabel('apl');
legend('WS','BA','ER')
%%
figure(8)
scatter(plWS,ccWS,'MarkerFaceColor',[0,0,1]);
hold on; 
scatter(plAB,ccAB,'MarkerFaceColor',[1,0,0]);
scatter(plER,ccER,'MarkerFaceColor',[0,1,0]);
hold off;
xlabel('apl');
ylabel('cc');
legend('WS','BA','ER')


