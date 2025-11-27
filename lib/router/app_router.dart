import 'package:fitness_app/features/tracking/screens/nutrition_screen.dart';
import 'package:fitness_app/features/tracking/screens/body_measurements_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const measurements = '/measurements';
  static const nutrition = '/nutrition';
  static const training = '/training';
  static const addScreen = '/addfood/:mealId';
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.measurements,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: AppRoutes.measurements,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: BodyMeasurementScreen()),
          ),
          GoRoute(
            path: AppRoutes.nutrition,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: NutritionScreen()),
          ),
          GoRoute(
            path: AppRoutes.training,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TrainingScreen()),
          ),

          /*
          GoRoute(
            path: '${AppRoutes.addScreen}/:mealId',
            pageBuilder: (context, state) {
              final mealId =
                  int.tryParse(state.pathParameters['mealId'] ?? '0') ?? 0;
              return NoTransitionPage(child: AddFoodScreen(mealId: mealId));
            },
          ),
          */
        ],
      ),
    ],
  );
});

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({required this.child, super.key});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location == AppRoutes.measurements) return 0;
    if (location == AppRoutes.nutrition) return 1;
    if (location == AppRoutes.training) return 2;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRoutes.measurements);
        break;
      case 1:
        context.go(AppRoutes.nutrition);
        break;
      case 2:
        context.go(AppRoutes.training);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF102216),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(context, index),
        selectedItemColor: const Color(0xFF13EC5B),
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color(0xFF102216),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_weight),
            label: 'Ölçümler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Beslenme',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Antrenman',
          ),
        ],
      ),
    );
  }
}

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Antrenman Sayfası',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
