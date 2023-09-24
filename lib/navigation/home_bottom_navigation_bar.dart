import 'package:fiveminslearn/screens/blog/blog_list.dart';
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
    BlogList(),
    Center(
      child: TextWidget(
        text: "Videos",
        variant: TextVariant.title,
      ),
    ),
    Center(
      child: TextWidget(
        text: "Profile",
        variant: TextVariant.title,
      ),
    ),
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
