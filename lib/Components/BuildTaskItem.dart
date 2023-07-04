import 'package:flutter/material.dart';
import 'package:flutter_application_23/Cubit/cubit.dart';

class BuildTaskItem extends StatelessWidget {
  final Map model;
  const BuildTaskItem({super.key, required this.model, context});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(model['id'].toString()),
        onDismissed: (direction) {
          AppCubit.get(context).deleteDataBase(id: model['id']);
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Center(
                    child: Text(
                  "${model["time"]}",
                  style: const TextStyle(fontSize: 15),
                )),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${model["title"]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "${model['date']}",
                      style: const TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context)
                        .updateDataBase(status: 'Done', id: model['id']);
                  },
                  icon: const Icon(
                    Icons.check_box,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context)
                        .updateDataBase(status: 'Archived', id: model['id']);
                  },
                  icon: const Icon(
                    Icons.archive,
                    color: Colors.black38,
                  ))
            ],
          ),
        ));
  }
}
