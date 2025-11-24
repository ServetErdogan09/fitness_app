import 'package:fitness_app/core/services/local_databse_service.dart';
import 'package:fitness_app/features/tracking/provider/body_measumurent_provider.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/router/app_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize database
  final dbService = DatabaseService();
  await dbService.initialize();

  runApp(MyApp(dbService: dbService));
}

class MyApp extends StatelessWidget {
  final DatabaseService dbService;

  const MyApp({super.key, required this.dbService});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BodyMeasurementProvider(dbService: dbService),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Fitness App',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color(0xFF13EC5B),
          scaffoldBackgroundColor: const Color(0xFF102216),
          fontFamily: 'Manrope',
        ),
        routerConfig: AppRouter.goRouter,
      ),
    );
  }
}
