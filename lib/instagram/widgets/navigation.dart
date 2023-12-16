import 'package:flutter/material.dart';
import 'package:instagram/instagram/Screens/HomeScreens/exploreScreen.dart';
import 'package:instagram/instagram/Screens/HomeScreens/homepage.dart';
import 'package:instagram/instagram/Screens/HomeScreens/profileScreen.dart';
import 'package:instagram/instagram/Screens/HomeScreens/reelsScreen.dart';

class Navigation_Screen extends StatefulWidget {
  const Navigation_Screen({super.key});

  @override
  State<Navigation_Screen> createState() => _Navigation_ScreenState();
}

int _currentIndex = 0;

class _Navigation_ScreenState extends State<Navigation_Screen> {
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState

    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  onpageChanged(int page) {
    setState(() {
      _currentIndex = page;
    });
  }

  navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex: _currentIndex,
            onTap: navigationTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ondemand_video_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ]),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onpageChanged,
        children: const [
          HomeScreen(),
          exploreScreen(),
          ReelsScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
