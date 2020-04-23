s = [1 2 2 3 3 3 4 5 5 5 8 8 9 11 12 15 16 16*ones(1,4)];
t = [2 3 4 1 4 5 5 3 6 7 9 10 10 13 13 16 17 randi([18 25],1,4)];
G = digraph(s,t,[],25);
A=full(G.adjacency);
%%%%%%%% Plot the Adjacency matrix
figure(1)
spy(A);
%%%%%%%% Plot the Network
figure(2)
plot(G,'Layout','layered')
%%%%%%%% Find the connected component
[bin,binsize] = conncomp(G,'Type','weak');
% Use binsize to find the Giant component
idx = binsize(bin) == max(binsize);
figure(4)
hist(binsize(bin));
% Select the Giant component
SG = subgraph(G, idx);
figure(5)
plot(SG)