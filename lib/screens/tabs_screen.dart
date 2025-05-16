// tab_screen.dart
import 'package:finance_app/screens/stat_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'menu_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const MenuScreen(),
      const Placeholder(),
      const Placeholder(),
      StatisticScreen(onBackToMenu: () => _onTabTapped(0)),
      const Placeholder(),
    ];
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onTabTapped,
        items: [
          const BottomNavigationBarItem(
            icon: PhosphorIcon(PhosphorIconsBold.house),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_outlined),
            label: 'Card',
          ),

          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(top: 15),
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: PhosphorIcon(
                  PhosphorIcons.scan(),
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            label: '',
          ),

          const BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Stat',
          ),
          const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
