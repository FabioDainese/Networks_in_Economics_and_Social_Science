%% Build Watts-Strogatz Small World Graph Model
% This example shows how to construct and analyze a Watts-Strogatz
% small-world graph. The Watts-Strogatz model is a random graph that has
% small-world network properties, such as clustering and short average path
% length. 

%% Algorithm Description
% Creating a Watts-Strogatz graph has two basic steps:
%
% # Create a ring lattice with $N$ nodes of mean degree $2K$. Each node is
% connected to its $K$ nearest neighbors on either side.
% # For each edge in the graph, rewire the target node with probability
% $p$. The rewired edge cannot be a duplicate or self-loop.
% 
% After the first step the graph is a perfect ring lattice. So when $p
% = 0$, no edges are rewired and the model returns a ring lattice. In
% contrast, when $p = 1$, all of the edges are rewired and the ring
% lattice is transformed into a random graph.
%
% The file |WattsStrogatz.m| implements this graph algorithm for undirected
% graphs. The input parameters are |N|, |K|, and |beta| according to the
% algorithm description above. 
% 
% View the file |WattsStrogatz.m|.
%
% <include>WattsStrogatz.m</include>
%


%%
n=100;
K=round(log(n));
cnt='degree';
scl=10;
addpath('C:\Roberto\Dottorato\Teaching\CorsoNetworkDAIS\MatlabTutorial\BCT\2019_03_03_BCT');
%%
%% Ring Lattice
% Construct a ring lattice with 500 nodes using the |WattsStrogatz|
% function. When |beta| is 0, the function returns a ring lattice whose
% nodes all have degree |2K|.
h = WattsStrogatz(n,K,0);
figure(1)
pp=plot(h,'NodeColor','k','Layout','circle');
XData=pp.XData;
YData=pp.YData;
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS0WL','-dpng');
print(gcf,'Figures\sWS0WL','-djpeg');
%
figure(11)
deg = centrality(h,cnt);
nSizes = ((0.001+deg-min(deg))/(0.01+max(deg)-min(deg))+0.2)*scl;
pp=plot(h,'MarkerSize',nSizes,'NodeColor','k','XData',XData,'YData',YData);
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS0','-dpng');
print(gcf,'Figures\sWS0','-djpeg');
%
figure(111)
deg = clustering_coef_bu(h.adjacency);
nSizes = ((0.001+deg-min(deg))/(0.01+max(deg)-min(deg))+0.2)*scl;
pp=plot(h,'MarkerSize',nSizes,'NodeColor','k','XData',XData,'YData',YData);
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS0cc','-dpng');
print(gcf,'Figures\sWS0cc','-djpeg');
%% Some Random Edges
% Increase the amount of randomness in the graph by raising |beta| to
% |0.01| |0.1| and |0.50|. 
h2 = WattsStrogatz(n,K,0.1);
figure(2)
p=plot(h2,'NodeColor','k','EdgeAlpha',0.9,'XData',XData,'YData',YData);
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0.1$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS01WL','-dpng');
print(gcf,'Figures\sWS01WL','-djpeg');
%
figure(21)
deg = centrality(h2,cnt);
nSizes = ((0.001+deg-min(deg))/(0.01+max(deg)-min(deg))+0.2)*scl;
p=plot(h2,'MarkerSize',nSizes,'NodeColor','k','EdgeAlpha',0.9,'layout','force');
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0.1$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS01','-dpng');
print(gcf,'Figures\sWS01','-djpeg');
%
figure(22)
deg = clustering_coef_bu(h2.adjacency);
nSizes = ((0.001+deg-min(deg))/(0.01+max(deg)-min(deg))+0.2)*scl;
p=plot(h2,'MarkerSize',nSizes,'NodeColor','k','EdgeAlpha',0.9,'layout','force');
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0.1$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS01cc','-dpng');
print(gcf,'Figures\sWS01cc','-djpeg');
%%
h3 = WattsStrogatz(n,K,0.2);
figure(3)
p=plot(h3,'NodeColor','k','EdgeAlpha',0.9,'XData',XData,'YData',YData);
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0.2$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS02WL','-dpng');
print(gcf,'Figures\sWS02WL','-djpeg');
%
figure(31)
deg = centrality(h3,cnt);
nSizes = ((0.001+deg-min(deg))/(0.01+max(deg)-min(deg))+0.2)*scl;
p=plot(h3,'MarkerSize',nSizes,'NodeColor','k','EdgeAlpha',0.9,'layout','force');
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0.2$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS02','-dpng');
print(gcf,'Figures\sWS02','-djpeg');
%
figure(32)
deg = clustering_coef_bu(h3.adjacency);
nSizes = ((0.001+deg-min(deg))/(0.01+max(deg)-min(deg))+0.2)*scl;
p=plot(h3,'MarkerSize',nSizes,'NodeColor','k','EdgeAlpha',0.9,'layout','force');
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0.2$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS02c','-dpng');
print(gcf,'Figures\sWS02c','-djpeg');


