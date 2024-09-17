import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue, // Set the background color to blue
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 0 ? Colors.blue : Colors.transparent,
                ),
              ),
              const Icon(Icons.home, color: Colors.black),
            ],
          ),
          label: '',
          activeIcon: Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
              const Icon(Icons.home, color: Colors.black),
            ],
          ),
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 1 ? Colors.blue : Colors.transparent,
                ),
              ),
              const Icon(Icons.grid_view_outlined, color: Colors.black),
            ],
          ),
          label: '',
          activeIcon: Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
              const Icon(Icons.grid_view_outlined, color: Colors.black),
            ],
          ),
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 2 ? Colors.blue : Colors.transparent,
                ),
              ),
              const Icon(Icons.favorite, color: Colors.black),
            ],
          ),
          label: '',
          activeIcon: Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
              const Icon(Icons.favorite, color: Colors.black),
            ],
          ),
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 3 ? Colors.blue : Colors.transparent,
                ),
              ),
              const Icon(Icons.person, color: Colors.black),
            ],
          ),
          label: '',
          activeIcon: Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
              const Icon(Icons.person, color: Colors.black),
            ],
          ),
        ),
      ],
    );
  }
}