import 'package:flutter/material.dart';
import 'package:flutter_test_kominfo/pages/auth/auth_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 5,
        actions: [
          IconButton(
            onPressed: () async {
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (_) {
                  return const AuthPage();
                },
              ));
            },
            icon: const Icon(Icons.logout_rounded),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: const Center(
        child: Text('Selamat Datang'),
      ),
    );
  }
}
