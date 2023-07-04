import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'Components/routes.dart';
import 'Cubit_Observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData(primarySwatch: Colors.brown),
      debugShowCheckedModeBanner: false,
    );
  }
}
