clear all;
clc;
% generate a radom graph
n=500;                        % number of nodes
%m0=round(n/2);
%m=round(m0/2);                         % between 2 and m0-1
%cnt='eigenvector';
cnt='degree';
%%
%figure(1)
m0=50;
m=40;
Acum=AlbertBarabasiMdf(n, m0, m);
dg=zeros(n-m0,1);
q0=zeros(n-m0,1);
q1=zeros(n-m0,1);
q2=zeros(n-m0,1);
q3=zeros(n-m0,1);
q0P=zeros(n-m0,1);
q1P=zeros(n-m0,1);
q2P=zeros(n-m0,1);
q3P=zeros(n-m0,1);
de=zeros(n-m0,1);
clu=zeros(n-m0,1);
for i=m0+1:n
    G=graph(squeeze(Acum(i-m0,1:i,1:i)));
    cc=centrality(G,cnt);
    dg(i-m0,1)=mean(cc);
    q0(i-m0,1)=quantile(cc,0.05);
    q1(i-m0,1)=quantile(cc,0.10);
    q2(i-m0,1)=quantile(cc,0.90);
    q3(i-m0,1)=quantile(cc,0.95);
    de(i-m0,1)=(sum(cc)/(i*(i-1)))*2;
    %
    q0P(i-m0,1)=icdf('poisson',0.05,dg(i-m0,1));
    q1P(i-m0,1)=icdf('poisson',0.10,dg(i-m0,1));
    q1P(i-m0,1)=icdf('poisson',0.90,dg(i-m0,1));
    q3P(i-m0,1)=icdf('poisson',0.95,dg(i-m0,1));
    %
    clu(i-m0,1)=mean(clustering_coef_bu(G.adjacency));
end
%%
figure(1)
plot(dg,'k-');
hold on;
%plot(q0,'r-');
fill([(1:n-m0), flip((1:n-m0))],[q0',flip(q3)'],[0.9,0.9,0.9],'linestyle','--');
fill([(1:n-m0), flip((1:n-m0))],[q0P',flip(q3P')],[0.8,0.8,0.8],'linestyle','--');
%plot(q3,'r-');
hold off;
ylim([0, 300]);
legend('BA and ER degree mean','BA degree quantile at 0.90 Interquantile range','ER degree quantile at 0.90 Interquantile range');
print(gcf,'Figures\BAdeg','-dpng');
print(gcf,'Figures\BAdeg','-djpeg');
%%
figure(2)
plot(de);
%%
figure(3)
plot(clu);

%G=graph(A);
%pp=plot(G,'EdgeAlpha',0.1);
%pp=plot(G,'EdgeAlpha',0.01,'layout','circle');

%pp=plot(G,'EdgeAlpha',0.1,'layout','force','Iterations',10,'UseGravity',true);

%plot(G,'EdgeAlpha',0.1,'layout','force','Iterations',10);
%pp=plot(G,'EdgeAlpha',0.1,'layout','subspace','Dimension',n/2);
%pp=plot(G,'EdgeAlpha',0.1,'layout','subspace3');

%dg=centrality(G,cnt).^(1/n);
%wdg=((dg-min(dg))/(max(dg)-min(dg))+0.01)*5;
%pp.MarkerSize=wdg;
%title(['Node degree distributions for Barabasi-Albert','$(N=',num2str(n,3),', m= ',num2str(m,2),', m_0= ',num2str(m0,2),')$'],'interpreter','latex')
%print(gcf,'Figures\BA5_4','-dpng');
%print(gcf,'Figures\BA5_4','-djpeg');