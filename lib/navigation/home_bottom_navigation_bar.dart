import 'package:fiveminslearn/containers/blog_list_container.dart';
import 'package:fiveminslearn/containers/profile_container.dart';
import 'package:fiveminslearn/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  State<HomeBottomNavigationBar> createState() => _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    BlogListContainer(),
    Center(
      child: TextWidget(
        text: "Videos",
        variant: TextVariant.title,
      ),
    ),
    ProfileContainer()
  ];

  void onBottomTapTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: "Videos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onBottomTapTapped,
      ),
    );
  }
}
