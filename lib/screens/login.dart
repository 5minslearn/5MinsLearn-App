import 'dart:ffi';

import 'package:fiveminslearn/navigation/home_bottom_navigation_bar.dart';

import 'package:fiveminslearn/screens/register.dart';

import 'package:fiveminslearn/utils/form_validation.dart';
import 'package:fiveminslearn/widgets/button_widget.dart';
import 'package:fiveminslearn/widgets/divider_widget.dart';
import 'package:fiveminslearn/widgets/header_widget.dart';
import 'package:fiveminslearn/widgets/text_field_widget.dart';
import 'package:fiveminslearn/widgets/text_widget.dart';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final Function login;

  const Login({super.key, required this.login});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';
  String? emailError;
  String? passwordError;
  bool isLoading = false;
  ValueNotifier<bool> reset = ValueNotifier<bool>(false);

  @override
  void dispose() {
    reset.value = false;

    super.dispose();
  }

  void onEmailChange(String value) {
    setState(() {
      email = value;
    });
  }

  void onPasswordChange(String value) {
    setState(() {
      password = value;
    });
  }

  void startLoader() {
    setState(() {
      isLoading = true;
    });
  }

  void stopLoader() {
    setState(() {
      isLoading = false;
    });
  }

  void onSubmit() async {
    setState(() {
      emailError = validateEmail(email);
      passwordError = validatePassword(password);
    });

    if (emailError == null && passwordError == null) {
      login();
    }
  }

  void login() {
    // goToHome();
    widget.login({
      "input": {email, password}
    });
    resetForm();
  }

  void resetForm() {
    setState(() {
      email = '';
      password = '';
      emailError = null;
      passwordError = null;
    });

    reset.value = true;

    Future.delayed(const Duration(seconds: 1), () {
      reset.value = false;
    });
  }

  void onPressRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }

  void goBack() {
    Navigator.pop(context);
  }

  void onSkipLogin() {
    goToHome();
  }

  void goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeBottomNavigationBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 50),
          child: Wrap(
            runSpacing: 30,
            children: [
              const HeaderWidget(
                shouldShowBackArrow: false,
                shouldShowMoreMenu: false,
                title: "Login",
              ),
              const Wrap(
                runSpacing: 5,
                children: [
                  TextWidget(
                    variant: TextVariant.title,
                    text: "Hello, Welcome Back 👋",
                  ),
                  TextWidget(
                    variant: TextVariant.helper,
                    text: "Happy to see you again, please login here.",
                  ),
                ],
              ),
              Wrap(
                runSpacing: 20,
                children: [
                  TextFieldWidget(
                    value: email,
                    label: 'Email Address',
                    placeholder: 'Enter your email address',
                    onChanged: onEmailChange,
                    error: emailError,
                    reset: reset,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFieldWidget(
                    value: password,
                    label: 'Password',
                    isObscureText: true,
                    placeholder: 'Enter your password',
                    onChanged: onPasswordChange,
                    error: passwordError,
                    reset: reset,
                  ),
                ],
              ),
              ButtonWidget(
                label: "Login",
                isLoading: isLoading,
                onPressed: onSubmit,
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 3,
                  children: [
                    const TextWidget(
                      variant: TextVariant.helper,
                      text: "Don't have an account?",
                    ),
                    TextButton(
                      onPressed: onPressRegister,
                      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                      child: const TextWidget(
                        variant: TextVariant.helper,
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                        text: "Register",
                      ),
                    )
                  ],
                ),
              ),
              const DividerWidget(
                text: "Or Skip Login",
              ),
              ButtonWidget(
                label: "Skip Login",
                // isLoading: isLoading,
                onPressed: onSkipLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
