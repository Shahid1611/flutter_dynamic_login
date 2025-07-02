import 'package:flutter/material.dart';
import 'package:flutter_dynamic_login/flutter_dynamic_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DynamicLoginPage(
        "assets/images/sample_logo.png",
        "assets/images/google_sample.png",
        "assets/images/facebook_sample.png",
        forgotPasswordFunction: () {},
        loginFunction: () {},
        registerFunction: () {},
        passwordVisibilityFunction: () {},
        facebookFunction: () {},
        googleFunction: () {},
      ),
    );
  }
}
