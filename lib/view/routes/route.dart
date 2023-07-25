import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/product/qty_controller.dart';
import 'package:time_craft/controller/product/varient_controller.dart';
import 'package:time_craft/controller/search_controller.dart';
import 'package:time_craft/model/checkout_model.dart';
import 'package:time_craft/model/product_argument.dart';
import 'package:time_craft/view/screens/cart/cart_screen.dart';
import 'package:time_craft/view/screens/checkout/checkout.dart';
import 'package:time_craft/view/screens/checkout/order_placed.dart';
import 'package:time_craft/view/screens/home/home.dart';
import 'package:time_craft/view/screens/orders/orders.dart';
import 'package:time_craft/view/screens/product/product_details.dart';
import 'package:time_craft/view/screens/profile/profile.dart';
import 'package:time_craft/view/screens/reviews/review_screen.dart';
import 'package:time_craft/view/screens/search/search.dart';
import 'package:time_craft/view/screens/settings/settings.dart';
import 'package:time_craft/view/screens/signin_signup/signin/signin.dart';
import 'package:time_craft/view/screens/signin_signup/signup/signup.dart';
import 'package:time_craft/view/screens/splashscreen/splash_screen.dart';
import 'package:time_craft/view/screens/wishlist/wishlist_screen.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SplashScreen.routename:
        return MaterialPageRoute(builder: (ctx) => const SplashScreen());
      case SignInPage.routename:
        return MaterialPageRoute(builder: (ctx) => const SignInPage());
      case SignUpPage.routename:
        return MaterialPageRoute(builder: (ctx) => const SignUpPage());
      case WishlistScreen.routename:
        return MaterialPageRoute(builder: (ctx) => const WishlistScreen());
      case Home.routename:
        return MaterialPageRoute(builder: (ctx) => const Home());
      case Cart.routename:
        return MaterialPageRoute(builder: (ctx) => const Cart());
      case MyOrders.routename:
        return MaterialPageRoute(builder: (ctx) => const MyOrders());
      case MyProfile.routename:
        return MaterialPageRoute(builder: (ctx) => const MyProfile());
      case Settings.routename:
        return MaterialPageRoute(builder: (ctx) => const Settings());
      case SearchScrn.routename:
        return MaterialPageRoute(
          builder: (ctx) => ChangeNotifierProvider(
            create: (context) => SearchProvider(),
            child:  SearchScrn(),
          ),
        );
      case ProductDetails.routename:
        return MaterialPageRoute(builder: (ctx) {
          final arg = routeSettings.arguments as ProductArgument;

          return MultiProvider(providers: [
            ChangeNotifierProvider(create: (context) => QtyController()),
            ChangeNotifierProvider(create: (context) => VarientController())
          ], child: ProductDetails(data: arg));
        });
      case CheckOutScrn.routename:
        return MaterialPageRoute(builder: (ctx) {
          final arg = routeSettings.arguments as CheckoutModel;
          return CheckOutScrn(checkoutData: arg);
        });
      case OrderPlaced.routename:
        return MaterialPageRoute(builder: (ctx) => const OrderPlaced());
      case ReviewScreen.routename:
        return MaterialPageRoute(builder: (ctx) => const ReviewScreen());
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return const Scaffold(
        body: Center(
          child: Text('Something Error'),
        ),
      );
    });
  }
}
