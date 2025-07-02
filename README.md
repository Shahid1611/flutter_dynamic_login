# flutter_dynamic_login

A simple flutter dynamic login screen

## Usage

To use this package, add flutter_dynamic_login as a dependency in your pubspec.yaml file.
And add this import to your file.


## Image
<img src="https://github.com/user-attachments/assets/f03e92aa-7667-4e48-acb9-ba6f223213a8" width="100" height="200" />

### Example

```dart
DynamicLoginPage(
        "App title", forgotPasswordFunction: () {  }, loginFunction: () {  }, registerFunction: () {  }, passwordVisibilityFunction: () {  },)
```

### AwesomeDialog Class

| Dart attribute        | Datatype             | Description                                                                                                                                                   |             Default Value              |
|:---------------------:|:--------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------:|:--------------------------------------:|
| forgotPasswordFunction            | Function           | Create your own function for forgot password.                                                                                      |                  Null                  |
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
