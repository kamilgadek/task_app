import 'package:flutter/material.dart';
import 'package:task_app/utils/app_str.dart';
import 'package:task_app/views/tasks/widget/task_view_app_bar.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    // I can tap on screen and hide keybord
    return GestureDetector( onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        // appBar
        appBar: const TaskViewAppBar(),
      
        // Body
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Top Text
                _buildTopSideTexts(textTheme),
      
                SizedBox(
                  width: double.infinity,
                  height: 530,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          AppStr.titleOfTitleTextField,
                          style: textTheme.headlineMedium,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        child: TextFormField(
                          maxLines: 6,
                          cursorHeight: 60,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildTopSideTexts(TextTheme textTheme) {
    return SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            const SizedBox(
              width: 70,
              child: Divider(
                thickness: 2,
              ),
            ),
            RichText(
              text: TextSpan(
                text: AppStr.addNewTask + ' ',
                style: textTheme.titleLarge,
                children: const [
                  TextSpan(
                    text: AppStr.taskString,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 70,
              child: Divider(
                thickness: 2,
              ),
            ),
          ],
        ));
  }
}
