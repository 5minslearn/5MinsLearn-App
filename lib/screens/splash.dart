import 'dart:async';

import 'package:fiveminslearn/containers/login_container.dart';
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

  void initCall() async {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginContainer(),
        ),
      ),
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
