import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/search/search.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
          padding: EdgeInsets.only(left: kwidth * 0.05),
          child: IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu, size: 30.0))),
      leadingWidth: kwidth * 0.15,
      title: Text(
        'Shop',
        style: interbold,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: kwidth * 0.05),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SearchScrn.routename);
              },
              icon: const Icon(
                Icons.search,
                size: 25,
              )),
        )
      ],
      shadowColor: black,
      elevation: 5,
      backgroundColor: white,
      bottom: const TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: black,
          labelColor: black,
          tabs: [
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'Men',
            ),
            Tab(
              text: 'Women',
            ),
            Tab(
              text: 'Kids',
            ),
          ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);
}
