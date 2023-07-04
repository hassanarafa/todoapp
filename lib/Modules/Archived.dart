import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Components/ConditionBuilder.dart';
import '../Cubit/cubit.dart';
import '../Cubit/states.dart';

class Archived extends StatelessWidget {
  const Archived({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).archivedTasks;
        return ConditionBulder(
          tasks: tasks,
        );
      },
    );
  }
}
