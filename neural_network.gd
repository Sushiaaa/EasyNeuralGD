class_name NeuralNetwork

extends Object

var network: Array = [];
var weights: Array = [];
var biases: Array = [];
var fitness:float=0;

# width is the number of neurons in each layer; depth is the number of layers
func _init(input_width: int, output_width: int, hidden_layer_depth: int = 0, hidden_layer_width: int = 1):
	assert(input_width>=1, "ERROR: Invalid value for variable 'input_width'. Please provide a positive integer value");	
	assert(output_width>=1, "ERROR: Invalid value for variable 'output_width'. Please provide a positive integer value");
	assert(hidden_layer_depth>=0, "ERROR: Invalid value for variable 'hidden_layer_depth'. Please provide a non-negative integer value");
	if hidden_layer_depth>=1:
		assert(hidden_layer_width>=1, "ERROR: Invalid value for variable 'hidden_layer_width'. Please provide a positive integer value");

	network.append([])
	for i in input_width:
		network[0].append(0);
	for hidden_depth in hidden_layer_depth:
		network.append([]);
		for hidden_width in hidden_layer_width:
			network[hidden_depth+1].append(0);
	network.append([])
	for o in output_width:
		network[-1].append(0);

func generate_weights(min_value: float = -1, max_value: float = 1):
	for layer in range(len(network.slice(1))):
		weights.append([]);
		for neuron in network.slice(1)[layer]:
			for previous_neuron in network[layer]:
				weights[layer].append(randf_range(min_value, max_value));

func generate_biases(min_value: float = -1, max_value: float = 1):
	for layer in range(len(network.slice(1))):
		biases.append([]);
		for neuron in network.slice(1)[layer]:
			biases[layer].append(randf_range(min_value, max_value));

func calculate_output(layer: Array, weights: Array, biases: Array, activation_function:String="ReLU"):
	var out: Array = [];
	for i in range(len(weights)/len(layer)):
		out.append(biases[i]);
	for input in range(len(layer)):
		# probably doable without the counter
		var counter=0;
		for weight in weights.slice(input, 2147483647, len(layer)):
			out[counter]+=layer[input]*weight;
			counter+=1;
	
	if activation_function=="ReLU":
		for output in range(len(out)):
			if out[output] <= 0:
				out[output] = 0;
	elif activation_function == "binary_step":
		for output in range(len(out)):
			if out[output] >= 0:
				out[output] = 1;
			else:
				out[output] = 0;
	elif activation_function == "sigmoid":
		for output in range(len(out)):
			1/(1+2.71828**-(1*(out[output])));
	return out;
