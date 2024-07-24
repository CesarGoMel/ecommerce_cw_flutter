import 'dart:convert';
import 'package:ecommerce_cw_flutter/src/domain/models/AuthResponse.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_cw_flutter/src/data/api/ApiConfig.dart';


class Authservice {

  Future <AuthResponse> login(String email, String password) async {
    try {
      //http://192.168.10.14:3000/auth/login/
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/auth/login');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode({
        'email': email,
        'password': password,
      });
      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return authResponse;
    } catch(e) {
      print('Error: $e');
      return AuthResponse.fromJson({});
    }
  }
}