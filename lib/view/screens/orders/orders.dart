import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});
  static const String routename = '/Orders';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const AppbarCom(title: 'Orders'),
      body: ListView.separated(
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: kwidth * 0.2,
                      height: kwidth * 0.2,
                      child: Image.network(
                        imgpath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: kwidth * 0.4,
                      height: kwidth * 0.2,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Titan watch for men'),
                          Text('Order Id #000000')
                        ],
                      ),
                    ),
                    SizedBox(
                      width: kwidth * 0.1,
                      height: kwidth * 0.2,
                      child: IconButton(
                          onPressed: () {},
                          iconSize: 40,
                          icon:const Icon(
                            Icons.navigate_next_outlined,
                          )),
                    )
                  ],
                ),
              ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 5),
    ));
  }
}
