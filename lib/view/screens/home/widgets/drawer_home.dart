import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/common/widgets/loading.dart';
import 'package:time_craft/view/common/widgets/notification_widgets.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/cart/cart_screen.dart';
import 'package:time_craft/view/screens/home/widgets/drawer_tile.dart';
import 'package:time_craft/view/screens/orders/orders.dart';
import 'package:time_craft/view/screens/profile/profile.dart';
import 'package:time_craft/view/screens/settings/settings.dart';
import 'package:time_craft/view/screens/wishlist/wishlist_screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const String backgroundImage =
        'https://htmlcolorcodes.com/assets/images/colors/bright-blue-color-solid-background-1920x1080.png';
    return Drawer(
      child: SizedBox(
        child: ListView(
          children: [
            DrawerHeader(
              child: StreamBuilder(
                stream: FirebaseInstanceModel.user.doc(FirebaseInstanceModel.uid).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Loading();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        onBackgroundImageError: (exception, stackTrace) => errorShower(),
                        radius: khieght * 0.045,
                        backgroundImage: NetworkImage(snapshot.data?['image'] ?? backgroundImage),
                        child: Center(
                          child: snapshot.data!['image'] == null
                              ? Text(
                                  snapshot.data!['name'][0],
                                  style: GoogleFonts.inter(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              : const SizedBox(),
                        ),
                      ),
                      SizedBox(height: khieght * 0.01),
                      Text(snapshot.data!['name']),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: khieght * 0.02),
            DrawerTile(
              ontap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(WishlistScreen.routename);
              },
              icon: const Icon(Icons.favorite_border),
              title: 'Wishlist',
            ),
            DrawerTile(
              ontap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(Cart.routename);
              },
              icon: const Icon(Icons.shopping_cart),
              title: 'Cart',
            ),
            DrawerTile(
              ontap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(MyOrders.routename);
              },
              icon: const Icon(Icons.inventory),
              title: 'Orders',
            ),
            DrawerTile(
              ontap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(MyProfile.routename);
              },
              icon: const Icon(Icons.person),
              title: 'Profile',
            ),
            DrawerTile(
              ontap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(Settings.routename);
              },
              icon: const Icon(Icons.settings),
              title: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
