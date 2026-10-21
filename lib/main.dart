// lib/main.dart
import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/not_found_screen.dart';

void main() {
  runApp(const NusaTravelApp());
}

class NusaTravelApp extends StatelessWidget {
  const NusaTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NusaTravel',
      debugShowCheckedModeBanner: false, // Menghilangkan pita "DEBUG" di pojok kanan atas
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto', // Menggunakan font bawaan namun rapi
      ),
      
      // 1. Initial Route: Halaman pertama kali dibuka
      initialRoute: AppRoutes.splash,
      
      // 2. Routes standar (yang tidak memerlukan pelemparan data kompleks antar halaman)
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.home: (context) => HomeScreen(),
      },
      
      // 3. onGenerateRoute: Untuk rute dinamis (seperti Detail yang butuh argument data paket)
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.detail) {
          return MaterialPageRoute(
            builder: (context) => const DetailScreen(),
            settings: settings, // Penting: meneruskan settings yang berisi arguments ke MaterialPageRoute
          );
        }
        // Jika mereturn null, sistem akan mengoper ke onUnknownRoute
        return null; 
      },
      
      // 4. onUnknownRoute: Jika aplikasi mencoba menuju rute yang tidak ada di "routes" maupun "onGenerateRoute"
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const NotFoundScreen(),
        );
      },
    );
  }
}