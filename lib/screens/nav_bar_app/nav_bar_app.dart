import 'package:dinder/screens/dining_buddy_screen/dining_buddy_screen.dart';
import 'package:dinder/screens/marketplace_screen/marketplace_screen.dart';
import 'package:dinder/screens/profile_screen/profile_screen.dart';
import 'package:dinder/theme/main_theme.dart';
import 'package:flutter/material.dart';

class NavBarApp extends StatefulWidget {
  @override
  _NavBarAppState createState() => _NavBarAppState();
}

class _NavBarAppState extends State<NavBarApp> {
  int currentIndex = 0;
  final screens = [
    DiningBuddyScreen(),
    MarketplaceScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dining Buddy')),
      body: IndexedStack(
        children: screens,
        index: currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: ColorPalette.tabbarBackground,
        selectedItemColor: Colors.white,
        unselectedItemColor: ColorPalette.tabbarText,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dining Buddy',
            backgroundColor: ColorPalette.darkerBackground,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Marketplace',
            backgroundColor: ColorPalette.darkerBackground,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: ColorPalette.darkerBackground,
          ),
        ],
      ),
    );
  }
}
