import 'package:flutter/material.dart';
import 'package:trial_hpg/domain/getIt.dart';
import 'package:trial_hpg/ui/MainLayout.dart';
import 'package:trial_hpg/ui/tabs/CategoriesPage/Categories.dart';
import 'package:trial_hpg/ui/tabs/homePage/homepg.dart';

void main() async {
  await setLocator();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'Home',
      routes: {
        'Home': (context) => MainLayout(body: Home(), initialIndex: 0),
        'categories': (context) => MainLayout(body: categories(), initialIndex: 1),
      },
    );
  }
}