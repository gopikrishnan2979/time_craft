import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/search_controller.dart';
import 'package:time_craft/controller/search_visibility_controller.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/common/widgets/loading.dart';
import 'package:time_craft/view/core/styles.dart';

class SearchBoxWithFilter extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  SearchBoxWithFilter({super.key});
  @override
  Widget build(BuildContext context) {
    SearchProvider controller = Provider.of<SearchProvider>(context, listen: false);
    searchController.text = controller.text;
    return Consumer<VisibilityController>(
      builder: (context, value, child) {
        return Container(
          height: (khieght * 0.16) + value.visibilityHeight,
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black26)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: StreamBuilder(
              stream: FirebaseInstanceModel.brands.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Loading();
                }
                return Column(
                  children: [
                    TextField(
                      controller: searchController,
                      onChanged: (value) {
                        controller.search(searchController.text.trim());
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                        hintText: 'Search',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: black),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          if (value.isexpanded) {
                            Provider.of<SearchProvider>(context, listen: false).removeFilter();
                          }
                          value.change(
                            gridcount: snapshot.data!.docs.length ~/ 3,
                            value: !value.isexpanded,
                          );
                        },
                        child: SizedBox(
                          width: kwidth * 0.155,
                          child: Row(
                            children: [
                              const Icon(Icons.filter_alt_outlined, color: black),
                              Text('Filter', style: inter)
                            ],
                          ),
                        ),
                      ),
                    ),
                    sizedboxwithheight(khieght * 0.01),
                    Visibility(
                      visible: value.isexpanded,
                      child: Consumer<SearchProvider>(
                        builder: (context, value, child) {
                          return SizedBox(
                            height: khieght * 0.05,
                            width: kwidth,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: kwidth * 0.02),
                                child: ChoiceChip(
                                  label: Text(snapshot.data!.docs[index]['name']),
                                  selected: index == controller.selectedIndex,
                                  onSelected: (value) {
                                    if (controller.selectedIndex == index) {
                                      controller.removeFilter();
                                    } else {
                                      controller.applyfilter(index, snapshot.data!.docs[index].id);
                                    }
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
