import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';
import 'package:time_craft/view/core/styles.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  static const String routename = '/Reviewscreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const AppbarCom(title: 'Reviews'),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: kwidth * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizedboxwithheight(khieght * 0.02),
                          Text(
                            'User name',
                            style: GoogleFonts.inter(color: Colors.grey),
                          ),
                          Text(
                            'Review of the user',
                            style: inter,
                          ),
                          sizedboxwithheight(khieght * 0.02),
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 6),
          ),
        ],
      ),
    ));
  }
}
