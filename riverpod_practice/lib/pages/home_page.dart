import 'package:flutter/material.dart';
import 'package:riverpod_practice/pages/count_state_provider_page.dart';
import 'package:riverpod_practice/pages/hello_world_provider_page.dart';
import 'package:riverpod_practice/pages/stop_watch_provider_page.dart';
import 'package:riverpod_practice/pages/to_do_notifier_provider_page.dart';
import 'package:riverpod_practice/pages/user_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go to All Pages'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HelloWorldProviderPage(),
                      ),
                    );
                  },
                  child: const Text('Hello World Provider Page')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CountStateProviderPage(),
                      ),
                    );
                  },
                  child: const Text('Count State Provider Page')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ToDoNotifierProviderPage(),
                      ),
                    );
                  },
                  child: const Text('Todo Notifier Provider Page')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StopWatchProviderPage(),
                      ),
                    );
                  },
                  child: const Text('StopWatch Provider Page')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserListPage(),
                      ),
                    );
                  },
                  child: const Text('UserList Provider Page')),
            ],
          ),
        ),
      ),
    );
  }
}