%%
h4 = WattsStrogatz(n,K,0.10);
figure(4)
plot(h4,'NodeColor','k','EdgeAlpha',0.9,'XData',XData,'YData',YData);
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0.3$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS03WL','-dpng');
print(gcf,'Figures\sWS03WL','-djpeg');
%
figure(41)
deg = centrality(h4,cnt);
nSizes = ((0.001+deg-min(deg))/(0.01+max(deg)-min(deg))+0.2)*scl;
p=plot(h4,'MarkerSize',nSizes,'NodeColor','k','EdgeAlpha',0.9,'layout','force');
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0.3$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS03','-dpng');
print(gcf,'Figures\sWS03','-djpeg');
%
figure(42)
deg = clustering_coef_bu(h4.adjacency);
nSizes = ((0.001+deg-min(deg))/(0.01+max(deg)-min(deg))+0.2)*scl;
p=plot(h4,'MarkerSize',nSizes,'NodeColor','k','EdgeAlpha',0.9,'layout','force');
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0.3$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS03cc','-dpng');
print(gcf,'Figures\sWS03cc','-djpeg');
%% Random Graph
h5 = WattsStrogatz(n,K,0.5);
figure(5)
plot(h5,'NodeColor','k','EdgeAlpha',0.9,'XData',XData,'YData',YData);
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0.5$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS05WL','-dpng');
print(gcf,'Figures\sWS05WL','-djpeg');
%
figure(51)
deg = centrality(h5,cnt);
nSizes = ((0.001+deg-min(deg))/(0.01+max(deg)-min(deg))+0.2)*scl;
p=plot(h5,'MarkerSize',nSizes,'NodeColor','k','EdgeAlpha',0.9,'layout','force');
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0.5$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS05','-dpng');
print(gcf,'Figures\sWS05','-djpeg');
%
figure(52)
deg = clustering_coef_bu(h5.adjacency);
nSizes = ((0.001+deg-min(deg))/(0.01+max(deg)-min(deg))+0.2)*scl;
p=plot(h5,'MarkerSize',nSizes,'NodeColor','k','EdgeAlpha',0.9,'layout','force');
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0.5$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS05cc','-dpng');
print(gcf,'Figures\sWS05cc','-djpeg');
%% Random Graph
% Generate a completely random graph by increasing |beta| to its maximum
% value of |1.0|. This rewires all of the edges.
h6 = WattsStrogatz(n,K,1);
figure(6)
plot(h6,'NodeColor','k','EdgeAlpha',0.9,'XData',XData,'YData',YData);
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 1$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS1WL','-dpng');
print(gcf,'Figures\sWS1WL','-djpeg');
%
figure(61)
deg = centrality(h6,cnt);
nSizes = ((0.001+deg-min(deg))/(0.01+max(deg)-min(deg))+0.2)*scl;
p=plot(h6,'MarkerSize',nSizes,'NodeColor','k','EdgeAlpha',0.9,'layout','force');
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 1$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS1','-dpng');
print(gcf,'Figures\sWS1','-djpeg');
%
figure(62)
deg = clustering_coef_bu(h6.adjacency);
nSizes = ((0.001+deg-min(deg))/(0.01+max(deg)-min(deg))+0.2)*scl;
p=plot(h6,'MarkerSize',nSizes,'NodeColor','k','EdgeAlpha',0.9,'layout','force');
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 1$'], ...
    'Interpreter','latex')
