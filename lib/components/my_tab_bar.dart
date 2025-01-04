import 'package:app/models/food.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  List<Tab> _categorieTabs() {
    return FoodCatogrie.values.map((category) {
      return Tab(
        text: category.name,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: _categorieTabs(),
    );
  }
}
