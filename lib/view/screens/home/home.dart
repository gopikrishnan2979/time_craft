import 'package:flutter/material.dart';
import 'package:time_craft/view/screens/home/all_screen.dart';
import 'package:time_craft/view/screens/home/kid_screen.dart';
import 'package:time_craft/view/screens/home/men_screen.dart';
import 'package:time_craft/view/screens/home/widgets/appbar_home.dart';
import 'package:time_craft/view/screens/home/widgets/drawer_home.dart';
import 'package:time_craft/view/screens/home/women_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const String routename = '/Home';

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: const HomeAppbar(),
          drawer: const HomeDrawer(),
          body: TabBarView(children: [
            const AllScreens(),
            const MensScreen(),
            const WomenScreens(),
            KidsScreen(),
          ]),
        ),
      ),
    );
  }
}
