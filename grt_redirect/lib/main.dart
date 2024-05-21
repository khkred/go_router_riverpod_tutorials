import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grt_redirect/routing/app_router.dart';

void main() {
  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref){
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'GRT Redirect',
      routerConfig: router,
    );
  }
}




