using GraphMLReader

# set_prop!(mg, Edge(1, 2), :action, "knows")
# g_file = "/Users/zhangliye/julia_dev/graphmlio/data/g.xml"
# g_file = "/Users/zhangliye/OneDrive/paper_data/paper20-umgc-m4-cycling-routing/stronglyconRoadnetwork.graphml"
#g_file = "/Users/zhangliye/OneDrive/paper_data/paper20-umgc-m4-cycling-routing/multimode_network.graphml"

g = loadgraphml(g_file)


@show g