Perceptron brain;
Point[] points = new Point[500];
int trainingIndex = 0;

void setup() {
	size(1000, 1000);
	//initialise the number of inputs in the perceptron
	brain = new Perceptron(3);
	//Initialse the training dataset
	for (int i = 0; i < points.length;i++) {
		points[i] = new Point();    
	}
}

void draw() {
	background(255);
	
	//Actual line.
	Point p1 = new Point(-1, f(-1));
	Point p2 = new Point(1, f(1));
	stroke(0);
	line(p1.pixelX(), p1.pixelY(), p2.pixelX(), p2.pixelY());
	
	//The line that the perceptron think is the actual line.
	Point p3 = new Point(-1, brain.guessY(-1));
	Point p4 = new Point(1, brain.guessY(1));
	stroke(255, 0, 0);
	line(p3.pixelX(), p3.pixelY(), p4.pixelX(), p4.pixelY());
	
	
	for (Point pt : points) {
		float[] inputs = {pt.x, pt.y, pt.bias};
		int target = pt.label;
		int guess  = brain.Guess(inputs); 
		
		pt.show();
		
		if (guess == target) {
		 fill(0,255,0);
		} else {
		 fill(255,0,0); 
		}
		 
		noStroke();
		ellipse(pt.pixelX(), pt.pixelY(), 5, 5);
	}

	Point training = points[trainingIndex];
	float[] inputs = {training.x, training.y, training.bias};
	int target = training.label;
	
	brain.train(inputs, target);
	trainingIndex++;
	
	if (trainingIndex == points.length) {
		trainingIndex = 0;
	}
}
