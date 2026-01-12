import 'dart:convert';

import 'package:w3_noparuj_22/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<User>> fetchUser() async {
    final response = await http.get(
      Uri.parse("https://696457ebe8ce952ce1f17047.mockapi.io/users"),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => User.fromJson(e)).toList();
    }else{
      throw Exception('Load data not success');
    }

    return fetchUser();
  }
}
