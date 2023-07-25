import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/product/qty_controller.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/common/widgets/loading.dart';
import 'package:time_craft/view/core/styles.dart';

class CheckoutItemTile extends StatelessWidget {
  const CheckoutItemTile({super.key, required this.docId, required this.isfromProductdetails});
  final String docId;
  final bool isfromProductdetails;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: khieght * 0.1,
      child: StreamBuilder(
        stream: FirebaseInstanceModel.products.doc(docId).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Loading();
          }
          return Row(
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
                      snapshot.data!['imagelist'][0],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: kwidth * 0.06,
              ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snapshot.data!['name'], style: inter),
                    Text("₹${snapshot.data!['price']}", style: interbold),
                    isfromProductdetails
                        ? Consumer<QtyController>(builder: (context, qtyController, child) {
                            return SizedBox(
                              width: kwidth * 0.2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  incAndDecButton(icon: Icons.remove, context: context),
                                  Text(
                                    '${qtyController.qty}',
                                    style: GoogleFonts.inter(fontSize: 15),
                                  ),
                                  incAndDecButton(icon: Icons.add, context: context, isAdd: true)
                                ],
                              ),
                            );
                          })
                        : Container(
                            height: khieght * 0.024,
                            width: kwidth * 0.128,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kwidth * 0.05),
                              border: Border.all(),
                            ),
                            child: Center(
                              child: Text(
                                '1',
                                style: interbold,
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget incAndDecButton(
      {required IconData icon, required BuildContext context, bool isAdd = false}) {
    return InkWell(
      onTap: () {
        if (isAdd) {
          Provider.of<QtyController>(context, listen: false).incrementQty();
        } else {
          Provider.of<QtyController>(context, listen: false).decrementQty();
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(khieght * 0.0125),
        child: ColoredBox(
          color: black,
          child: SizedBox(
            width: khieght * 0.025,
            height: khieght * 0.025,
            child: Icon(
              icon,
              color: white,
              size: khieght * 0.02,
            ),
          ),
        ),
      ),
    );
  }
}
