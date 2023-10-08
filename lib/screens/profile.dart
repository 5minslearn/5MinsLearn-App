import 'dart:developer';

import 'package:fiveminslearn/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Profile extends StatefulWidget {
  final Function logout;
  final QueryResult? result;

  const Profile({super.key, required this.logout, required this.result});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void logout() {
    widget.logout({"input": {}});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonWidget(
        label: "Logout",
        isLoading: widget.result?.isLoading ?? false,
        onPressed: logout,
      ),
    );
  }
}
