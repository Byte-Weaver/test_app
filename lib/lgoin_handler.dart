import 'dart:convert';
import 'package:http/http.dart' as http;

loginValidation(username,password) async {
  http.Response response = await loginUser(username, password);
  if(response.statusCode == 200){
    Map data = json.decode(response.body);
    return data['data'];
  }
  else{
    return false;
  }
}

Future<http.Response> loginUser(String username, String password) {
  return http.post(
    Uri.parse('http://zh2023-001-site1.htempurl.com/api/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'code': username,
      'password': password
    }),
  );
}

