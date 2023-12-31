import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/search_controllers/search_controller.dart';
import 'package:time_craft/controller/search_controllers/filter_visibility_controller.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/search/widgets/search_box_filter.dart';
import 'package:time_craft/view/screens/search/widgets/search_found_gridlist.dart';
import 'package:time_craft/view/screens/search/widgets/search_not_found.dart';

class SearchScrn extends StatelessWidget {
  const SearchScrn({super.key});

  static const String routename = '/Search';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: const AppbarCom(title: 'Search'),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ChangeNotifierProvider(
                create: (context) => VisibilityController(), child: SearchBoxWithFilter()),
            Expanded(
              child: Consumer<SearchProvider>(builder: (context, value, child) {
                if (value.searchlist.isEmpty) {
                  return const SingleChildScrollView(child: SearchNotFound());
                } else {
                  return SearchFoundGrid();
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
