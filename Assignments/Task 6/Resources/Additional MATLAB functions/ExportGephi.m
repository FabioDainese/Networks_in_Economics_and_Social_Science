% Create a directed graph
s = [1 2 2 3 3 3 4 5 5 5 8 8 9 11 12 15 16 16*ones(1,4)];
t = [2 3 4 1 4 5 5 3 6 7 9 10 10 13 13 16 17 randi([18 25],1,4)];
num=array2table((1:max([s,t]))');
G = digraph(s,t,[],num);
%% Export to csv file
filename = 'digraphEdgeList.csv';
fileID = fopen(filename,'w');
frm='%s %s %s %s\n';
fprintf(fileID,frm,'Source','Target','Type','Id');
elG=table2array(G.Edges); %end nodes, weight
nsel=size(elG,1);
for i=1:nsel
    fprintf(fileID,frm,num2str(elG(i,1)),num2str(elG(i,2)),'Directed',num2str(i));
    f=waitbar(i/nsel);
end
close(f);
fclose(fileID);
%%
filename = 'digraphNodeList.csv';
fileID1 = fopen(filename,'w');
frm='%s, %s\n';
fprintf(fileID1,frm,'id','label');
noG=table2array(G.Nodes);
n=size(noG,1);
for i=1:n
    fprintf(fileID1,frm,num2str(i),num2str(noG(i)));
    f=waitbar(i/n);
end
close(f);
fclose(fileID1);

