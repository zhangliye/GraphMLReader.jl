
@testset "file loader" begin
    #"load graphml file to MetaGraph Object" begin
    file_path = "test_data/large_traffic_network.graphml"
    G = GraphMLReader.loadgraphml(file_path);
    ids = gmlid2metaid(G)
    weightfield!(G, :length)
    w = weights(G)

    #"shortest path of 20 original vertices" begin
    file_path = "test_data/origin.json"
    origin_ids = JSON.parsefile(file_path)
    
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
    
end
