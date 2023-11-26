import 'package:fiveminslearn/utils/form_validation.dart';
import 'package:fiveminslearn/utils/ui.dart';
import 'package:fiveminslearn/widgets/button_widget.dart';
import 'package:fiveminslearn/widgets/header_widget.dart';
import 'package:fiveminslearn/widgets/text_field_widget.dart';
import 'package:fiveminslearn/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function register;

  const Register({super.key, required this.register});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name = '';
  String email = '';
  String password = '';
  String? nameError;
  String? emailError;
  String? passwordError;
  bool isLoading = false;
  ValueNotifier<bool> reset = ValueNotifier<bool>(false);

  void onNameChange(String value) {
    setState(() {
      name = value;
    });
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
      nameError = validateName(name);
      emailError = validateEmail(email);
      passwordError = validatePassword(password);
    });

    if (nameError == null && emailError == null && passwordError == null) {
      register();
    }
  }

  void register() {
    widget.register({
      "input": {"email": email, "password": password, "first_name": name}
    });

    showAlertDialog(
      context,
      title: "Registration success",
    );
    resetForm();
  }

  void resetForm() {
    setState(() {
      name = '';
      email = '';
      password = '';
      nameError = null;
      emailError = null;
      passwordError = null;
    });

    reset.value = true;

    Future.delayed(const Duration(seconds: 1), () {
      reset.value = false;
    });
  }

  void onPressLogin() {
    goBack();
  }

  void goBack() {
    Navigator.pop(context);
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
              HeaderWidget(
                shouldShowBackArrow: true,
                shouldShowMoreMenu: false,
                title: "Register",
                goBack: goBack,
              ),
              Wrap(
                runSpacing: 5,
                children: const [
                  TextWidget(
                    variant: TextVariant.title,
                    text: "Hello, Welcome 👋",
                  ),
                  TextWidget(
                    variant: TextVariant.helper,
                    text: "First, let's create your account.",
                  ),
                ],
              ),
              Wrap(
                runSpacing: 20,
                children: [
                  TextFieldWidget(
                    value: name,
                    label: 'Name',
                    placeholder: 'Enter your name',
                    onChanged: onNameChange,
                    keyboardType: TextInputType.name,
                    error: nameError,
                    reset: reset,
                  ),
                  TextFieldWidget(
                    value: email,
                    label: 'Email Address',
                    placeholder: 'Enter your email address',
                    onChanged: onEmailChange,
                    keyboardType: TextInputType.emailAddress,
                    error: emailError,
                    reset: reset,
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
                label: "Register",
                isLoading: isLoading,
                onPressed: onSubmit,
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 0,
                  children: [
                    const TextWidget(
                      variant: TextVariant.helper,
                      text: "Already have an account?",
                    ),
                    TextButton(
                      onPressed: onPressLogin,
                      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                      child: const TextWidget(
                        variant: TextVariant.helper,
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                        text: "Login   ",
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
