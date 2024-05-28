import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_practice/models/user.dart';

Future<List<User>> getUsersFromAPI() async {
  // We are getting a response from the API call
  final apiResponse =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

// This is a JSON List of Users
  List usersJsonList = jsonDecode(apiResponse.body);

  //Finally we are converting the JSON List to List<User> using an Iterable List map function
  return usersJsonList.map((user) => User.fromJson(user)).toList();
}

final usersListFutureProvider =
    FutureProvider<List<User>>((ref) => getUsersFromAPI());
