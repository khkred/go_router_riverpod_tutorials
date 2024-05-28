import 'package:flutter_riverpod/flutter_riverpod.dart';

const helloWorldString = "This is my Riverpod Practice";

/// Provider 1:
/// Basic Provider that returns a simple string
final helloWorldProvider = Provider<String>((ref) => helloWorldString);

/// Provider 2:
/// State Provider that'll help us return an integer and modify the value too
int count = 0;
final countStateProvider = StateProvider<int>((ref) => count);

final timerStreamProvider = StreamProvider<int>(
    (ref) => Stream.periodic(const Duration(seconds: 1), (count) => count + 1));
