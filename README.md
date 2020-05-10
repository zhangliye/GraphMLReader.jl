# GraphMLReader.jl
Read GraphML file to a MetaGraph.

Load GraphML file to a MetaGraph object
`file_path = joinpath( "data/large_traffic_network.graphml" )`
`g = loadgraphml( file_path ) # return a MetaGraph object`

Get the attributes of the nodes
`node_fields(G)`

Get the attribute of the edges
`edge_fields(G)`

Get the dict of the old id 
`ids = id_dict(G) #{od_id=>new_id, ...}`

# benchmark of the shortest path 
Test data: "data/large_traffic_network.graphml"
Graph size: 
node number - 109,743  
edge number - 379,474

|                | Python3  | Julia1.4  | 
|---             |---|---|---|---|
| Load data      | 9.77s    | 12.03s  |   
| Dijkstra Shortest path  | 0.706s   | 0.354s  |  


### python3, networkx 

#### Load data
`import networkx as nx`
`import json`
`import timeit`
`import time`
`g_file = "data/large_traffic_network.graphml"`
`%timeit G = nx.read_graphml( g_file )`

9.77 s ± 136 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

#### shortest path
`for id in origin_ids[:20]:`
`   %timeit -r 1 path = nx.shortest_path(G, source=id, weight='length')`

704 ms ± 4.83 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
703 ms ± 9.2 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
682 ms ± 7.49 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
700 ms ± 15 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
693 ms ± 11 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
711 ms ± 5.9 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
746 ms ± 22 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
712 ms ± 19.1 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
691 ms ± 5.29 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
679 ms ± 3.26 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
690 ms ± 2.31 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
712 ms ± 12.6 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
710 ms ± 3.44 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
691 ms ± 3.24 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
656 ms ± 4.05 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
718 ms ± 23.5 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
713 ms ± 18.4 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
717 ms ± 12.2 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
744 ms ± 24 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
752 ms ± 5.02 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

### Julia, lightgraphs

#### Load data
`using LightGraphs`
`using MetaGraphs`
`using GraphMLReader`
`using JSON`

`g_file = "data/large_traffic_network.graphml"`
`@btime G = GraphMLReader.loadgraphml(g_file);`

12.003 s (93944749 allocations: 2.95 GiB)

#### Shortest path
`for id_origin in origin_ids[1:20]`
`    id = ids[ id_origin ]`
`    @time rst = dijkstra_shortest_paths(G, [id], w)`
`end`

0.685092 seconds (491 allocations: 6.737 MiB)
  0.326103 seconds (464 allocations: 6.735 MiB)
  0.343768 seconds (384 allocations: 6.740 MiB)
  0.324103 seconds (426 allocations: 6.746 MiB)
  0.339331 seconds (378 allocations: 6.739 MiB)
  0.332866 seconds (380 allocations: 6.726 MiB)
  0.339515 seconds (323 allocations: 6.719 MiB)
  0.395761 seconds (38.32 k allocations: 8.672 MiB, 11.75% gc time)
  0.335274 seconds (344 allocations: 6.721 MiB)
  0.326692 seconds (424 allocations: 6.741 MiB)
  0.327877 seconds (425 allocations: 6.730 MiB)
  0.328120 seconds (386 allocations: 6.726 MiB)
  0.343189 seconds (371 allocations: 6.724 MiB)
  0.346684 seconds (357 allocations: 6.738 MiB)
  0.348420 seconds (416 allocations: 6.729 MiB)
  0.332005 seconds (333 allocations: 6.736 MiB)
  0.322998 seconds (341 allocations: 6.721 MiB)
  0.332552 seconds (396 allocations: 6.743 MiB)
  0.319058 seconds (545 allocations: 6.743 MiB)
  0.327623 seconds (341 allocations: 6.721 MiB)










