import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //SUPARBASE 
  await Supabase.initialize(
    url: 'https://dtvkaohqbtrxindvvnjg.supabase.co',
    anonKey: 'sb_publishable_GTPxFhQDgABICOp-7zptcg_KMhaKu_3',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthGate(),
    );
    
  }
}
