using GraphMLReader
using BenchmarkTools
using Printf

file_path = joinpath( dirname( @__DIR__ ), "data/large_traffic_network.graphml" )
t = @belapsed GraphMLReader.loadgraphml($file_path) samples=3 
println( @sprintf( "Time of reading large_traffic_network.graphml: %.4f sec", t ) )