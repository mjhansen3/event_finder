import 'dart:convert';

import 'package:event_finder/models/users.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://192.168.1.231:2000/api/";

  static createUser(Map userData) async {
    var url = Uri.parse("${baseUrl}create_user");

    try {
      final res = await http.post(url, body: userData);

      if (res.statusCode == 200) {
        var resData = jsonDecode(res.body);
        debugPrint(resData.toString());
      } else {
        debugPrint("Failed to get response.");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static getUser() async {
    List<Users> users = [];
    var url = Uri.parse("${baseUrl}get_user");

    try {
      final res = await http.get(url);
      
      if (res.statusCode == 200) {
        var resData = jsonDecode(res.body);

        resData['user'].forEach(
          (value) => {
            users.add(
              Users(email: value['email'], password: value['password'])
            )
          }
        );

        return users;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}