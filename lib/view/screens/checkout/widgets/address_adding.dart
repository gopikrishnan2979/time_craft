import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/core/styles.dart';

class AddressAdding extends StatelessWidget {
  const AddressAdding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(khieght * 0.02),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.add_location_alt_outlined,
                  color: white,
                ),
                Text(
                  'ADD ADDRESS',
                  style: interwhitebold,
                ),
              ],
            ),
            sizedboxwithheight(khieght * 0.03),
            textfield(hint: 'Local Address'),
            sizedboxwithheight(khieght * 0.03),
            textfield(hint: 'City'),
            sizedboxwithheight(khieght * 0.03),
            textfield(hint: 'District'),
            sizedboxwithheight(khieght * 0.03),
            textfield(hint: 'State'),
            sizedboxwithheight(khieght * 0.03),
            textfield(hint: 'Pincode'),
            sizedboxwithheight(khieght * 0.03),
            textfield(hint: 'Landmark'),
            sizedboxwithheight(khieght * 0.05),
            addAddressButton(context)
          ],
        ),
      ),
    );
  }

  Widget textfield({required String hint}) {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: white,
          filled: true,
          hintText: hint,
          hintStyle: GoogleFonts.inter(color: Colors.grey),
          prefixIcon: const Icon(Icons.not_listed_location_rounded),
          prefixIconColor: black,
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
    );
  }

  Widget addAddressButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
              fixedSize:
                  MaterialStatePropertyAll(Size(kwidth * 0.5, khieght * 0.01)),
              backgroundColor: const MaterialStatePropertyAll(white),
              foregroundColor: const MaterialStatePropertyAll(black),
              shape:
                  const MaterialStatePropertyAll(ContinuousRectangleBorder())),
          child: Text(
            'ADD ADDRESS',
            style: interbold,
          )),
    );
  }
}
