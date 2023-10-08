import 'dart:async';

import 'package:fiveminslearn/containers/login_container.dart';
import 'package:fiveminslearn/navigation/home_bottom_navigation_bar.dart';
import 'package:fiveminslearn/utils/function.dart';
import 'package:fiveminslearn/widgets/text_widget.dart';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    initCall();
  }

  void initCall() {
    Timer(const Duration(seconds: 2), () async {
      final String? token = await getUserAuthToken();

      if (token != null && token.isNotEmpty) {
        return goToHome();
      }

      goToLogin();
    });
  }

  void goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeBottomNavigationBar()),
    );
  }

  void goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginContainer()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Center(
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 20,
            children: [
              Image.asset(
                "lib/assets/images/5minslearn_logo.png",
              ),
              const TextWidget(
                text: "5MinsLearn",
                variant: TextVariant.title,
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
