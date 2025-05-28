import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String api = 'https://dummyjson.com';

  Future<bool> auth(String username, String password) async {
    var res = await http.post(
      Uri.parse(api + '/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(<String, dynamic>{
        'username': username,
        'password': password,
        'expiresInMins': 60,
      }),
    );
    if (res.statusCode == 200) {
      //simpan token ke shared preferences
      String accessToken = convert.jsonDecode(res.body)['accessToken'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', accessToken);
      return true;
    }
    return false;
  }

  Future<dynamic> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) return null;
    var res = await http.get(
      Uri.parse(api + '/auth/me'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (res.statusCode == 200) {
      return convert.jsonDecode(res.body);
    }
    return null;
  }
}
