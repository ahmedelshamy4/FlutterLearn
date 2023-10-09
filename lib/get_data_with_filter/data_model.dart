import 'package:equatable/equatable.dart';

class MyDataModel extends Equatable {
  final String name;
  final String category;

  const MyDataModel({
    required this.name,
    required this.category,
  });

  @override
  List<Object?> get props => [
        name,
        category,
      ];
}

List<MyDataModel> allData = [
  const MyDataModel(name: 'Item 1', category: 'Category A'),
  const MyDataModel(name: 'Item 2', category: 'Category B'),
  const MyDataModel(name: 'Item 3', category: 'Category A'),
  const MyDataModel(name: 'Item 4', category: 'Category C'),
  const MyDataModel(name: 'Item 5', category: 'Category B'),
];
