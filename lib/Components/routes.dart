import 'package:go_router/go_router.dart';

import '../Modules/home.dart';
import '../splashview.dart';

abstract class AppRouter {
  static const kHomepage = "/homepage";
  static final router = GoRouter(routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const Splashview(),
    ),
    GoRoute(
      path: kHomepage,
      builder: (context, state) => HomePage(),
    ),
  ]);
}
