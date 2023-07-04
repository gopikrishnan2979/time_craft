import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';

class SearchBoxWithFilter extends StatelessWidget {
  const SearchBoxWithFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Search',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: black,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: black,
                      ))),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  onPressed: () {},
                  child: SizedBox(
                    width: kwidth * 0.155,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.filter_alt_outlined,
                          color: black,
                        ),
                        Text(
                          'Filter',
                          style: inter,
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
