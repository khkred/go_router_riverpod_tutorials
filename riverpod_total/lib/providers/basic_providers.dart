import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloWorldProvider = Provider<String>((ref) => 'Hello, World!');

final counterProvider = StateProvider<int>((ref)=> 0);