import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movie_recommendation/presentation/pages/home_screen.dart';
import 'package:movie_recommendation/presentation/pages/popular_movie.dart';
import 'package:movie_recommendation/presentation/pages/search_movie.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTab = 0;
  late List<Widget> pages;
  late HomeScreen homeScreen;
  late PopularScreen popularScreen;
  late SearchScreen searchScreen;

  @override
  void initState() {
    homeScreen = const HomeScreen();
    popularScreen = const PopularScreen();
    searchScreen = const SearchScreen();

    pages = [homeScreen, popularScreen, searchScreen];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          backgroundColor: Colors.white,
          color: Colors.black,
          animationDuration: const Duration(microseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTab = index;
            });
          },
          items: const [
            Icon(
              Icons.trending_up_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.show_chart_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
          ]),
      body: pages[currentTab],
    );
  }
}
