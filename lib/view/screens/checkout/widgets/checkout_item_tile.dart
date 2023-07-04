import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';

class CheckoutItemTile extends StatelessWidget {
  const CheckoutItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  height: khieght * 0.1,
                  child: Row(
                    children: [
                      Container(
                        width: khieght * 0.1,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(khieght * 0.01),
                            border: Border.all(color: Colors.grey),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  imgpath,
                                ))),
                      ),
                      SizedBox(
                        width: kwidth * 0.06,
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Titan watch', style: inter),
                            Text(
                              '₹799',
                              style: interbold,
                            ),
                            Container(
                              height: khieght * 0.024,
                              width: kwidth * 0.128,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(kwidth * 0.05),
                                  border: Border.all()),
                              child: Center(
                                child: Text(
                                  '1',
                                  style: interbold,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
  }
}