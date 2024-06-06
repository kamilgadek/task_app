import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:task_app/utils/app_str.dart';
import 'package:task_app/views/tasks/components/rep_textfield.dart';
import 'package:task_app/views/tasks/widget/task_view_app_bar.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController titleTaskController = TextEditingController();
  final TextEditingController descriptionTaskController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    // I can tap on screen and hide keybord
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
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

                      // Title Task Controller
                      RepTextField(controller: titleTaskController),

                      SizedBox(
                        height: 10,
                      ),

                      RepTextField(
                        controller: descriptionTaskController,
                        isForDescription: true,
                      ),

                      DateTimeSelectionWidget(textTheme: textTheme),
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
                text: '${AppStr.addNewTask} ',
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

class DateTimeSelectionWidget extends StatelessWidget {
  const DateTimeSelectionWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => SizedBox(
            height: 280,
            child: TimePickerWidget(
              onChange: (_,__) {},
              dateFormat: 'HH:mm',
              onConfirm: (dateTime, _) {
                
              },
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin:const EdgeInsets.all(20),
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                AppStr.timeString,
                style: textTheme.headlineSmall,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: 10,
              ),
              width: 80,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
              ),
              child: Center(
                child: Text(
                  'Time',
                  style: textTheme.titleSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
