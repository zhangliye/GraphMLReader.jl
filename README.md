# GraphMLReader.jl
Read GraphML file to a MetaGraph.

# What GraphMLRead.jl does?
Step1: Read the xml file.  
Step2: Create a MetaGraph/MetDiGrap and add vertice in ascending order with `Int` vertice ID. Save the original id of the vertice to node attribute `:original_id`.       
Step3: Save vertice attribtes and edge attributes to MetaGraph/MetaGraph. 

# How to use

Load GraphML file to a MetaGraph object
```
file_path = joinpath( "data/large_traffic_network.graphml" )
G = loadgraphml( file_path ) # return a MetaGraph object
```

Get the attributes of the nodes
```
node_fields(G)
```

Get the attribute of the edges
```
edge_fields(G)
```

Get the dict of the old id 
```
ids = gmlid2metaid(G) #{od_id=>new_id, ...}
```

# benchmark of the shortest path 
```
Test data: "data/large_traffic_network.graphml" 
Graph size,
node number: 109,743  
edge number: 379,474
```

### Shortest path speed
|                                      | networkx     | LightGraphs.jl |  StaticGraph.jl  |
|---                                  |---                  |---                    |---                      |
| Dijkstra Shortest path  | 0.706s          | 0.3538s          | 0.0502s            |
| Speedup && networkx| 1                   | 2.0X                | 14.1X               |


### Load data speed
|           | Python3+networkx   | Julia1.4 + GraphMLReader   | 
|---        |---                 |---                         |
| Load data | 9.77s              | 12.03s                     |   
