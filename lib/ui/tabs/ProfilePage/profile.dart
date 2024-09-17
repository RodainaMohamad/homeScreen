import 'package:flutter/cupertino.dart';

class profile extends StatelessWidget {
  static const String routeName = "profile";

  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('profile Screen'),
      ),
    );
  }
}