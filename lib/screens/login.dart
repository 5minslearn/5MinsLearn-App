import 'package:fiveminslearn/utils/form_validation.dart';
import 'package:fiveminslearn/widgets/button_widget.dart';
import 'package:fiveminslearn/widgets/divider_widget.dart';
import 'package:fiveminslearn/widgets/header_widget.dart';
import 'package:fiveminslearn/widgets/text_field_widget.dart';
import 'package:fiveminslearn/widgets/text_widget.dart';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Login extends StatefulWidget {
  final Function login;
  final Function onSkipLogin;
  final VoidCallback onPressRegister;
  final QueryResult? result;

  const Login({super.key, required this.login, required this.onSkipLogin, required this.onPressRegister, this.result});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = 'abiraman@gogosoon.com';
  String password = '12345678';
  String? emailError;
  String? passwordError;
  ValueNotifier<bool> reset = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
  }

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
    widget.login({
      "input": {"email": email, "password": password}
    });
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
                isLoading: widget.result?.isLoading ?? false,
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
                      onPressed: widget.onPressRegister,
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
                onPressed: widget.onSkipLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
