import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_runner/components/bottomnav.dart';
import 'package:the_food_runner/components/loading.dart';
import 'package:the_food_runner/components/tabitem.dart';
import 'package:the_food_runner/providers/food.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final FoodMethods _restaurant = FoodMethods();
  bool _isLoading = true;

  Color get primaryPink => Colors.pink.shade400;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() => _isLoading = false);
    });
    super.initState();
    _tabController = TabController(length: _restaurant.foodCount, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: primaryPink,
        foregroundColor: Colors.white,
        title: Text(
          "HOME",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.black26,
      ),
      body: _isLoading
          ? const LoadingWidget()
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    backgroundColor: Colors.pink.shade300,
                    title: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "RESTAURANT MENU",
                        style: const TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    centerTitle: true,
                    pinned: true,
                    floating: true,
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      padding: EdgeInsets.zero,
                      controller: _tabController,
                      isScrollable: true,
                      tabAlignment: TabAlignment.center,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white70,
                      indicatorColor: Colors.white,
                      indicatorWeight: 3,
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      tabs: _restaurant.allFoodKey
                          .map(
                            (food) => Tab(
                              child: Text(food.toUpperCase()),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
                body: Consumer<FoodMethods>(
                  builder: (context, value, child) => TabBarView(
                    controller: _tabController,
                    children: [
                      TabItems(menu: _restaurant.vietMenu),
                      TabItems(menu: _restaurant.koreanMenu),
                      TabItems(menu: _restaurant.spanishMenu),
                      TabItems(menu: _restaurant.italianMenu),
                      TabItems(menu: _restaurant.americanMenu),
                      TabItems(menu: _restaurant.japaneseMenu),
                      TabItems(menu: _restaurant.indianMenu),
                      TabItems(menu: _restaurant.mexicanMenu),
                      TabItems(menu: _restaurant.thaiMenu),
                      TabItems(menu: _restaurant.frenchMenu),
                    ],
                  ),
                ),
              ),
            ),
      bottomNavigationBar: MyBottomNavBar(currentIndex: 0),
    );
  }
}
