import 'dart:developer';
import 'package:flutter/material.dart';
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
    return Drawer(
      child: SizedBox(
        child: ListView(
          children: [
            const DrawerHeader(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: 38,
                    backgroundImage: AssetImage('assets/images/unknown.jpg')),
                SizedBox(
                  height: 15,
                ),
                Text('User name'),
              ],
            )),
            SizedBox(
              height: khieght * 0.02,
            ),
            DrawerTile(
                ontap: () {
                  log('pressed wishlist');
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(WishlistScreen.routename);
                },
                icon: const Icon(Icons.favorite_border),
                title: 'Wishlist'),
            DrawerTile(
                ontap: () {
                  log('pressed cart');
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(Cart.routename);
                },
                icon: const Icon(Icons.shopping_cart),
                title: 'Cart'),
            DrawerTile(
                ontap: () {
                  log('pressed orders');
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(MyOrders.routename);
                },
                icon: const Icon(Icons.inventory),
                title: 'Orders'),
            DrawerTile(
                ontap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(MyProfile.routename);
                  log('pressed profile');
                },
                icon: const Icon(Icons.person),
                title: 'Profile'),
            DrawerTile(
                ontap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(Settings.routename);
                  log('pressed Settings');
                },
                icon: const Icon(Icons.settings),
                title: 'Settings'),
          ],
        ),
      ),
    );
  }
}
