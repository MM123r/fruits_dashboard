import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruits_dashboard/core/services/get_it_service.dart';
import 'package:fruits_dashboard/core/services/supabase_storage.dart';
import 'package:fruits_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:fruits_dashboard/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseStorageService.initSupabase();

  
  await SupabaseStorageService.createBuckets('fruits_image');

  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupGetit();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardView(),
    );
  }
}
