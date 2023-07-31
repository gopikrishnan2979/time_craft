import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/user_editor_controller.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/profile/widgets/user_data_edit_popup.dart';

class UserDataBox extends StatelessWidget {
  const UserDataBox({
    super.key,
    required this.title,
    required this.ctx,
    required this.data,
    this.isEmail = false,
    this.isName = false,
    this.isPhone = false,
  });
  final String title;
  final String data;
  final bool isName;
  final bool isEmail;
  final bool isPhone;
  final BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: khieght * 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(fontWeight: FontWeight.w500),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            width: kwidth * 0.8,
            padding: const EdgeInsets.only(left: 20),
            height: 40,
            child: isEmail
                ? Align(alignment: Alignment.centerLeft, child: Text(data, style: inter))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data, style: inter),
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => ChangeNotifierProvider(
                                create: (context) => UserEditingController(initialData: data),
                                child: UserDataEditor(
                                  isname: isName,
                                  initialText: data,
                                  ctx: ctx,
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit))
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
