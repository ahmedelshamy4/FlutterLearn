import 'dart:convert';

List<ApiPostResult> apiPostResultFromJson(String str) => List<ApiPostResult>.from(
    json.decode(str).map((x) => ApiPostResult.fromJson(x)));

class ApiPostResult {
  int? userId;
  int? id;
  String? title;
  String? body;

  ApiPostResult({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory ApiPostResult.fromJson(Map<String, dynamic> json) => ApiPostResult(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}
