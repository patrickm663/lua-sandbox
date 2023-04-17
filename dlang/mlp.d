import std.math;
import std.file;
import std.random;
import std.stdio;
import std.array;
import std.conv;
import std.csv;
import std.algorithm;
import std.string;

struct Neuron {
    float[] weights;
    float bias;
}

float sigmoid(float x) {
    return 1.0 / (1.0 + exp(-x));
}

int transform_output(float x) {
    if(x > 0.5) return 1;
		return(0);
}

float dotProduct(float[] a, float[] b) {
    float sum = 0.0;
    foreach (i; 0..a.length) {
        sum += a[i] * b[i];
    }
    return sum;
}

float feedforward(float[] inputs, Neuron neuron) {
    float net = dotProduct(inputs, neuron.weights) + neuron.bias;
    float output = sigmoid(net);
    return output;
}

float log_transform(float x) {
    return(log(x+1.0f));
}

float[][] read_csv(string filename) {
    auto file_data = readText(filename);
		auto csv_data = file_data
						.chomp
						.splitter('\n')
						.map!(
								a => a
								     .splitter(',')
										 .array
								)
						.array;
		float[][] data_float = csv_data
						.map!(
								a => a.map!(
								    b => b
										     .canFind('.') ? b.to!float : b == "bad\r" ? 0.0f : 1.0f
												 )
								.array
								)
						.array;
    return data_float;
}

void main() {
    // Define the input data
    float[][] data = read_csv("wine.csv");
    // Extract the input data and expected output
    auto rows = data.length;
		auto cols = data[0].length;
    float[][] input_data = new float[][](rows, cols-1);
    int[] expected_output = new int[](rows);
		foreach (i; 0..rows) {
        foreach (j; 0..cols) {
            if (j == cols-1) {
                expected_output[i] = data[i][cols-1].to!int;
						} else {
                input_data[i][j] = log_transform(data[i][j].to!float);
						}
				}
		}
		auto n_features = input_data[0].length;

    // Define the neuron
    Neuron neuron;
    neuron.weights = new float[](n_features);
		foreach (i; 0..n_features) {
        neuron.weights[i] = uniform(-1.0, 1.0);
		}
    neuron.bias = uniform(-1.0, 1.0);

    // Train the neuron
    float learning_rate = 0.2;
		int epochs = 1000;
		foreach (epoch; 0..epochs){
        foreach (i; 0..input_data.length) {
            float output = feedforward(input_data[i], neuron);
            float error = expected_output[i].to!float - output;
            foreach (j; 0..neuron.weights.length) {
                neuron.weights[j] += learning_rate * error * output * (1 - output) * input_data[i][j];
            }
            neuron.bias += learning_rate * error * output * (1 - output);
        }
		}

    // Print the final neuron weights and bias
    writeln("Final weights: ", neuron.weights);
    writeln("Final bias: ", neuron.bias);
    int[] actual_output = new int[](rows);
		foreach(i; 0..rows){
        actual_output[i] = transform_output(feedforward(input_data[i], neuron));
		}
		int[][] confusion_matrix = [
        [0, 0],
        [0, 0],
		];
		foreach(i; 0..rows){
				if(expected_output[i] == actual_output[i]){
				    if(expected_output[i].to!int == 0){
                confusion_matrix[0][0] += 1;
						}else{
                confusion_matrix[1][1] += 1;
						}
				}else{
				    if(expected_output[i].to!int == 0){
                confusion_matrix[1][0] += 1;
						}else{
                confusion_matrix[0][1] += 1;
						}
				}
		}
    writeln("Confusion Matrix: ");
		confusion_matrix.writeln;
		expected_output[0..10].writeln;
		actual_output[0..10].writeln;

}

