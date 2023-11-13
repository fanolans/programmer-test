import 'dart:convert';

import 'package:flutter_test_kominfo/data/models/response/user_response_model.dart';

class AuthResponseModel {
  final String jwtToken;
  final User user;

  AuthResponseModel({
    required this.jwtToken,
    required this.user,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        jwtToken: json["jwt-token"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "jwt-token": jwtToken,
        "user": user.toMap(),
      };
}
