import 'dart:developer';

import 'package:fiveminslearn/navigation/home_bottom_navigation_bar.dart';
import 'package:fiveminslearn/screens/login.dart';
import 'package:fiveminslearn/screens/register.dart';
import 'package:fiveminslearn/utils/function.dart';
import 'package:fiveminslearn/utils/ui.dart';
import 'package:fiveminslearn/graphql/mutations.dart' as mutations;

import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
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

  void onPressRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: gql(mutations.loginMutationGql),
        onError: (OperationException? error) {
          log("Login api error", error: error?.graphqlErrors[0].message);
          showNotify(
            title: "",
            message: error!.graphqlErrors[0].message,
            type: TypeAlert.error,
          );
        },
        onCompleted: ((dynamic data) async {
          if (data != null) {
            await setUserAuthToken(data['login']['token']);
            await setUserDetails(data['login']['user']);

            goToHome();
          }
        }),
      ),
      builder: (RunMutation runMutation, QueryResult? result) {
        return Login(
          login: runMutation,
          onSkipLogin: onSkipLogin,
          onPressRegister: onPressRegister,
          result: result,
        );
      },
    );
  }
}
