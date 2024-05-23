import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:riverpod_total/models/post.dart';

final helloWorldProvider = Provider<String>((ref) => 'Hello, World!');

final counterProvider = StateProvider<int>((ref) => 0);

final postsProvider = FutureProvider<List<Post>>((ref) async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    List jsonData = json.decode(response.body);

    return jsonData.map((post) => Post.fromJson(post)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
});

final postsStreamProvider = StreamProvider<List<Post>>((ref) async* {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    List jsonData = json.decode(response.body);

    yield jsonData.map((post) => Post.fromJson(post)).toList();
  } else {
    throw Exception('Failed to load posts');
  }

  await Future.delayed(const Duration(seconds: 5));
});
