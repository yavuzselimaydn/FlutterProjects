import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final TabController? tabController;
  const BottomNavBar({ required this.tabController,super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorColor: Colors.transparent,
        controller: tabController,
        tabs: const [
          Tab(
            icon: Icon(
              Icons.more,
              color: Colors.grey,
              size: 22,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.play_arrow,
              color: Colors.grey,
              size: 22,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.navigation,
              color: Colors.grey,
              size: 22,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.supervised_user_circle,
              color: Colors.grey,
              size: 22,
            ),
          ),
        ]);
  }
}