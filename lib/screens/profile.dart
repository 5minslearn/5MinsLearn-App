import 'package:fiveminslearn/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final Function logout;

  const Profile({super.key, required this.logout});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonWidget(
        label: "Logout",
        onPressed: widget.logout,
      ),
    );
  }
}
