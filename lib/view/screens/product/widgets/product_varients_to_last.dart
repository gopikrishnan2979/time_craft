import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/reviews/review_screen.dart';

class ProductVarientsToLast extends StatelessWidget {
  const ProductVarientsToLast({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titletext('Available varients'),
        sizedboxwithheight(khieght * 0.01),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: khieght * 0.045,
              crossAxisSpacing: khieght * 0.005,
              mainAxisSpacing: khieght * 0.005),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Center(
            child: Container(
                decoration: BoxDecoration(
                    color: index == 3
                        ? const Color.fromARGB(255, 151, 205, 255)
                        : black,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    varients[index],
                    style: interwhite,
                  ),
                )),
          ),
          itemCount: varients.length,
        ),
        sizedboxwithheight(khieght * 0.01),
        Text(
          'Review',
          style: inter,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _detailtext(
              'Username\nI Like it very much, Amazing product', true),
          itemCount: 3,
        ),
        sizedboxwithheight(khieght * 0.02),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(ReviewScreen.routename);
          },
          style: const ButtonStyle(
              elevation: MaterialStatePropertyAll(3),
              backgroundColor: MaterialStatePropertyAll(white),
              foregroundColor: MaterialStatePropertyAll(black),
              surfaceTintColor: MaterialStatePropertyAll(white),
              shape: MaterialStatePropertyAll(ContinuousRectangleBorder())),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All reviews',
                style: inter,
              ),
              const Icon(
                Icons.navigate_next_outlined,
                size: 30,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _titletext(String text) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      sizedboxwithheight(khieght * 0.01),
      Text(
        text,
        style: inter,
      )
    ]);
  }

  Widget _detailtext(String text, bool isblack) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      sizedboxwithheight(khieght * 0.01),
      Text(
        text,
        style: GoogleFonts.inter(
            fontSize: 12, color: isblack ? black : Colors.grey),
      )
    ]);
  }
}
