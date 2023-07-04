import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Components/ConditionBuilder.dart';
import '../Cubit/cubit.dart';
import '../Cubit/states.dart';

class Done extends StatelessWidget {
  const Done({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).doneTasks;
        return ConditionBulder(
          tasks: tasks,
        );
      },
    );
  }
}
