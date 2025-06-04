import 'package:fago/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://brxpjpvcinrrybhbxqhb.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJyeHBqcHZjaW5ycnliaGJ4cWhiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDgxODExNDUsImV4cCI6MjA2Mzc1NzE0NX0.1Bq7ORts4g9dfY-7sVK4DPWIH7DLKuW-KQz_gnT7XGs',
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fago',
      routerConfig: route,
    );
  }
}

