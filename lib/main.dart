import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/payment_selector.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/routes/route.dart';
import 'package:time_craft/view/screens/splashscreen/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.grey));
    khieght = MediaQuery.of(context).size.height;
    kwidth = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PaymentSelector(),
        )
      ],
      child: MaterialApp(
        title: 'Time Craft',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        onGenerateRoute: AppRoute.onGenerateRoute,
        initialRoute: SplashScreen.routename,
      ),
    );
  }
}
