class Product {
  List<String> parts = [];

  void addPart({required String part}) {
    parts.add(part);
  }

  String showPart() {
    String result = 'Product components are: ';
    for (var item in parts) {
      result += '$item \n';
    }
    return result;
  }
}
