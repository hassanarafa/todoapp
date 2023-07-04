import 'package:flutter/material.dart';
import 'package:flutter_application_23/Cubit/cubit.dart';
import 'package:flutter_application_23/Cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Components/ConditionBuilder.dart';

class NewTasks extends StatelessWidget {
  const NewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newtasks;
        return ConditionBulder(
          tasks: tasks,
        );
      },
    );
  }
}
