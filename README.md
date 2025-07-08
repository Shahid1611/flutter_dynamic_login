# flutter_dynamic_login

A simple yet customizable dynamic login screen for Flutter apps, featuring email and password input fields with validation.

## Usage

Easily implement a dynamic login screen with customizable email and password fields using this Flutter widget—perfect for modern authentication flows.

## Installation

Add the following line to your pubspec.yaml under dependencies:

dependencies:
flutter_dynamic_login: ^0.0.5

## Import the package

Add this import statement to the Dart file where you want to use the login widget:

import 'package:flutter_dynamic_login/flutter_dynamic_login.dart';

## Login screen with demo snap

<img height="500" width="250" src="https://github.com/Shahid1611/flutter_dynamic_login/blob/main/example/assets/display/screen_record.gif?raw=true">

### Example

```dart
DynamicLoginPage(
        "assets/images/sample_logo.png",
        "assets/images/google_sample.png",
        "assets/images/facebook_sample.png",
        passwordVisibilityFunction: ()=> _makePasswordVisibility(),
        emailFormKey: _emailFormKey,
        passwordFormKey: _passwordFormKey,
        isPasswordVisible: isPasswordVisible,
      ),
    );
```
## 🆕 What's New in v0.0.5

✨ Added Apple Login Support: Introduced Apple icon and functionality property for seamless integration on iOS platforms.

### Example

```dart
DynamicLoginPage(
        showAppleIcon: true,
        appleLoginFunction: () {},
      ),
    );
```

👁️ Dynamic Visibility Configuration: Enabled visibility flags for Apple, Google, Facebook icons, and "Forgot Password" text—allowing developers to toggle elements as needed at runtime.

🛠️ Method Naming Updates: Deprecated googleFunction and facebookFunction in favor of more descriptive googleLoginFunction and facebookLoginFunction.

### Example

```dart
DynamicLoginPage(
        facebookLoginFunction: () {},
        googleLoginFunction: () {},
      ),
    );
```

⚙️ Flexible Functionality Properties: Removed required keyword from all authentication-related parameters to support dynamic inclusion.

🔐 OTP Login Feature: Added support for "Login with OTP" as an alternative authentication method.

### Example

```dart
DynamicLoginPage(
        showOtpOption: true,
        otpFunction: () {}
      ),
    );
```
## Updated UI with Apple & OTP Support

<img height="500" width="250" src="https://github.com/Shahid1611/flutter_dynamic_login/blob/main/example/assets/display/icons_visibility.png?raw=true">

### AwesomeDialog Class

| Dart attribute        | Datatype             | Description                                                                                                                                                   |             Default Value              |
|:---------------------:|:--------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------:|:--------------------------------------:|
| forgotPasswordFunction            | Function           | Create your own function for forgot password.                                                                                      |                  Null                  |
| facebookLoginFunction            | Function           | Create your own function for facebook functionality.                                                                                      |                  Null                  |
| googleLoginFunction            | Function           | Create your own function for google functionality.                                                                                      |                  Null                  |
| otpFunction            | Function           | Create your own function for OTP Login.                                                                                      |                  Null                  |
| appleLoginFunction            | Function           | Create your own function for Apple Login.                                                                                      |                  Null                  |
| loginFunction          | Function               | Create your own function for login.                                                                                                |                  Null                  |
| registerFunction                 | Function               | Create your own function for registration                                                                          |   Null   |
| passwordVisibilityFunction                 | Function               | Create your own function for password visibility.                                                                                                                                      |                  Null                  |
| isEmailValid                  | bool               | Set bool value for validating email address.                                                                                                                       |                  false                  |
| isPasswordValid                  | bool               | Set bool value for validating password.                                                               |                  false                  |
| isPasswordObscure               | bool         | Set bool value to check if password is visible.                                                                                                                                                      |                  true                  |
| showOtpOption               | bool         | Set bool value to check if otp option is visible.                                                                                                                                                      |                  true                  |
| showForgotPassword               | bool         | Set bool value to check if Forgot password option is visible.                                                                                                                                                      |                  true                  |
| showAppleIcon               | bool         | Set bool value to check if iOS login option is visible.                                                                                                                                                      |                  true                  |
| showFacebookIcon               | bool         | Set bool value to check if Facebook login option is visible.                                                                                                                                                      |                  true                  |
| showGoogleIcon               | bool         | Set bool value to check if Google option is visible.                                                                                                                                                      |                  true                  |
| passwordMaxLength             | int               | Set value for password length                                                                                                                                       |                  12                  |
| emailController             | TextEditingController             | Set controller for email                                                                                                                                       |                  Null                  |
| passwordController          | TextEditingController             | Set controller for password.                                                                       |                  Null                  |
| themeColor            | Color                | Color of widgets                                                                                                                                       |           Color(0xFF673AB7)            |
| emailFormKey            | FormKey                | Set form key for email text field                                                                                                                                       |           Null            |
| passwordFormKey            | FormKey                | Set form key for password text field                                                                                                                                       |           Null            |
