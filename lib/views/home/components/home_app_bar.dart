import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isDrawerOpen = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void onDrawerToogle() {
    isDrawerOpen = !isDrawerOpen;
    if (isDrawerOpen) {
      animationController.forward();
    }else {
      animationController.reverse();
    }
  }

   @override
  Widget build(BuildContext context) {
    return AppBar(
      // Ustawienie tła na biały, aby dopasować do reszty aplikacji
      backgroundColor: Colors.white,
      elevation: 0, // Ustawienie bez cienia
      leading: IconButton(
        onPressed: () {
          setState(() {
            isDrawerOpen = !isDrawerOpen;
            isDrawerOpen
                ? animationController.forward()
                : animationController.reverse();
          });
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: animationController,
        ),
      ),
    );
  }
}