import 'package:ecommerce_cw_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_cw_flutter/src/domain/models/AuthResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Authservice {
  Future<AuthResponse> login(String email, String password) async {
    try{
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, 'auth/login');
      Map<String, String> headers = {"Content-Type": "application/json" };
      String bodyParams = json.encode({
        'email': email,
        'password' : password
      });
      final response = await http.post(url, headers: headers, body: bodyParams); 
      final data = json.decode(response.body);
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return authResponse;



  } catch (e){
    print('Error: $e' );
    return AuthResponse.fromJson({}); 
  }
}
}