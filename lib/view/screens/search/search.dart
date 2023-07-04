import 'package:flutter/material.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';
import 'package:time_craft/view/screens/search/widgets/search_box_filter.dart';
import 'package:time_craft/view/screens/search/widgets/search_not_found.dart';

class SearchScrn extends StatelessWidget {
  const SearchScrn({super.key});

  static const String routename = '/Search';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      appBar: AppbarCom(title: 'Search'),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchBoxWithFilter(),
          Expanded(
            child: SearchNotFound(),
          )
        ],
      ),
    ));
  }
}
