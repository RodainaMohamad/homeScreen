import 'package:flutter/material.dart';
import 'package:trial_hpg/ui/BottomBar.dart';

// class MainLayout extends StatefulWidget {
//   final Widget body;
//   final int initialIndex;
//
//   const MainLayout({
//     super.key,
//     required this.body,
//     required this.initialIndex,
//   });
//
//   @override
//   _MainLayoutState createState() => _MainLayoutState();
// }
class MainLayout extends StatefulWidget {
  final Widget body;
  final int initialIndex;

  const MainLayout({
    super.key,
    required this.body,
    required this.initialIndex,
  });

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacementNamed(context, 'Home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, 'categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.body,
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}

// class _MainLayoutState extends State<MainLayout> {
//   int _currentIndex=0;
//
//   @override
//   void initState() {
//     super.initState();
//     _currentIndex = widget.initialIndex;
//   }
//
//   void _onTap(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//     if (index == 0) {
//       Navigator.pushNamed(context, 'home');
//     } else if (index == 1) {
//       Navigator.pushNamed(context, 'categories');
//     } else if (index == 2) {
//       Navigator.pushNamed(context, 'fav');
//     } else if (index == 3) {
//       Navigator.pushNamed(context, 'profile');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: widget.body,
//       bottomNavigationBar: BottomBar(
//         currentIndex: _currentIndex,
//         onTap: _onTap,
//       ),
//     );
//   }
// }