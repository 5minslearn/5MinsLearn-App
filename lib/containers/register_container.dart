import 'dart:developer';

import 'package:fiveminslearn/containers/login_container.dart';
import 'package:fiveminslearn/navigation/home_bottom_navigation_bar.dart';
import 'package:fiveminslearn/screens/register.dart';
import 'package:fiveminslearn/utils/function.dart';
import 'package:fiveminslearn/utils/ui.dart';
import 'package:fiveminslearn/graphql/mutations.dart' as mutations;

import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class RegisterContainer extends StatefulWidget {
  const RegisterContainer({super.key});

  @override
  State<RegisterContainer> createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  @override
  void initState() {
    super.initState();
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

  void onPressLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginContainer()),
    );
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: gql(mutations.registerMutationGql),
        onError: (OperationException? error) {
          log("Register error", error: error?.graphqlErrors[0].message);
          showNotify(
            title: "",
            message: error!.graphqlErrors[0].message,
            type: TypeAlert.error,
          );
        },
        onCompleted: ((dynamic data) async {
          if (data != null) {
            await setUserAuthToken(data['register']['token']);
            await setUserDetails(data['register']['user']);

            goToHome();
          }
        }),
      ),
      builder: (RunMutation runMutation, QueryResult? result) {
        return Register(
          register: runMutation,
        );
      },
    );
  }
}
