import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_23/Components/BuildTaskItem.dart';

class ConditionBulder extends StatelessWidget {
  const ConditionBulder({super.key, required this.tasks});
  final List<Map> tasks;
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) => BuildTaskItem(
                model: tasks[index],
                context: context,
              ),
          separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey,
              )),
          itemCount: tasks.length),
      fallback: (context) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.menu,
                size: 70,
                color: Colors.grey,
              ),
              Text(
                "No Tasks Yet, Enter Tasks Please",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        );
      },
    );
  }
}
