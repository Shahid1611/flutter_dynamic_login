import 'dart:io';

import 'package:flutter/material.dart';

/// A customizable and reusable login screen widget that supports
/// email/password login, social login, and various UI customization options.
class DynamicLoginPage extends StatefulWidget {
  const DynamicLoginPage(
    String this.appLogo,
    String this.googleLogo,
    String this.facebookLogo,
    String this.appleLogo, {
    super.key,

    /// Email validation flag (used externally for logic, not UI)
    this.isEmailValid = false,

    /// Password validation flag (used externally for logic, not UI)
    this.isPasswordValid = false,

    /// Toggles password visibility (obscureText)
    this.isPasswordObscure = true,

    /// Google icon visibility
    this.showGoogleIcon = true,

    /// Forgot password text visibility
    this.showForgotPassword = true,

    /// Facebook icon visibility
    this.showFacebookIcon = true,

    /// Apple icon visibility
    this.showAppleIcon = true,

    /// OTP option visibility
    this.showOtpOption = true,

    /// Controls the maximum allowed characters in the password
    this.passwordMaxLength = 12,

    /// Text controller for email field
    this.emailController,

    /// Text controller for password field
    this.passwordController,

    /// Theme color used across the login UI (buttons, highlights, etc.)
    this.themeColor = Colors.deepPurple,

    /// Callback when 'Forgot password?' is tapped
    this.forgotPasswordFunction,

    /// Callback when 'Login' button is tapped
    this.loginFunction,

    /// Callback when 'Register' is tapped
    this.registerFunction,

    /// Callback when Facebook login is selected
    this.facebookLoginFunction,

    /// Callback when Google login is selected
    this.googleLoginFunction,

    /// Callback when Apple login is selected
    this.appleLoginFunction,

    /// Callback when OTP login is selected
    this.otpFunction,

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
  final String? appleLogo;

  // Validation and visibility flags
  final bool? isEmailValid;
  final bool? isPasswordValid;
  final bool? isPasswordObscure;
  final int? passwordMaxLength;
  final bool? showGoogleIcon;
  final bool? showFacebookIcon;
  final bool? showAppleIcon;
  final bool? showForgotPassword;
  final bool? showOtpOption;

  // Text editing controllers
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  // Custom UI color
  final Color? themeColor;

  // User interaction callbacks
  final VoidCallback? forgotPasswordFunction;
  final VoidCallback? loginFunction;
  final VoidCallback? registerFunction;
  final VoidCallback? passwordVisibilityFunction;
  final VoidCallback? facebookLoginFunction;
  final VoidCallback? googleLoginFunction;
  final VoidCallback? appleLoginFunction;
  final VoidCallback? otpFunction;

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
          /// Container for login card
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02,
                horizontal: screenWidth * 0.04,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// --- Logo Section ---
                    Center(
                      child: SizedBox(
                        height: screenHeight * 0.08,
                        width: screenWidth * 0.22,
                        child: Image.asset(widget.appLogo!, fit: BoxFit.fill),
                      ),
                    ),

                    /// --- Page Title ---
                    Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    /// --- Email Field ---
                    Text("Email", style: TextStyle(fontSize: 12.0)),
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
                          hintStyle: TextStyle(fontSize: 12.0),
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
                    Text("Password", style: TextStyle(fontSize: 12.0)),
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
                          hintStyle: TextStyle(fontSize: 12.0),
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
                    widget.showForgotPassword!
                        ? SizedBox(height: screenHeight * 0.01)
                        : Container(),

                    /// --- Forgot Password ---
                    widget.showForgotPassword!
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: widget.forgotPasswordFunction,
                              child: Text(
                                "Forgot password ?",
                                style: TextStyle(
                                  color: widget.themeColor,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          )
                        : Container(),
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
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
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
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    /// --- Social Login Buttons ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// --- Google login button ---
                        widget.showGoogleIcon!
                            ? InkWell(
                                onTap: widget.googleLoginFunction,
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Image.asset(widget.googleLogo!),
                                ),
                              )
                            : Container(),
                        SizedBox(width: screenWidth * 0.06),

                        /// --- Facebook login button ---
                        widget.showFacebookIcon!
                            ? InkWell(
                                onTap: widget.facebookLoginFunction,
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Image.asset(widget.facebookLogo!),
                                ),
                              )
                            : Container(),
                        Platform.isIOS && widget.showAppleIcon!
                            ? SizedBox(width: screenWidth * 0.06)
                            : Container(),

                        /// --- Apple login button ---
                        Platform.isIOS && widget.showAppleIcon!
                            ? InkWell(
                                onTap: widget.appleLoginFunction,
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Image.asset(widget.appleLogo!),
                                ),
                              )
                            : Container(),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    /// --- Register Navigation ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// --- Register New User ---
                        InkWell(
                          onTap: widget.registerFunction,
                          child: Text(
                            "New user? Register",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        widget.showOtpOption!
                            ? Text(
                                " / ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                              )
                            : Container(),

                        /// --- OTP Navigation ---
                        widget.showOtpOption!
                            ? InkWell(
                                onTap: widget.otpFunction,
                                child: Text(
                                  "Login with OTP",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
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
