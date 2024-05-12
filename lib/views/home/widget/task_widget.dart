import 'package:flutter/material.dart';
import 'package:task_app/utils/app_colors.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigate to Task View to see task details
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primaryColor.withOpacity(0.1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        duration: const Duration(
          microseconds: 600,
        ),
      
        // check Icon
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              //check or uncheck the task
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: .8,
                ),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
          ),
          // Task title
          title: const Padding(
            padding: EdgeInsets.only(top: 3, bottom: 5),
            child: Text(
              'Done',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                //decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
      
          subtitle: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
      
              // Date of Task
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'SubDate',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
