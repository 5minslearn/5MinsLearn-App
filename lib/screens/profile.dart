import 'package:fiveminslearn/utils/ui.dart';
import 'package:fiveminslearn/widgets/profile/profile_menu_item_widget.dart';
import 'package:fiveminslearn/widgets/card_widget.dart';
import 'package:fiveminslearn/widgets/text_widget.dart';
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

  void onPressLogout() {
    showAlertDialog(
      context,
      title: "Logout",
      message: "Are you sure you want to logout?",
      onPressAccept: logout,
      onPressReject: () => {},
    );
  }

  void onPressBookmarks() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 20.0,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 120.0,
                    width: 120.0,
                    child: CardWidget(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.asset(
                          "lib/assets/images/5minslearn_logo.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const TextWidget(
                    text: "Arunachalam B",
                    variant: TextVariant.title,
                  ),
                  const TextWidget(
                    text: "arun@gogosoon.com",
                    variant: TextVariant.placeholder,
                  ),
                ],
              ),
              CardWidget(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0, top: 8.0),
                  child: Column(
                    children: [
                      ProfileMenuItemWidget(
                        title: "Bookmarks",
                        leftIcon: Icons.bookmark,
                        onPress: onPressBookmarks,
                      ),
                      const ProfileMenuItemWidget(
                        title: "Likes",
                        leftIcon: Icons.thumb_up,
                      ),
                      const ProfileMenuItemWidget(
                        title: "Comments",
                        leftIcon: Icons.comment,
                      ),
                      const ProfileMenuItemWidget(
                        title: "Subscribe to news letter",
                        leftIcon: Icons.subscriptions,
                      ),
                      ProfileMenuItemWidget(
                        title: "Logout",
                        leftIcon: Icons.logout,
                        onPress: onPressLogout,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
