import 'package:flutter/material.dart';

import '../Profile/profile_page/profile_page.dart';
import '../Quote/Quote_screen.dart';
import '../favourite/favourite_screen.dart';
import 'dashboard_screen.dart';

class NavBar extends StatefulWidget {
  final int selectedIndex;
  const NavBar({super.key, this.selectedIndex = 0});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          [
            DashboardScreen(),

            FavouriteScreen(),
            QuoteScreen(),
            ProfilePage(),
          ][_selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          NavigationDestination(icon: Icon(Icons.favorite), label: "Favorites"),
          NavigationDestination(
            icon: Icon(Icons.format_quote),
            label: "Quotes",
          ),
          NavigationDestination(icon: Icon(Icons.person), label: "Person"),
        ],
      ),
    );
  }
}
