% Graphi visualization in MATLAB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load the data in mathworks100.mat and view the adjacency matrix, A. 
% This data was generated in 2015 using an automatic page crawler. 
% The page crawler began at https://www.mathworks.com and followed links 
% to subsequent web pages until the adjacency matrix contained information on the 
% connections of 100 unique web pages.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear all;
load mathworks100.mat 
%%%%%%%% Plot the Adjacency matrix
figure(1)
spy(A);
%%%%%%%% build a directed graph (digraph)
G = digraph(A,U); 

%%%%%%%% Network statistics
n=G.numnodes;      %number of nodes
e=G.numedges;      %number of edges

%pr = centrality(G,'pagerank','MaxIterations',200,'FollowProbability',0.85);
bt = centrality(G,'betweenness');
id=indegree(G);
od=outdegree(G);
G.Nodes.Betweennees = bt;
G.Nodes.InDegree = id;
G.Nodes.OutDegree = od;

%%%%%%%% Plot the Network
figure(2)
plot(G,'NodeLabel',{},'NodeColor',[0.93 0 0],'Layout','force');

%%%%%%%% Plot the Network with Node size
figure(12)
pp=plot(G,'NodeLabel',{},'NodeColor',[0.93 0 0],'Layout','force');
w=(1+id)/(n*(n-1));
pp.MarkerSize=w/max(w)*4;
title('In degree');

figure(13)
pp=plot(G,'NodeLabel',{},'NodeColor',[0.93 0 0],'Layout','force');
w=(1+od)/(n*(n-1));
pp.MarkerSize=w/max(w)*4;
title('Out degree');

figure(14)
pp=plot(G,'NodeLabel',{},'NodeColor',[0.93 0 0],'Layout','force');
w=(1+bt)/(n*(n-1));
pp.MarkerSize=w/max(w)*4;
title('Betweenness');
