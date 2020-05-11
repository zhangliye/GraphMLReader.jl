## load graphml file to MetaGraph Object
file_path = joinpath( dirname( @__DIR__ ), "data/large_traffic_network.graphml" )
G = GraphMLReader.loadgraphml( file_path );
ids = id_dict(G)
weightfield!(G, :length)
w = weights(G)

## load test original vertices IDs
file_path = joinpath( dirname( @__DIR__ ), "data/origin.json" )
origin_ids = JSON.parsefile(file_path)
origin_ids

## prepare StaticGraph and weight matrix
static_G = StaticDiGraph(G.graph)
w_adj = adjacency_matrix( static_G )
w_static = deepcopy(w_adj)
w_static = convert(SparseMatrixCSC{Float64,UInt32}, w_static)
for v in collect(zip(I,J))
    i,j = Int(v[1]), Int(v[2])
    w_static[i,j] = w[i,j]
end

## shortest path of 20 original vertices
ts = []
i = 0
for id_origin in origin_ids[1:20]
    id = ids[ id_origin ]
    t = @belapsed dijkstra_shortest_paths($static_G, [$id], $w_static) samples=3
    push!(ts, t)
    i += 1
    @show i
end

@show sum(ts)/length(ts)