module GraphMLReader
using EzXML
using LightGraphs
using MetaGraphs

export loadgraphml,
    node_fields, edge_fields,
    check_node_fields, check_edge_fields,
    id_dict

include("graphml.jl")
include("util.jl")
end # module
