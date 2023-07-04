import 'package:flutter/material.dart';
import 'package:flutter_application_23/widgets/splashviewBody.dart';

class Splashview extends StatelessWidget {
  const Splashview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 0), body: const SplashViewBody());
  }
}
