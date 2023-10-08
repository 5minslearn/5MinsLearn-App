import 'package:fiveminslearn/containers/login_container.dart';
import 'package:fiveminslearn/screens/profile.dart';
import 'package:fiveminslearn/utils/function.dart';

import 'package:flutter/material.dart';

class ProfileContainer extends StatefulWidget {
  const ProfileContainer({super.key});

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  void logout() async {
    await removeUserAuthToken();
    await removeUserDetails();

    goToLogin();
  }

  void goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginContainer()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Profile(logout: logout);
  }
}
