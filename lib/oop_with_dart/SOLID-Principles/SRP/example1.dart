/// Correct Example:
// This class has a single responsibility: to represent a circle with a given radius
class Circle {
  final double radius;

  Circle(this.radius);

  double calculateArea() {
    return 3.14 * radius * radius;
  }
}

/// Incorrect Example:
// This class has multiple responsibilities: to represent a circle, store its properties, and handle file I/O
/*
class Circle {
  final double radius;

  Circle(this.radius);

  double calculateArea() {
    return 3.14 * radius * radius;
  }

  void saveToFile(String fileName) {
      code to save circle properties to a file
  }

  Circle readFromFile(String fileName) {
     code to read circle properties from a file and return a Circle instance
  }
}
*/
