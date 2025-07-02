# flutter_dynamic_login

A simple yet customizable dynamic login screen for Flutter apps, featuring email and password input fields with validation.

## Usage

To use this package, add flutter_dynamic_login as a dependency in your pubspec.yaml file.
And add this import to your file.


## Image
<img src="https://github.com/user-attachments/assets/46aa0fc1-8611-47b1-85e4-3e3e3ddc1a8d" width="100" height="200"  alt=""/>

### Example

```dart
DynamicLoginPage(
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
| isPasswordVisible               | bool         | Set bool value to check if password is visible.                                                                                                                                                      |                  false                  |
| passwordMaxLength             | int               | Set value for password length                                                                                                                                       |                  12                  |
| emailController             | TextEditingController             | Set controller for email                                                                                                                                       |                  Null                  |
| passwordController          | TextEditingController             | Set controller for password.                                                                       |                  Null                  |
| themeColor            | Color                | Color of widgets                                                                                                                                       |           Color(0xFF673AB7)            |
