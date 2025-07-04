import 'package:flutter/material.dart';

/// A customizable and reusable login screen widget that supports
/// email/password login, social login, and various UI customization options.
class DynamicLoginPage extends StatefulWidget {
  const DynamicLoginPage(
    String this.appLogo,
    String this.googleLogo,
    String this.facebookLogo, {
    super.key,

    /// Email validation flag (used externally for logic, not UI)
    this.isEmailValid = false,

    /// Password validation flag (used externally for logic, not UI)
    this.isPasswordValid = false,

    /// Toggles password visibility (obscureText)
    this.isPasswordObscure = true,

    /// Controls the maximum allowed characters in the password
    this.passwordMaxLength = 12,

    /// Text controller for email field
    this.emailController,

    /// Text controller for password field
    this.passwordController,

    /// Theme color used across the login UI (buttons, highlights, etc.)
    this.themeColor = Colors.deepPurple,

    /// Callback when 'Forgot password?' is tapped
    required this.forgotPasswordFunction,

    /// Callback when 'Login' button is tapped
    required this.loginFunction,

    /// Callback when 'Register' is tapped
    required this.registerFunction,

    /// Callback when Facebook login is selected
    required this.facebookFunction,

    /// Callback when Google login is selected
    required this.googleFunction,

    /// Callback to toggle password visibility
    required this.passwordVisibilityFunction,

    /// Global key for email form validation
    required this.emailFormKey,

    /// Global key for password form validation
    required this.passwordFormKey,
  });

  // Required image asset paths for logos
  final String? appLogo;
  final String? googleLogo;
  final String? facebookLogo;

  // Validation and visibility flags
  final bool? isEmailValid;
  final bool? isPasswordValid;
  final bool? isPasswordObscure;
  final int? passwordMaxLength;

  // Text editing controllers
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  // Custom UI color
  final Color? themeColor;

  // User interaction callbacks
  final VoidCallback forgotPasswordFunction;
  final VoidCallback loginFunction;
  final VoidCallback registerFunction;
  final VoidCallback passwordVisibilityFunction;
  final VoidCallback facebookFunction;
  final VoidCallback googleFunction;

  // Form keys for validation
  final GlobalKey<FormState> emailFormKey;
  final GlobalKey<FormState> passwordFormKey;

  @override
  State<DynamicLoginPage> createState() => _DynamicLoginPageState();
}

class _DynamicLoginPageState extends State<DynamicLoginPage> {
  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions for responsive design
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
            // Container for login card
            color: Colors.white,
            height: screenHeight / 1.3,
            width: screenWidth / 1.1,
            child: Padding(
              padding: EdgeInsets.all(screenHeight * 0.03),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// --- Logo Section ---
                    Center(
                      child: SizedBox(
                        height: screenHeight * 0.11,
                        width: screenWidth * 0.3,
                        child: Image.asset(widget.appLogo!, fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    /// --- Page Title ---
                    Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    /// --- Email Field ---
                    Text("Email"),
                    SizedBox(height: screenHeight * 0.01),
                    Form(
                      key: widget.emailFormKey,
                      child: TextFormField(
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
                        ),
                        validator: (value) {
                          // Validate email
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    /// --- Password Field ---
                    Text("Password"),
                    SizedBox(height: screenHeight * 0.01),
                    Form(
                      key: widget.passwordFormKey,
                      child: TextFormField(
                        maxLength: widget.passwordMaxLength,
                        controller: widget.passwordController,
                        obscureText: widget.isPasswordObscure!,
                        decoration: InputDecoration(
                          suffixIconColor: widget.themeColor,
                          suffixIcon: IconButton(
                            icon: Icon(
                              widget.isPasswordObscure!
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: widget.passwordVisibilityFunction,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 10.0,
                          ),
                          hintText: "Enter password",
                          hintStyle: TextStyle(fontSize: 14.0),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          // Validate password
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    /// --- Forgot Password ---
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

                    /// --- Login Button ---
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

                    /// --- Divider with OR ---
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

                    /// --- Social Login Buttons ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// --- Google login button ---
                        SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: InkWell(
                            onTap: widget.googleFunction,
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Image.asset(widget.googleLogo!),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),

                        /// --- Facebook login button ---
                        SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: InkWell(
                            onTap: widget.facebookFunction,
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Image.asset(widget.facebookLogo!),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    /// --- Register Navigation ---
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
