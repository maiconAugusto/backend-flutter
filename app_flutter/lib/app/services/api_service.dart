import 'dart:convert';
import 'package:app_flutter/app/models/user_model.dart';
import 'package:app_flutter/app/models/user_post_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://192.168.0.213:8000';

  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users'));
      List<dynamic> data = json.decode(response.body);
      return data.map((userJson) => UserModel.fromJson(userJson)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserPostModel>> fetchUserPosts({required int userId}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/user-posts/$userId'));
      List<dynamic> data = json.decode(response.body);
      return data.map((userJson) => UserPostModel.fromJson(userJson)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
