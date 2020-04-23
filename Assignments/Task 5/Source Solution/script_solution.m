clear all;
clc;

n = 400;
K = 10;

q_cumulative = (0.01:0.01:1)';
q_length = size(q_cumulative,1);
storage = zeros(q_length,2);

for j=1:q_length
    q = q_cumulative(j,1);
    WS = WattsStrogatz(n,K,q);
    cc = clustering_coef_bu(WS.adjacency);
    
    storage(j,1) = mean(cc);
    storage(j,2) = mean(distances(WS),'all');
end

figure(1)
plot(q_cumulative,storage(:,1),'k-');
title('CC(q)');
xlabel('Re-wiring probability');
ylabel('Clustering coefficient');
set(gca, 'XScale', 'log')


figure(2)
plot(q_cumulative,storage(:,2),'k-');
title('APL(q)');
xlabel('Re-wiring probability');
ylabel('Average path length');
set(gca, 'XScale', 'log')


