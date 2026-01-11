import 'package:flutter/material.dart';
import 'package:riverpod_app/features/auth/presentation/views/login_page.dart';
// import 'package:riverpod_app/screens/login.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginPage(),
        // Center(

        //   // child: Text('Hello World!'),
        // ),
      ),
    );
  }
}