print(gcf,'Figures\sWS1cc','-dpng');
print(gcf,'Figures\sWS1cc','-djpeg');
%% Degree Distribution
% The degree distribution of the nodes in the different Watts-Strogatz
% graphs varies. When |beta| is 0, the nodes all have the same degree,
% |2K|, so the degree distribution is just a Dirac-delta function centered
% on |2K|, $\delta(x-2K)$. However, as |beta| increases, the degree
% distribution changes. 
%
% This plot shows the degree distributions for the nonzero values of
% |beta|.
%histogram(degree(h2),'BinMethod','integers','FaceAlpha',0.9);
[f,xi] = ksdensity(degree(h2),'Bandwidth',0.2,'support',[0 n]);
plot(xi,f,'color',[0.9 0 0]);
hold on
%histogram(degree(h3),'BinMethod','integers','FaceAlpha',0.8);
%histogram(degree(h4),'BinMethod','integers','FaceAlpha',0.7);
%histogram(degree(h5),'BinMethod','integers','FaceAlpha',0.6);
[f,xi] = ksdensity(degree(h3),'Bandwidth',0.1,'support',[0 n]);
plot(xi,f,'color',[0.8 0 0]);
%
[f,xi] = ksdensity(degree(h4),'Bandwidth',0.1,'support',[0 n]);
plot(xi,f,'color',[0.7 0 0]);
%
[f,xi] = ksdensity(degree(h5),'Bandwidth',0.1,'support',[0 n]);
plot(xi,f,'color',[0.6 0 0]);
%
[f,xi] = ksdensity(degree(h6),'Bandwidth',0.1,'support',[0 n]);
plot(xi,f,'color',[0.5 0 0]);
hold off
title('Node degree distributions for Watts-Strogatz Model Graphs')
xlabel('Degree of node')
ylabel('Number of nodes')
legend('p = 0.1','p = 0.2','p = 0.3','p = 0.5','p = 1','Location','NorthWest')
print(gcf,'Figures\sdistributionWL','-dpng');
print(gcf,'Figures\sdistributionWL','-djpeg');
%% Clustering Coeff Distribution
[f,xi] = ksdensity(clustering_coef_bu(h.adjacency),'Bandwidth',0.5,'support',[-0.0001 1]);
plot(xi,f,'color',[1 0 0],'Marker','*','MarkerIndices',1:10:length(xi));
hold on
%histogram(degree(h3),'BinMethod','integers','FaceAlpha',0.8);
%histogram(degree(h4),'BinMethod','integers','FaceAlpha',0.7);
%histogram(degree(h5),'BinMethod','integers','FaceAlpha',0.6);
[f,xi] = ksdensity(clustering_coef_bu(h2.adjacency),'Bandwidth',0.5,'support',[-0.0001 1]);
plot(xi,f,'color',[0.9 0 0]);
%
[f,xi] = ksdensity(clustering_coef_bu(h3.adjacency),'Bandwidth',0.5,'support',[-0.0001 1]);
plot(xi,f,'color',[0.8 0 0]);
%
[f,xi] = ksdensity(clustering_coef_bu(h4.adjacency),'Bandwidth',0.5,'support',[-0.0001 1]);
plot(xi,f,'color',[0.7 0 0]);
%
[f,xi] = ksdensity(clustering_coef_bu(h5.adjacency),'Bandwidth',0.5,'support',[-0.0001 1]);
plot(xi,f,'color',[0.6 0 0]);
%
[f,xi] = ksdensity(clustering_coef_bu(h6.adjacency),'Bandwidth',0.5,'support',[-0.0001 1]);
plot(xi,f,'color',[0.5 0 0],'Marker','o','MarkerIndices',1:10:length(xi));
hold off
title('Clustering coefficient distributions for Watts-Strogatz Model Graphs')
xlabel('Clustering Coefficient of node')
ylabel('Number of nodes')
legend('p = 0','p = 0.1','p = 0.2','p = 0.3','p = 0.5','p = 1','Location','NorthWest')
print(gcf,'Figures\sdistributionCC','-dpng');
print(gcf,'Figures\sdistributionCC','-djpeg');
%%
%% APL Distribution
[f,xi] = ksdensity(mean(distances(h)),'Bandwidth',0.5,'support',[0 n]);
plot(xi,f,'color',[1 0 0],'Marker','*','MarkerIndices',1:10:length(xi));
hold on
%histogram(degree(h3),'BinMethod','integers','FaceAlpha',0.8);
%histogram(degree(h4),'BinMethod','integers','FaceAlpha',0.7);
%histogram(degree(h5),'BinMethod','integers','FaceAlpha',0.6);
[f,xi] = ksdensity(mean(distances(h2)),'Bandwidth',0.5,'support',[0 n]);
plot(xi,f,'color',[0.9 0 0]);
%
[f,xi] = ksdensity(mean(distances(h3)),'Bandwidth',0.5,'support',[0 n]);
plot(xi,f,'color',[0.8 0 0]);
%
[f,xi] = ksdensity(mean(distances(h4)),'Bandwidth',0.5,'support',[0 n]);
plot(xi,f,'color',[0.7 0 0]);
%
[f,xi] = ksdensity(mean(distances(h5)),'Bandwidth',0.5,'support',[0 n]);
plot(xi,f,'color',[0.6 0 0]);
%
[f,xi] = ksdensity(mean(distances(h6)),'Bandwidth',0.5,'support',[0 n]);
plot(xi,f,'color',[0.5 0 0],'Marker','o','MarkerIndices',1:10:length(xi));
hold off
title('Average path length distributions for Watts-Strogatz Model Graphs')
xlabel('Average path length of node')
ylabel('Number of nodes')
legend('p = 0','p = 0.1','p = 0.2','p = 0.3','p = 0.5','p = 1','Location','NorthEast')
print(gcf,'Figures\sdistributionAPL','-dpng');
print(gcf,'Figures\sdistributionAPL','-djpeg');

