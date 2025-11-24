import 'package:fitness_app/navigation/main_navigation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const measurementrscreenroutr = '/';
  AppRouter._();

  static final GoRouter goRouter = GoRouter(
    initialLocation: measurementrscreenroutr,
    routes: [
      GoRoute(
        path: measurementrscreenroutr,
        builder: (context, state) => const MainNavigation(),
      ),
    ],
  );
}
