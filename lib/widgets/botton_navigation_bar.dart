import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

// ignore: must_be_immutable
class CustomNavigationBar extends StatefulWidget {
  CustomNavigationBar({Key? key, required this.selectedIndex, required this.onTap}) : super(key: key);
  int selectedIndex;
  void Function(int) onTap;

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)));
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.pinned;
  SnakeShape snakeShape = SnakeShape.rectangle;
  EdgeInsets padding = const EdgeInsets.all(0);
  bool showSelectedLabels = true;
  bool showUnselectedLabels = false;
  Gradient selectedGradient = const LinearGradient(colors: [Colors.purple, Colors.deepPurple]);
  Gradient unselectedGradient = const LinearGradient(colors: [Colors.black, Colors.black]);

  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      behaviour: snakeBarStyle,
      snakeShape: snakeShape,
      shape: bottomBarShape,
      padding: padding,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.white,
      backgroundColor: Colors.grey.shade300,
      // snakeViewGradient: selectedGradient,
      // selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
      // unselectedItemGradient: unselectedGradient,
      showUnselectedLabels: showUnselectedLabels,
      showSelectedLabels: showSelectedLabels,
      currentIndex: widget.selectedIndex,
      onTap: (index) => {widget.onTap(index)},
      items: [
        BottomNavigationBarItem(icon: widget.selectedIndex == 0 ? const Icon(Icons.home) : const Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: widget.selectedIndex == 1 ? const Icon(Icons.account_box) : const Icon(Icons.account_box_outlined), label: 'Profile'),
      ],
      selectedLabelStyle: const TextStyle(fontSize: 14),
      unselectedLabelStyle: const TextStyle(fontSize: 10),
    );
  }
}
