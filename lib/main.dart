import 'package:flutter/material.dart';
import 'package:pendakian_mobile/screens/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://lybautclaovyinuytynx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx5YmF1dGNsYW92eWludXl0eW54Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA1OTYwMjgsImV4cCI6MjA0NjE3MjAyOH0.yLwIbb9K46Bya1E_3pKEd-Z_tmU-nCeAB6D8cBNDVrY',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
    );
  }
}
