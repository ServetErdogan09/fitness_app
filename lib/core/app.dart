import 'package:fitness_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF13EC5B),
        scaffoldBackgroundColor: const Color(0xFF102216),

        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