%% Hub Formation
% The Watts-Strogatz graph has a high clustering coefficient, so the nodes
% tend to form cliques, or small groups of closely interconnected nodes. As
% |beta| increases towards its maximum value of |1.0|, you see an
% increasingly large number of hub nodes, or nodes of high relative degree.
% The hubs are a common connection between other nodes and between cliques
% in the graph. The existence of hubs is what permits the formation of
% cliques while preserving a short average path length.
%
% Calculate the average path length and number of hub nodes for each value
% of |beta|. For the purposes of this example, the hub nodes are nodes with
% degree greater than or equal to 55. These are all of the nodes whose
% degree increased 10% or more compared to the original ring lattice.
nt = 2*K;
d = [mean(mean(distances(h))), nnz(degree(h)>=nt), mean(clustering_coef_bu(h.adjacency)); ...
     mean(mean(distances(h2))), nnz(degree(h2)>=nt), mean(clustering_coef_bu(h2.adjacency)); ...
     mean(mean(distances(h3))), nnz(degree(h3)>=nt), mean(clustering_coef_bu(h3.adjacency)); ...
     mean(mean(distances(h4))), nnz(degree(h4)>=nt), mean(clustering_coef_bu(h4.adjacency));...
     mean(mean(distances(h5))), nnz(degree(h5)>=nt), mean(clustering_coef_bu(h5.adjacency));...
     mean(mean(distances(h6))), nnz(degree(h6)>=nt), mean(clustering_coef_bu(h6.adjacency))];
T = table([0 0.1 0.2 0.3 0.50 1]', d(:,1), d(:,2), d(:,3), ...
    'VariableNames',{'Beta','AvgPathLength','NumberOfHubs','ClusteringCoeff'})

%%
% As |beta| increases, the average path length in the graph quickly falls
% to its limiting value. This is due to the formation of the highly
% connected hub nodes, which become more numerous as |beta| increases.
%
% Plot the $p = 0.15$ Watts-Strogatz model graph, making the size and
% color of each node proportional to its degree. This is an effective way
% to visualize the formation of hubs.
colormap hsv
deg = degree(h2);
nSizes = 2*sqrt(deg-min(deg)+0.2);
nColors = deg;
figure(6)
plot(h2,'MarkerSize',nSizes,'NodeCData',nColors,'EdgeAlpha',0.9)
title(['Watts-Strogatz Graph with $N = ',num2str(n),'$ nodes, $K = ',num2str(2*K),'$, and $p = 0.1$'], ...
    'Interpreter','latex')
colorbar

%% 
% Copyright 2012 The MathWorks, Inc.