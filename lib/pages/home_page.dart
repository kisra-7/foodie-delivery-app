import 'package:app/components/food_tile.dart';
import 'package:app/components/my_appbar.dart';
import 'package:app/components/my_current_location.dart';
import 'package:app/components/my_drawer.dart';
import 'package:app/components/my_tab_bar.dart';
import 'package:app/models/food.dart';
import 'package:app/models/resturant.dart';
import 'package:app/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_description_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController =
        TabController(length: FoodCatogrie.values.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    tabController.dispose();
  }

  List<Food> _menuFilterdByCategory(FoodCatogrie category, List<Food> allMenu) {
    return allMenu.where((food) => food.foodCatogrie == category).toList();
  }

  List<Widget> _foodInCategory(List<Food> allMenu) {
    return FoodCatogrie.values.map((category) {
      List<Food> categoryMenu = _menuFilterdByCategory(category, allMenu);
      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final food = categoryMenu[index];
          return FoodTile(
            food: food,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodPage(food: food),
                ),
              );
            },
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.surface,
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MyAppbar(
            title: MyTabBar(tabController: tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 2.5,
                  endIndent: 2.5,
                  color: theme.secondary,
                ),
                // my current location
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: MyCurrentLocation()),
                // description box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Resturant>(
          builder: (context, restaurent, child) => TabBarView(
            controller: tabController,
            children: _foodInCategory(
              Resturant().menu,
            ),
          ),
        ),
      ),
    );
  }
}
