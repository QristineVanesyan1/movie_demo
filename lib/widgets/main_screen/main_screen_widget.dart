import 'package:flutter/material.dart';
import 'package:move_demo/Theme/app_colors.dart';
import 'package:move_demo/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
  final a = [Text('a'), MovieListWidget(), Text('c')];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TMDB')),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (_selectedTab == index) return;
          _selectedTab = index;
          setState(() {});
        },
        backgroundColor: AppColors.mainDarkBlue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'News'),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Shows'),
        ],
      ),
      body: Center(child: a[_selectedTab]),
    );
  }
}
