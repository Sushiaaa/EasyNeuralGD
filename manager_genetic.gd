class_name GeneticAlgorithm

extends Object

var networks:Array = []

func _init(network_amount:int, input_width: int, output_width: int, hidden_layer_depth: int = 0, hidden_layer_width: int = 1):
	for i in range(network_amount):
		networks.append(NeuralNetwork.new(input_width, output_width, hidden_layer_depth, hidden_layer_width));

func calculate_networks(activation_function):
	for network in networks:
		for i in range(len(network.weights)):
			network.network[i+1] = network.calculate_output(network.network[i], network.weights[i], network.biases[i], activation_function);

# this doesnt work yet
func generate_next_generation():
	var temp:float;
	for network in range(len(networks)):
		var value_to_sort = networks[network].fitness;
		
		while networks[network-1].fitness > value_to_sort and network>0:
			temp = networks[network-1].fitness;
			networks[network].fitness = networks[network-1].fitness;
			networks[network-1].fitness = temp;
			network-=1;
	var length:int = len(networks);
	networks = networks.slice(0, len(networks)/2);
	if length-len(networks) % 2 != 0:
		networks.append(networks[0]);
	for i in range(length-len(networks)):
		networks.append(networks[i]);
		
func mutate_random_neuron(network:NeuralNetwork):
	print("doesnt exist yet");
