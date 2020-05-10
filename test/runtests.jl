using GraphMLReader

file_path = joinpath( dirname( @__DIR__ ), "data/small.graphml" )
g = loadgraphml(file_path, "G")

file_path = joinpath( dirname( @__DIR__ ), "data/large_traffic_network.graphml" )
g = loadgraphml( file_path )