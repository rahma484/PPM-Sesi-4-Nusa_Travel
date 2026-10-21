// lib/screens/detail_screen.dart
import 'package:flutter/material.dart';

import '../models/tour_package.dart';
import 'booking_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Logika: Menerima argument yang dikirimkan dari HomeScreen (harus di-cast menjadi object TourPackage)
    final TourPackage package =
        ModalRoute.of(context)!.settings.arguments as TourPackage;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Paket'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      // SingleChildScrollView agar layar bisa di-scroll jika kontennya panjang
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              package.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    package.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.monetization_on,
                        color: Colors.orange,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Rp ${package.price}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 40, thickness: 1),
                  const Text(
                    'Deskripsi Perjalanan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    package.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Tombol Booking diletakkan di bawah (statis, tidak ikut ke-scroll)
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10)],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () async {
            // Logika: Navigator.push() dijalankan dengan kata kunci "await".
            // Artinya, sistem akan menunggu sampai BookingScreen ditutup dan mengembalikan sebuah nilai (result).
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingScreen(package: package),
              ),
            );

            if (!context.mounted) return;
            // Logika: Jika user berhasil memesan (result tidak null dan berupa String), tampilkan SnackBar
            if (result != null && result is String) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(result),
                  backgroundColor: Colors.green.shade600,
                  behavior:
                      SnackBarBehavior.floating, // Tampilan SnackBar melayang
                ),
              );
            }
          },
          child: const Text(
            'Pesan Sekarang',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
