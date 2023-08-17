Perceptron brain;

Point[] points = new Point[1000];

void setup() {
  size(1000, 1000);
  
  brain = new Perceptron();
  
  for (int i = 0; i < points.length;i++) {
    points[i] = new Point();    
  }
  
  
  float[] inputs = {-1, 0.5};
  
  int guess = brain.Guess(inputs);
  
  println(guess);
}

void draw() {
  
  background(255);
  stroke(0);
  line(0, 0, width, height);
  
  for (Point pt : points) {
   pt.show(); 
    
  }
  
  for (Point pt : points) {
    float[] inputs = {pt.x, pt.y};
    int target = pt.label;
    //brain.train(inputs, target);
    
    int guess  = brain.Guess(inputs);
    if (guess == target) {
     fill(0,255,0);
    } else {
     fill(255,0,0); 
    }
    noStroke();
    ellipse(pt.x, pt.y, 5, 5); 
  }
  
  
}

void mousePressed(){
    for (Point pt : points) {
      float[] inputs = {pt.x, pt.y};
      int target = pt.label;
      brain.train(inputs, target);
    
    }
  
  println(brain.displayWeights());
}
