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

    return Scaffold(
      // appBar
      appBar: const TaskViewAppBar(),

      // Body
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
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
                )),
          ],
        ),
      ),
    );
  }
}
