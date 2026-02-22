import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //SUPARBASE 
  await Supabase.initialize(
    url: 'https://mkjhrgwiuegyjoldhzim.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1ramhyZ3dpdWVneWpvbGRoemltIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk3MDYzMTQsImV4cCI6MjA4NTI4MjMxNH0.oGSQDRNBQ7KRxpqY7GY_buzR5DUFQDuuca9ABJO8RT0',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return const MaterialApp(
      home: AuthGate(),
    );

    
  }
}
