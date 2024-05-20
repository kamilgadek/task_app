import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_app/utils/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final List<IconData> icon = [
    Icons.home,
    Icons.person,
    Icons.settings,
    Icons.info,
  ];

  final List<String> texts = [
    "Home",
    "Profile",
    "Settings",
    "About",
  ];

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 90),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.primaryGradientColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/img/foto.png'),
          ),
          SizedBox(
            height: 8,
          ),
          Text('Kamil Gadek', style: textTheme.displayMedium),
          Text('Flutter Dev', style: textTheme.displaySmall),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            width: double.infinity,
            height: 300,
            child: ListView.builder(
                itemCount: icon.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      child: ListTile(
                        leading: Icon(
                          icon[index],
                          color: Colors.white,
                          size: 30,
                        ),
                        title: Text(
                          texts[index],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
