import 'dart:convert';
import 'package:ecommerce_app/constants/api_constants.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:http/http.dart' as http;

class UsersApiService {
  Future<Users> getUsers() async {
    final response = await http.get(Uri.parse(baseUrl + users + apiKey));
    return jsonDecode(response.body);
  }

  static Future createNewUser(
      String email, String phone, String fname, String lname) async {
    await http.post(
      Uri.parse(baseUrl + users + apiKey),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          'fields': {
            'email': email,
            'phone': phone,
            'first_name': fname,
            'last_name': lname,
          }
        },
      ),
    );
  }

  Future updateUserInfo(
      String email, String phone, String fname, String lname) async {
    await http.put(Uri.parse(baseUrl + users + apiKey), headers: {
      'Content-type': 'application/json'
    }, body: {
      'fields': {
        'email': email,
        'phone': phone,
        'fname': fname,
        'lname': lname,
      }
    });
  }
}
