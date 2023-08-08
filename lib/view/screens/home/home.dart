import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/userdata_controllers/user_editor_controller.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/screens/home/all_screen.dart';
import 'package:time_craft/view/screens/home/kid_screen.dart';
import 'package:time_craft/view/screens/home/men_screen.dart';
import 'package:time_craft/view/screens/home/widgets/appbar_home.dart';
import 'package:time_craft/view/screens/home/widgets/drawer_home.dart';
import 'package:time_craft/view/screens/home/women_screen.dart';
import 'package:time_craft/view/screens/profile/widgets/user_data_edit_popup.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const String routename = '/Home';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (FirebaseInstances.userPhone == null || FirebaseInstances.userPhone == '') {
        showDialog(
          context: context,
          builder: (_) => ChangeNotifierProvider(
            create: (context) => UserEditingController(initialData: ''),
            child: WillPopScope(
                child: UserDataEditor(
                  initialText: '',
                  ctx: context,
                  isFromHome: true,
                ),
                onWillPop: () async => false),
          ),
        );
      }
    });
    return const SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: HomeAppbar(),
          drawer: HomeDrawer(),
          body: TabBarView(
            children: [
              AllScreens(),
              MensScreen(),
              WomenScreens(),
              KidsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
