  //The activation function or threshold function
int sign (float n) {
 if (n >= 0) {
   return 1;
 } else {
  return -1;
 }
}

class Perceptron {
   
  float[] weights;
  float learningRate = 0.0019;
  
  Perceptron(int n) {
    weights = new float[n];
    //initialise the weights randomly
    for (int i = 0; i < weights.length;i++) {
      weights[i] = random(-1,1);
    }
    
  }
  
  int Guess(float[] inputs) {
    float sum = 0;
    
    for (int i = 0; i < weights.length;i++) {
        sum += inputs[i] * weights[i]; 
    }   
    int output = sign(sum);   
    return output;    
  }
  
  void train(float[] inputs, int target) {
    int guess = Guess(inputs);
    int error = target - guess;
    
    //Tune the weights
    for (int i = 0; i < weights.length; i++) {
     weights[i] += error * inputs[i] * learningRate;
    }   
  }
  
  float[] displayWeights() {
    return weights;
  } 
  
  
  float guessY(float x) { 
    return -(weights[2] / weights[1]) - (weights[0] / weights[1]) * x;
  }
}
