import 'package:fiveminslearn/utils/storage.dart';
import 'package:fiveminslearn/constants.dart' as constants;

bool isValidEmail(String email) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}

bool isValidPassword(String password) {
  return RegExp(r'^.{6,}$').hasMatch(password);
}

Future<void> setUserAuthToken(String token) async {
  LocalStorageUtils storage = LocalStorageUtils();

  await storage.setItem(constants.USER_AUTH_TOKEN, token);
}

Future<String?> getUserAuthToken() async {
  LocalStorageUtils storage = LocalStorageUtils();

  return await storage.getItem(constants.USER_AUTH_TOKEN);
}

Future<void> removeUserAuthToken() async {
  LocalStorageUtils storage = LocalStorageUtils();

  await storage.deleteItem(constants.USER_AUTH_TOKEN);
}

Future<void> setUserDetails(dynamic user) async {
  LocalStorageUtils storage = LocalStorageUtils();

  await storage.setItem(constants.USER_DETAILS, user);
}

Future<dynamic> getUserDetails() async {
  LocalStorageUtils storage = LocalStorageUtils();

  return await storage.getItem(constants.USER_DETAILS);
}

Future<void> removeUserDetails() async {
  LocalStorageUtils storage = LocalStorageUtils();

  await storage.deleteItem(constants.USER_DETAILS);
}
