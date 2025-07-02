import 'package:flutter/material.dart';

/// A customizable login screen widget.
class DynamicLoginPage extends StatefulWidget {
  const DynamicLoginPage(
      String this.appLogo,
      String this.googleLogo,
      String this.facebookLogo, {
        super.key,
        this.isEmailValid = false,
        this.isPasswordValid = false,
        this.isPasswordVisible = false,
        this.passwordMaxLength = 12,
        this.emailController,
        this.passwordController,
        this.themeColor = Colors.deepPurple,
        required this.forgotPasswordFunction,
        required this.loginFunction,
        required this.registerFunction,
        required this.facebookFunction,
        required this.googleFunction,
        required this.passwordVisibilityFunction,
      });

  // App logo displayed
  final String? appLogo;
  final String? googleLogo;
  final String? facebookLogo;

  // Validation flags and visibility control
  final bool? isEmailValid;
  final bool? isPasswordValid;
  final bool? isPasswordVisible;
  final int? passwordMaxLength;

  // Text controllers for form fields
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  // Customizable color theme
  final Color? themeColor;

  // Functional callbacks
  final VoidCallback forgotPasswordFunction;
  final VoidCallback loginFunction;
  final VoidCallback registerFunction;
  final VoidCallback passwordVisibilityFunction;
  final VoidCallback facebookFunction;
  final VoidCallback googleFunction;

  @override
  State<DynamicLoginPage> createState() => _DynamicLoginPageState();
}

class _DynamicLoginPageState extends State<DynamicLoginPage> {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: widget.themeColor,
        child: Center(
          child: Container(
            color: Colors.white,
            height: screenHeight / 1.3,
            width: screenWidth / 1.1,
            child: Padding(
              padding: EdgeInsets.all(screenHeight * 0.03),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // App logo
                    Center(
                      child: SizedBox(
                        height: screenHeight * 0.11,
                        width: screenWidth * 0.3,
                        child: Image.asset(widget.appLogo!, fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    // Sign In section header
                    Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    // Email input field
                    Text("Email"),
                    SizedBox(height: screenHeight * 0.01),
                    TextField(
                      controller: widget.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        suffixIconColor: widget.themeColor,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 10.0,
                        ),
                        hintText: "Enter email",
                        suffixIcon: Icon(Icons.email),
                        hintStyle: TextStyle(fontSize: 14.0),
                        border: OutlineInputBorder(),
                        errorText: widget.isEmailValid!
                            ? "Please enter valid email"
                            : null,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    // Password input field
                    Text("Password"),
                    SizedBox(height: screenHeight * 0.01),
                    TextField(
                      maxLength: widget.passwordMaxLength,
                      controller: widget.passwordController,
                      obscureText: widget.isPasswordVisible!,
                      decoration: InputDecoration(
                        suffixIconColor: widget.themeColor,
                        suffixIcon: IconButton(
                          icon: Icon(
                            widget.isPasswordVisible!
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed:
                              () {}, // Replace with widget.passwordVisibilityFunction
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 10.0,
                        ),
                        hintText: "Enter password",
                        hintStyle: TextStyle(fontSize: 14.0),
                        border: OutlineInputBorder(),
                        errorText: widget.isPasswordValid!
                            ? "Please enter valid password"
                            : null,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    // Forgot password link
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: widget.forgotPasswordFunction,
                        child: Text(
                          "Forgot password ?",
                          style: TextStyle(color: widget.themeColor),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    // Login button
                    SizedBox(
                      width: screenWidth,
                      child: OutlinedButton(
                        onPressed: widget.loginFunction,
                        style: OutlinedButton.styleFrom(
                          backgroundColor: widget.themeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          side: BorderSide(color: widget.themeColor!),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    // Divider with "OR"
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "OR",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Social logins
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: InkWell(
                            onTap: () {},
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  100.0,
                                ), // Rounded corners
                              ),
                              child: Image.asset(
                                widget.googleLogo!,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: InkWell(
                            onTap: () {},
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  100.0,
                                ), // Rounded corners
                              ),
                              child: Image.asset(
                                widget.facebookLogo!,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Registration link for new users
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: widget.registerFunction,
                        child: Text(
                          "New user? Register",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
