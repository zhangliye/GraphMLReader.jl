## load graphml file to MetaGraph Object
file_path = joinpath( dirname( @__DIR__ ), "data/large_traffic_network.graphml" )
G = GraphMLReader.loadgraphml(file_path);
ids = id_dict(G)
weightfield!(G, :length)
w = weights(G)

## load test original vertices IDs
file_path = joinpath( dirname( @__DIR__ ), "data/origin.json" )
origin_ids = JSON.parsefile(file_path)

## shortest path of 20 original vertices
ts = []
i = 0
for id_origin in origin_ids[1:20]
    id = ids[ id_origin ]
    t = @belapsed dijkstra_shortest_paths($G, [$id], $w) samples=3
    push!(ts, t)
    i += 1
    @show i
end

@show sum(ts)/length(ts)