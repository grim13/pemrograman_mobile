import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ReqService {
  String api = 'https://crudcrud.com/api/6dda15298b294cb9b46d6e9d3218044f';

  Future<http.Response> get(String _url) async {
    var res = await http.get(
      Uri.parse(api + _url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return res;
  }

  Future<http.Response> post(String _url, {Map<String, dynamic>? param}) async {
    var res = await http.post(
      Uri.parse(api + _url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(param),
    );
    return res;
  }

  Future<http.Response> put(
    String _url,
    String id, {
    Map<String, dynamic>? param,
  }) async {
    var res = await http.put(
      Uri.parse(api + _url + "/" + id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(param),
    );
    return res;
  }

  Future<http.Response> delete(String _url, String id) async {
    var res = await http.delete(
      Uri.parse(api + _url + "/" + id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return res;
  }
}
