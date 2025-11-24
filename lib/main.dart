import 'package:fitness_app/core/app.dart';
import 'package:fitness_app/core/services/local_databse_service.dart';
import 'package:fitness_app/features/tracking/provider/body_measurement_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_http_request.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('tr_TR', "");

  final dbService = DatabaseService();
  await dbService.initialize();

  runApp(
    ProviderScope(
      overrides: [databaseServiceProvider.overrideWithValue(dbService)],
      child: const MyApp(),
    ),
  );
}
