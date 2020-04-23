ExportToGephi.m                export (directed) graphs to .csv for Gephi

UndirectedGraphDegree.m        simulate a radom graph
                               plot graph
                               graph degree
                               compare degree distribution

UndirectedGraphExport.m        simulate a radom graph
                               plot graph
                               graph statistics
                               export graph

DirectedGraphStatistics.m       load a directed graph
                                plot graph
                                graph statistics

DirectedGraphGiantComponent.m  build a directed graph
                               plot graph
                               find connected components
                               find giant component
                               extract subgraph and plot

SmallWorldGraph.m              build a Watts-Strogatz small world graph
                               study the degree distribution
                               study the average path length

SmallWorldGraphWithouLayout.m  same as SmallWorldGraph.m but 
                               with different layout of the graph 
                               and clustering coefficient calculation

ScaleFreeGraph.m               build a Barabasi-Albert scale free graph
                               study the degree distribution

ScaleFreeGraphGrow.m           build a Barabasi-Albert scale free graph
                               study the graph growing over time

ScaleFreeGraphLayout.m         build small Barabasi-Albert scale free graph
                               study the degree distribution

ScaleFreeGraphLayoutBig.m      build large Barabasi-Albert scale free graph
                               study the degree distribution

-------------------------------------- functions
AlbertBarabasi.m                  generate BA graph
ErdosRenyi.m                      generate ER graph
WattsStrogatz.m                  generate WS graph

--------------------------------------- folder BCT
a library for network analysis, I am using it to evaluate the clustering coefficient