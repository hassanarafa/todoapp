import 'package:flutter/material.dart';
import 'package:flutter_application_23/Cubit/cubit.dart';

import '../Modules/details.dart';

class BuildTaskItem extends StatelessWidget {
  final Map model;
  final int index;
  const BuildTaskItem(
      {super.key, required this.model, context, required this.index});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(model['id'].toString()),
        onDismissed: (direction) {
          AppCubit.get(context).deleteDataBase(id: model['id']);
        },
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(model: model, index: index),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("${index + 1}"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${model["title"]}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "${model['date']}",
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        "${model["time"]}",
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
          ),
        ));
  }
}
