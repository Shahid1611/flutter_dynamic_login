# flutter_dynamic_login

A simple yet customizable dynamic login screen for Flutter apps, featuring email and password input fields with validation.

## Usage

Easily implement a dynamic login screen with customizable email and password fields using this Flutter widget—perfect for modern authentication flows.

## Installation

Add the following line to your pubspec.yaml under dependencies:

dependencies:
flutter_dynamic_login: ^0.0.4

## Import the package

Add this import statement to the Dart file where you want to use the login widget:

import 'package:flutter_dynamic_login/flutter_dynamic_login.dart';

## Login screen with demo snap
![screen_record](https://github.com/user-attachments/assets/df064a15-d064-4083-a148-c171b2c12c3a)


### Example

```dart
DynamicLoginPage(
        "assets/images/sample_logo.png",
        "assets/images/google_sample.png",
        "assets/images/facebook_sample.png",
        forgotPasswordFunction: () {},
        loginFunction:() => _loginUser(),
        registerFunction: () {},
        passwordVisibilityFunction: ()=> _makePasswordVisibility(),
        facebookFunction: () {},
        googleFunction: () {},
        emailFormKey: _emailFormKey,
        passwordFormKey: _passwordFormKey,
        isPasswordVisible: isPasswordVisible,
      ),
    );
```

### AwesomeDialog Class

| Dart attribute        | Datatype             | Description                                                                                                                                                   |             Default Value              |
|:---------------------:|:--------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------:|:--------------------------------------:|
| forgotPasswordFunction            | Function           | Create your own function for forgot password.                                                                                      |                  Null                  |
| facebookFunction            | Function           | Create your own function for facebook functionality.                                                                                      |                  Null                  |
| googleFunction            | Function           | Create your own function for google functionality.                                                                                      |                  Null                  |
| loginFunction          | Function               | Create your own function for login.                                                                                                |                  Null                  |
| registerFunction                 | Function               | Create your own function for registration                                                                          |   Null   |
| passwordVisibilityFunction                 | Function               | Create your own function for password visibility.                                                                                                                                      |                  Null                  |
| isEmailValid                  | bool               | Set bool value for validating email address.                                                                                                                       |                  false                  |
| isPasswordValid                  | bool               | Set bool value for validating password.                                                               |                  false                  |
| isPasswordObscure               | bool         | Set bool value to check if password is visible.                                                                                                                                                      |                  true                  |
| passwordMaxLength             | int               | Set value for password length                                                                                                                                       |                  12                  |
| emailController             | TextEditingController             | Set controller for email                                                                                                                                       |                  Null                  |
| passwordController          | TextEditingController             | Set controller for password.                                                                       |                  Null                  |
| themeColor            | Color                | Color of widgets                                                                                                                                       |           Color(0xFF673AB7)            |
| emailFormKey            | FormKey                | Set form key for email text field                                                                                                                                       |           Null            |
| passwordFormKey            | FormKey                | Set form key for password text field                                                                                                                                       |           Null            |