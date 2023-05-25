import 'package:equatable/equatable.dart';

class UserDataModel extends Equatable {
  final int id;
  final String name;
  final int weight;

  const UserDataModel(
      {required this.id, required this.name, required this.weight});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "weight": weight,
    };
  }

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json["id"],
      name: json["name"],
      weight: json["weight"],
    );
  }

  @override
  List<Object?> get props => [id, name, weight];
}
