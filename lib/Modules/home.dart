import 'package:flutter/material.dart';
import 'package:flutter_application_23/Cubit/cubit.dart';
import 'package:flutter_application_23/Cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widgets/CustomTextFormField.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final timeController = TextEditingController();
  final titleController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit()..createDataBase(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            if (state is AppInsertDataBaseState) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return Form(
              key: _formKey,
              child: Scaffold(
                  key: _scaffoldKey,
                  bottomNavigationBar: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      elevation: 20,
                      currentIndex: cubit.currentIndex,
                      onTap: (value) {
                        cubit.changeIndex(value);
                      },
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.menu), label: "Menu"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.done_outline), label: "Done"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.archive_outlined),
                            label: "Archive"),
                      ]),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      if (cubit.isButtomSheetShown) {
                        if (_formKey.currentState!.validate()) {
                          cubit.insertDataBase(
                              title: titleController.text,
                              time: timeController.text,
                              date: dateController.text);
                        }
                      } else {
                        cubit.sicon = Icons.edit;
                        _scaffoldKey.currentState
                            ?.showBottomSheet((context) => Container(
                                  padding: const EdgeInsets.all(10),
                                  color: Colors.grey[100],
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomTextFormField(
                                          controller: titleController,
                                          hintText: "Topic"),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFormField(
                                        controller: (cubit.sicon == Icons.edit)
                                            ? null
                                            : timeController,
                                        ontap: () {
                                          showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now())
                                              .then((value) {
                                            timeController.text = value!
                                                .format(context)
                                                .toString();
                                            print(value
                                                .format(context)
                                                .toString());
                                          });
                                        },
                                        hintText: "Time",
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFormField(
                                        controller: dateController,
                                        ontap: () async {
                                          await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1950),
                                                  lastDate: DateTime(2100))
                                              .then((value) {
                                            dateController.text =
                                                DateFormat.yMMMd()
                                                    .format(value!);
                                          });
                                        },
                                        hintText: "Date",
                                      ),
                                    ],
                                  ),
                                ))
                            .closed
                            .then((value) {
                          cubit.changeButtomSheetState(
                              isShown: false, icond: Icons.edit);
                        });
                        cubit.changeButtomSheetState(
                            isShown: true, icond: Icons.add);
                      }
                    },
                    child: Icon(cubit.sicon),
                  ),
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Text(cubit.textAppBar[cubit.currentIndex]),
                  ),
                  body: ConditionalBuilder(
                    builder: (context) => cubit.screens[cubit.currentIndex],
                    condition: state is! AppGetDataBaseLoadingState,
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  )),
            );
          },
        ));
  }
}
