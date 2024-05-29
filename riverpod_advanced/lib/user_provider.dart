import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import 'model/user.dart';

final userProvider = FutureProvider.family<User, int>((ref, userId) async {
  final apiResponse = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users/$userId'));

  if (apiResponse.statusCode == 200) {
    return User.fromJson(jsonDecode(apiResponse.body));
  } else {
    throw Exception('Unable to fetch the user');
  }
});
