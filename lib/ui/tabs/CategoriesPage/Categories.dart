import 'package:flutter/material.dart';

class categories extends StatefulWidget {
  static const String routeName = "categories";

  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Categories Screen'),
      ),
    );
  }
}