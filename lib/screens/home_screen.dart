import 'package:flutter/material.dart';

import '../models/tour_package.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<TourPackage> packages = [
    TourPackage(
      id: '1',
      title: 'Pesona Bali',
      description: 'Nikmati keindahan pantai dan budaya bali selama 3 hari 2 malam. Termasuk penginapan, sarapan, dan tur guide.',
      price: 1500000,
      imageUrl: 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?q=80&w=800&auto=format&fit=crop',
    ),
    TourPackage(
      id: '2',
      title: 'Surga Raja Ampat',
      description: 'Eksplorasi bawah laut dan gugusan pulau karang di Raja Ampat. Pengalaman tak terlupakan di ujung timur Indonesia.',
      price: 5500000,
      imageUrl: 'https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?q=80&w=800&auto=format&fit=crop',
    ),
    TourPackage(
      id: '3',
      title: 'Eksotis Bromo',
      description: 'Saksikan keindahan sunrise terbaik di Gunung Bromo menggunakan Jeep 4x4. Termasuk tiket masuk taman nasional.',
      price: 750000,
      imageUrl: 'https://images.unsplash.com/photo-1588668214407-6ea9a6d8c272?q=80&w=800&auto=format&fit=crop',
    ),
    TourPackage(
      id: '4',
      title: 'Lombok Adventure',
      description: 'Jelajahi keindahan Pantai Kuta Mandalika dan desa adat Sade. Liburan sempurna untuk menenangkan pikiran.',
      price: 2200000,
      imageUrl: 'https://images.unsplash.com/photo-1573790387438-4da905011ef1?q=80&w=800&auto=format&fit=crop',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'Destinasi Pilihan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.splash,
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final pkg = packages[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.detail, arguments: pkg);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Image.network(
                      pkg.imageUrl,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pkg.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'mulai dari Rp ${pkg.price}',
                              style: const TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}