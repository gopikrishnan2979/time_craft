import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:time_craft/view/core/styles.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});
  static const String routename = '/Orderplaced';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Center(
          child: SizedBox(
            width: kwidth,
            child:
                LottieBuilder.network('https://assets5.lottiefiles.com/packages/lf20_gsigmrhp.json',
                    onLoaded: (p0) => wait(context),
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('😢', style: TextStyle(fontSize: 30)),
                          Text('Something Error', style: interbold)
                        ],
                      );
                    },
                    fit: BoxFit.fitWidth),
          ),
        ),
      ),
    );
  }

  wait(BuildContext context) {
    Timer(const Duration(milliseconds: 7000), () {
      Navigator.popUntil(
        context,
        (route) => route.isFirst,
      );
    });
  }
}
