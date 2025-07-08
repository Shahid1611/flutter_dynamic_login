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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DynamicLoginPage(
        "assets/images/sample_logo.png",
        "assets/images/google_sample.png",
        "assets/images/facebook_sample.png",
        forgotPasswordFunction: () {},
        loginFunction: () => _loginUser(),
        registerFunction: () {},
        passwordVisibilityFunction: () => _makePasswordVisibility(),
        facebookLoginFunction: () {},
        googleLoginFunction: () {},
        otpFunction: () {},
        emailFormKey: _emailFormKey,
        passwordFormKey: _passwordFormKey,
        isPasswordObscure: isPasswordVisible,
        appleLoginFunction: () {},
        showOtpOption: true,
        showForgotPassword: true,
        showAppleIcon: true,
        showFacebookIcon: true,
        showGoogleIcon: true,
      ),
    );
  }

  void _loginUser() {
    if (_emailFormKey.currentState!.validate()) {
      if (_passwordFormKey.currentState!.validate()) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login Successful !!')));
      }
    }
  }

  void _makePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }
}
