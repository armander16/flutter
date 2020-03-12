import 'dart:convert';
import 'package:directorio_ams/modal/User.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

 
class Services {
  static const String url = 'https://jsonplaceholder.typicode.com/users';
 
  static Future<List<User>> getUsers() async {
   // try {
    //  final response = await http.get(url); // url
      final response = await rootBundle.loadString('data/menu_opts.json');

    //  if (response.statusCode == 200) { //url
        print( response);
     //   List<User> list = parseUsers(response.body); // url
        List<User> list = parseUsers(response);

        return list;
      // } else {  //url
      //   throw Exception("Error"); //url
      // } //url
    // } catch (e) {
    //   throw Exception(e.toString());
    // }
  }
 
  static List<User> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}