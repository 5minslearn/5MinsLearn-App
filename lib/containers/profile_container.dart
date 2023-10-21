import 'dart:developer';

import 'package:fiveminslearn/containers/login_container.dart';
import 'package:fiveminslearn/screens/profile.dart';
import 'package:fiveminslearn/utils/function.dart';
import 'package:fiveminslearn/graphql/mutations.dart' as mutations;
import 'package:fiveminslearn/utils/ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
    return Mutation(
      options: MutationOptions(
        document: gql(mutations.logoutMutationGql),
        onError: (OperationException? error) {
          log("Logout api error", error: error?.graphqlErrors[0].message);
          showNotify(
            title: "",
            message: error!.graphqlErrors[0].message,
            type: TypeAlert.error,
          );
        },
        onCompleted: (dynamic data) async {
          // if (data != null) {
          logout();
          // }
        },
      ),
      builder: (RunMutation runLogoutMutation, QueryResult? result) {
        return Profile(logout: runLogoutMutation, result: result);
      },
    );
  }
}
