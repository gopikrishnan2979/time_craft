import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/address_controllers/address_scrn_controller.dart';
import 'package:time_craft/controller/address_controllers/address_text_controller.dart';
import 'package:time_craft/services/validator/validator_textfield.dart';
import 'package:time_craft/view/core/styles.dart';

final GlobalKey<FormState> formkey = GlobalKey<FormState>();

class AddressAdding extends StatelessWidget {
  const AddressAdding({super.key, required this.ctx});
  final BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    return Consumer<AddressTextController>(builder: (context, textCon, child) {
      var localAddressCon = textCon.localAddressCon;
      var cityController = textCon.cityController;
      var districtController = textCon.districtController;
      var stateController = textCon.stateController;
      var pinController = textCon.pinController;
      var landmark = textCon.landmark;
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: khieght * 0.03, horizontal: kwidth * 0.02),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.add_location_alt_outlined, color: white),
                      Text('ADD ADDRESS', style: interwhitebold),
                    ],
                  ),
                  sizedboxwithheight(khieght * 0.03),
                  textfield(
                    hint: 'Local Address',
                    keyboardtype: TextInputType.streetAddress,
                    controller: localAddressCon,
                  ),
                  sizedboxwithheight(khieght * 0.03),
                  textfield(
                    hint: 'City',
                    keyboardtype: TextInputType.name,
                    controller: cityController,
                  ),
                  sizedboxwithheight(khieght * 0.03),
                  textfield(
                    hint: 'District',
                    keyboardtype: TextInputType.name,
                    controller: districtController,
                  ),
                  sizedboxwithheight(khieght * 0.03),
                  textfield(
                    hint: 'State',
                    keyboardtype: TextInputType.name,
                    controller: stateController,
                  ),
                  sizedboxwithheight(khieght * 0.03),
                  textfield(
                    hint: 'Pincode',
                    keyboardtype: TextInputType.number,
                    controller: pinController,
                  ),
                  sizedboxwithheight(khieght * 0.03),
                  textfield(
                    hint: 'Landmark (optional)',
                    controller: landmark,
                    keyboardtype: TextInputType.text,
                    isOptional: true,
                  ),
                  sizedboxwithheight(khieght * 0.05),
                  addAddressButton(context: context)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget textfield(
      {required TextEditingController controller,
      required String hint,
      required TextInputType keyboardtype,
      bool isOptional = false}) {
    return TextFormField(
      validator: (value) => Validation().addressValidation(isOptional: isOptional, value: value),
      controller: controller,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        fillColor: white,
        filled: true,
        hintText: hint,
        hintStyle: GoogleFonts.inter(color: Colors.grey),
        prefixIcon: const Icon(Icons.not_listed_location_rounded),
        prefixIconColor: black,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: black),
        ),
      ),
    );
  }

  Widget addAddressButton({required BuildContext context}) {
    return Center(
      child: ElevatedButton(
          onPressed: () async {
            if (formkey.currentState!.validate()) {
              AddressTextController controller =
                  Provider.of<AddressTextController>(context, listen: false);
              AddressScrnController addScrnController =
                  Provider.of<AddressScrnController>(ctx, listen: false);
              Navigator.of(context).pop();
              await controller.addressAdding(ctx);
              addScrnController.getAddressList();
            }
          },
          style: ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size(kwidth * 0.5, khieght * 0.01)),
              backgroundColor: const MaterialStatePropertyAll(white),
              foregroundColor: const MaterialStatePropertyAll(black),
              shape: const MaterialStatePropertyAll(ContinuousRectangleBorder())),
          child: Text('ADD ADDRESS', style: interbold)),
    );
  }
}
