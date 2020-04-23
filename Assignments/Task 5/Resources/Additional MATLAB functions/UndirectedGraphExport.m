clc;
clear all;
% generate a radom graph
n=50;                        % number of nodes
p=0.1;
rm=triu(rand(n,n)<p);  % iid bernulli random variables
A=rm+rm';                 % symmetric adjacency matrix
A=A-diag(diag(A));     % remove self-loop
G=graph(A);
%%%%%%%% Network statistics
bt = centrality(G,'betweenness');
eg = centrality(G,'eigenvector');
de=degree(G);
%%%%%%%% Plot the Network
figure(1)
pp=plot(G,'NodeLabel',{},'NodeColor',[0.93 0 0],'EdgeAlpha',0.1); 
layout(pp,'force','UseGravity',true);
w=(1+bt)/max(bt)*10;
pp.MarkerSize=w;
w=(1+de)/max(de)*10;
%%
%pp.NodeCData=w;
figure(2)
pp=plot(G,'NodeLabel',{},'NodeColor',[0.93 0 0],'Layout','force','EdgeAlpha',0.1); 
w=(1+bt)/max(bt)*10;
pp.MarkerSize=w;
w=(1+de)/max(de)*10;

%% Export to csv file
filename = 'EdgeList.csv';
fileID = fopen(filename,'w');
frm='%s %s %s %s %s\n';
fprintf(fileID,frm,'Source','Target','Weight','Type','Id');
    elG=table2array(G.Edges); %end nodes, weight
    nsel=size(elG,1);
    for i=1:nsel
        fprintf(fileID,frm,num2str(elG(i,1)),num2str(elG(i,2)),num2str(elG(i,3)),'Undirected',num2str(i));
    waitbar(i/nsel);
    end
fclose(fileID);
%%
filename = 'NodeList.csv';
fileID1 = fopen(filename,'w');
frm='%s,%s,%s\n';
fprintf(fileID1,frm,'id','label','partition');
for i=1:n
    fprintf(fileID1,frm,num2str(i),num2str(i),num2str(1));
    waitbar(i/n);
end
fclose(fileID);
