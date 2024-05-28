import 'package:flutter_riverpod/flutter_riverpod.dart';

const helloWorldString = "This is my Riverpod Practice";

/// Provider 1:
/// Basic Provider that returns a simple string
final helloWorldProvider = Provider<String>((ref) => helloWorldString);
