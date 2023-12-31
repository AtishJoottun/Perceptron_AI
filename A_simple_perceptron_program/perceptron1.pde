  //The activation function or threshold function
int sign (float n) {
 if (n >= 0) {
   return 1;
 } else {
  return -1;
 }
}

class Perceptron {
   
  float[] weights = new float[2];
  float learningRate = 0.1;
  
  Perceptron() {
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
  
}
