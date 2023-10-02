import 'package:fiveminslearn/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  String login = """
  mutation Login(\$input: LoginInput!) {
    login(input: \$input) {
      token
      user {
        id
        first_name
        last_name
        email
        gender
        address_line1
        address_line2
        city
        state
        secret_question
        dob
        mobile
        full_address
        name
        activate_date
        createdAt
        updatedAt
        deletedAt
      }
    }
  }
""";

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: gql(login),
      ),
      builder: (RunMutation runMutation, result) {
        return Login(
          login: runMutation,
        );
      },
    );
  }
}
