extends Node2D

func _ready():
	# this network has 3 input layers, 2 output layers, 5 hidden layers at 4 neurons each 
	var network = NeuralNetwork.new(3, 2, 5, 4);
	# to change the inputs, you need to access network.network[0]
	# these functions are not neccessary, if you want to write the weights and biases yourself
	network.generate_weights();
	network.generate_biases();
	# this iterates through the whole network and always calculates the next layer until it arrives at the output layer
	for i in range(len(network.weights)):
		network.network[i+1] = network.calculate_output(network.network[i], network.weights[i], network.biases[i]);
	# [-1] if you just want to get the output layer
	print(network.network[-1]);
	
