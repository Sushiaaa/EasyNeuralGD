# EasyNeuralGD
Library used to easily set up neural networks in Godot 4
This library is still very bare-bones and will receive updates in the near future
___
## Classes
- <b>NeuralNetwork:</b> A basic neural network which has an input layer, an output layer and optionally hidden layers, all of variable size
- <b>GeneticAlgorithm:</b> Class which houses multiple networks for easy training
  
## NeuralNetwork Class
### Methods
- <b>_init</b>
    - takes 2-4 variables, <b>input_width</b>, representing the number of neurons in the input layer, <b>output_width</b>, representing the number of neurons in the output layer, <b>hidden_layer_depth</b>,representing the amount of hidden layers, and <b>hidden_layer_width</b>, representing the amount of neurons in each hidden layer. The amount of neurons is not yet variable between the hidden layers.
- <b>generate_weights</b>
    - takes 2 variables, <b>min_value</b> and <b>max_value</b>, to randomly generate weights.
- <b>generate_biases</b>
  - takes 2 variables, <b>min_value</b> and <b>max_value</b>, to randomly generate biases.
- <b>calculate_output</b>
    - takes 4 variables, <b>layer</b>, <b>weights</b>, <b>biases</b> and optionally <b>activation_function</b> to calculate the values of the next layer and return them. The standard activation function is "ReLU", but can be changed by setting activation_function to "sigmoid" or "binary_step"
 
## GeneticAlgorithm Class
### Methods
- <b>_init</b>
    - takes 3-5 variables, the first one being <b>network_amount</b>, representing the amount of networks created. The other variables are for the _init() method of the <b>NeuralNetwork</b> class
- <b>generate_next_generation</b>
    - eliminates the networks with the lowest fitness variable and duplicates the remaining ones
### Examples for these functions are in the test.gd script
