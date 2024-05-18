import 'package:flutter/cupertino.dart';
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
    return SizedBox(
      width: double.infinity,
      height: 100,
      child : Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                //Tym przyciskiem będę usuwał zadania

              },
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: animationController,
                size: 40,
              ),
            ),
             IconButton(
              onPressed: onDrawerToogle,
              icon: Icon(
                Icons.delete,
                size: 40,
              )
            ),
          ],
        ),
      ),
    );
  }
}