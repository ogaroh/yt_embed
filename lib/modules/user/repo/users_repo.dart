import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

class UserRepo {
  // get users
  Future<List<dynamic>> getUsers() async {
    var users = <dynamic>[];
    try {
      final response =
          await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if (response.statusCode == 200) {
        users = jsonDecode(response.body) as List<dynamic>;
      }
    } catch (e) {
      log(e.toString());
    }
    return users;
  }
}
