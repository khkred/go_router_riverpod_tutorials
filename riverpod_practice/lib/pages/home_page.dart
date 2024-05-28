import 'package:flutter/material.dart';
import 'package:riverpod_practice/pages/hello_world_provider_page.dart';

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
                  child: const Text('Hello World Provider Page'))
            ],
          ),
        ),
      ),
    );
  }
}
