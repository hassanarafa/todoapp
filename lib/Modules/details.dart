import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map model;
  final int index;
  const DetailPage({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Topic:",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
              ),
              const SizedBox(height: 20),
              Text(
                "${model["title"]}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Back")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
