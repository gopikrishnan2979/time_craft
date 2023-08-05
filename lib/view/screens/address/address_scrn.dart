import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/address_scrn_controller.dart';
import 'package:time_craft/controller/address_text_controller.dart';
import 'package:time_craft/controller/checkout_address_controller.dart';
import 'package:time_craft/model/address_model.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/address/widgets/address_adding.dart';

class AddressScrn extends StatelessWidget {
  const AddressScrn({super.key});
  static const routename = '/Address';
  @override
  Widget build(BuildContext context) {
    Provider.of<AddressScrnController>(context, listen: false).getAddressList();
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCom(title: 'Address'),
        body: Column(
          children: [
            Expanded(
              child: Consumer<AddressScrnController>(builder: (context, controller, child) {
                bool isListempty = controller.addressList.isEmpty;
                return isListempty ? addressListIsEmpty() : addressListBuilder(context: context);
              }),
            ),
            SizedBox(
              height: khieght * 0.08,
              child: ColoredBox(
                color: black,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _addAddress(context);
                    },
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(kwidth * 0.6, khieght * 0.01)),
                        backgroundColor: const MaterialStatePropertyAll(white),
                        foregroundColor: const MaterialStatePropertyAll(black),
                        shape: const MaterialStatePropertyAll(ContinuousRectangleBorder())),
                    child: const Text('ADD ADDRESS'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  addressListBuilder({required BuildContext context}) {
    var checkoutAdd = Provider.of<CheckoutAddControl>(context, listen: false);
    AddressScrnController controller = Provider.of<AddressScrnController>(context, listen: false);
    var addresslist = controller.addressList;
    int selectedIndex = controller.selectedIndex!;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkoutAdd.setter(initAddress: addresslist[selectedIndex]);
    });

    return ListView.builder(
      itemCount: addresslist.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(kwidth * 0.03),
        child: InkWell(
          onTap: () => controller.changeSelected(newindex: index),
          child: addressCard(isSelected: selectedIndex == index, address: addresslist[index]),
        ),
      ),
    );
  }

  Widget addressCard({required bool isSelected, required AddressModel address}) {
    return Card(
      elevation: 4,
      color: Colors.blue[100],
      child: SizedBox(
        height: khieght * 0.15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(), shape: BoxShape.circle),
              width: kwidth * 0.08,
              child: Center(
                child: Container(
                  width: kwidth * 0.05,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? Colors.black : Colors.transparent,
                  ),
                ),
              ),
            ),
            SizedBox(width: kwidth * 0.7, child: addressContainer(address: address))
          ],
        ),
      ),
    );
  }

  Widget addressContainer({required AddressModel address}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(address.localAddress, overflow: TextOverflow.ellipsis),
        Text('${address.city}, ${address.district}'),
        Text('${address.state},'),
        Text('Pin: ${address.pincode}'),
        address.landmark != 'no landmark'
            ? Text('landmark: ${address.landmark}')
            : const SizedBox(),
      ],
    );
  }

  Widget addressListIsEmpty() {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Lottie.asset('assets/lotties/AddressEmpty.json'),
        const Text('Address list is empty'),
      ]),
    );
  }

  void _addAddress(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: black,
      builder: (_) {
        return ChangeNotifierProvider(
          create: (context) => AddressTextController(),
          child: AddressAdding(ctx: context),
        );
      },
    );
  }
}
