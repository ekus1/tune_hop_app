import 'package:flutter/material.dart';

BottomNavigationBar bottomNavigation(context, {required int selectedIndex, required Function(int) onTap}) {
  return BottomNavigationBar(
    currentIndex: selectedIndex,
    onTap: onTap,
    backgroundColor: Colors.white,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: const Color(0xFF548000),
    unselectedItemColor: const Color(0xFFC4C4C4),
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Početak'
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.shop_two),
          label: 'Trgovina'
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.hotel_class),
          label: 'Postignuća'
      ),
    ],
  );
}
