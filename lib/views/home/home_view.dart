import 'package:flutter/material.dart';
import 'package:task_app/space_exts.dart';
import 'package:task_app/utils/app_colors.dart';
import 'package:task_app/utils/app_str.dart';
import 'package:task_app/utils/constants.dart';
import 'package:task_app/views/home/components/home_app_bar.dart';
import 'package:task_app/views/home/components/slider_drawer.dart';
import 'package:task_app/views/home/widget/task_widget.dart';
import 'components/floating_action_button.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'package:animate_do/animate_do.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
   final GlobalKey<SliderDrawerState> drawerKey = GlobalKey<SliderDrawerState>();
  final List<int> testing = [];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: const Fab(),

      // body
      body: SliderDrawer(
          key: drawerKey,
          isDraggable: false,
          animationDuration: 1000,
        // Drawer
        slider: CustomDrawer(),
        
        appBar:  HomeAppBar(drawerKey: drawerKey,),

        child: _buildHomeBody(textTheme: textTheme, testing: testing),
      ),
    );
  }
}

// Home Body
class _buildHomeBody extends StatelessWidget {
  const _buildHomeBody({
    required this.textTheme,
    required this.testing,
  });

  final TextTheme textTheme;
  final List<int> testing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Expanded(
        child: Column(
          children: [
            // Custome AppBar
            Container(
              margin: const EdgeInsets.only(top: 60),
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Circullar Progress Indicator (kółko)
                  const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      value: 1 / 3,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation(
                        AppColors.primaryColor,
                      ),
                    ),
                  ),
                  25.w,
        
                  // Top level task info (1 of 3)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStr.mainTitle,
                        style: textTheme.displayLarge,
                      ),
                      3.h,
                      Text(
                        '1 of 3 task',
                        style: textTheme.titleMedium,
                      )
                    ],
                  ),
                ],
              ),
            ),
        
            // Divider (linia pod AppBar)
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Divider(
                thickness: 2,
                indent: 100,
              ),
            ),
        
            //Tasks List
            SizedBox(
              height: 535,
              width: double.infinity,
              child: testing.isNotEmpty
        
                  // Tasks list is not empty
                  ? ListView.builder(
                      itemCount: testing.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          direction: DismissDirection.horizontal,
                          onDismissed: (_) {},
                          background: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.delete_outline,
                              ),
                              8.w,
                              const Text(
                                AppStr.deletedTask,
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          key: Key(
                            index.toString(),
                          ),
                          child: const TaskWidget(),
                        );
                      },
                    )
        
                  // Tasks list is empty
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Lottie Anime
                        FadeIn(
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Lottie.asset(
                              lottieURL,
                              animate: testing.isNotEmpty ? false : true,
                            ),
                          ),
                        ),
        
                        // sub Text
                        FadeInUp(
                          from: 30,
                          child: const Text(AppStr.doneAllTask),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
