using Printf

@testset "Load file" begin
    file_path = "test_data/large_traffic_network.graphml"
    t = @belapsed GraphMLReader.loadgraphml($file_path) samples=3 
    println( @sprintf( "Time of reading large_traffic_network.graphml: %.4f sec", t ) )
end