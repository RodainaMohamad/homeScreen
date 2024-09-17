import 'package:flutter/cupertino.dart';

class fav extends StatelessWidget {
  static const String routeName = "fav";

  const fav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('fav Screen'),
      ),
    );
  }
}