# GraphMLReader.jl
Read GraphML file to a MetaGraph.

Load GraphML file to a MetaGraph object
```
file_path = joinpath( "data/large_traffic_network.graphml" )
g = loadgraphml( file_path ) # return a MetaGraph object
```

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
```import networkx as nx
import json
import timeit
import time
g_file = "data/large_traffic_network.graphml"
%timeit G = nx.read_graphml( g_file )```

9.77 s ± 136 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

#### shortest path
`for id in origin_ids[:20]:`
`   %timeit -r 1 path = nx.shortest_path(G, source=id, weight='length')`

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












