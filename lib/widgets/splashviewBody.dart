import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../Components/routes.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRouter.kHomepage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
            width: 200, height: 200, child: Image.asset("images/study.png")),
        Text(
          "TodoApp",
          style: GoogleFonts.acme(fontSize: 35),
        )
      ]),
    );
  }
}
