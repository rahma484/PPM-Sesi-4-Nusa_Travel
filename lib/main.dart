import 'package:flutter/material.dart';

// Import semua halaman (screens)
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/not_found_screen.dart';

// Import model data
import 'models/tour_package.dart';

void main() {
  runApp(const NusaTravelApp());
}

class NusaTravelApp extends StatelessWidget {
  const NusaTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NusaTravel',
      debugShowCheckedModeBanner: false, // Menghilangkan label "DEBUG" di pojok kanan atas
      
      // Pengaturan Tema Global (Menyesuaikan dengan referensi UI)
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA), // Latar belakang abu terang
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00BFA5), // Warna toska sebagai seed
          primary: const Color(0xFF0F3443),   // Warna biru gelap untuk elemen utama
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F3443),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      ),

      // 1. Rute Awal Aplikasi
      initialRoute: '/',

      // 2. Daftar Rute Statis (Navigation)
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => HomeScreen(),
      },

      // 3. Penanganan Rute Dinamis (Mengirim Argumen Data)
      onGenerateRoute: (settings) {
        // Rute ke Halaman Detail
        if (settings.name == '/detail') {
          final package = settings.arguments as TourPackage;
          return MaterialPageRoute(
            builder: (context) => DetailScreen(package: package),
          );
        }
        // Rute ke Halaman Form Pemesanan
        if (settings.name == '/booking') {
          final package = settings.arguments as TourPackage;
          return MaterialPageRoute(
            builder: (context) => BookingScreen(package: package),
          );
        }
        return null;
      },

      // 4. Penanganan Rute Tidak Ditemukan (Error 404 Not Found)
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const NotFoundScreen(),
        );
      },
    );
  }
}