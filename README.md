# GraphMLReader.jl
Read GraphML file to a MetaGraph.

## load GraphML file to a MetaGraph object
file_path = joinpath( "/data/large_traffic_network.graphml" )
g = loadgraphml( file_path ) # return a MetaGraph object

#Get the attributes of the nodes
node_fields(G)

#Get the attribute of the edges
edge_fields(G)

#Get the dict of the old id 
ids = id_dict(G) #{od_id=>new_id, ...}

