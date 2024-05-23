import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:riverpod_total/models/post.dart';
import 'package:riverpod_total/models/user.dart';

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

final usersProvider = FutureProvider<List<User>>((ref) async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    List jsonData = json.decode(response.body);

    return jsonData.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load user');
  }
});

final selectedUserProvider = StateProvider<User?>((ref) => null);

final postsByUserProvider = FutureProvider<List<Post>>((ref) async {
  final selectedUser = ref.watch(selectedUserProvider);

  if (selectedUser == null) {
    return [];
  }

  print('Selected User: ${selectedUser.id}');
  final response = await http.get(Uri.parse(
      'https://jsonplaceholder.typicode.com/posts?userId=${selectedUser.id}'));

  if (response.statusCode == 200) {
    List jsonData = json.decode(response.body);

    return jsonData.map((post) => Post.fromJson(post)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
});

//Provider with family modifier
final postsByUserIdProvider =
    FutureProvider.family<List<Post>, int>((ref, userId) async {
  final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts?userId=$userId'));

  if (response.statusCode == 200) {
    List jsonData = json.decode(response.body);

    return jsonData.map((post) => Post.fromJson(post)).toList();
  } else {
    throw Exception('Unable to fetch posts from $userId');
  }
});
