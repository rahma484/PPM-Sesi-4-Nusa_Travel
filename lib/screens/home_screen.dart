import 'package:flutter/material.dart';
import '../models/tour_package.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Data Paket Wisata Sesuai dengan Nama File Gambarmu
  final List<TourPackage> packages = [
    TourPackage(id: '2', title: 'Pesona Bahari Raja Ampat', description: 'Eksplorasi surga bawah laut Papua.', price: 6850000, imageUrl: 'assets/images/Raja Ampat.jpg'),
    TourPackage(id: '1', title: 'Pesona Bali', description: 'Nikmati pantai dan budaya Bali.', price: 1500000, imageUrl: 'assets/images/Bali.jpg'),
    TourPackage(id: '3', title: 'Eksotis Bromo', description: 'Sunrise terbaik dengan Jeep 4x4.', price: 750000, imageUrl: 'assets/images/Bromo.jpg'),
    TourPackage(id: '4', title: 'Kuta Mandalika', description: 'Pantai indah dan desa adat Lombok.', price: 2200000, imageUrl: 'assets/images/kuta mandalika.jpg'),
    TourPackage(id: '5', title: 'Danau Toba', description: 'Danau vulkanik terbesar di dunia.', price: 1800000, imageUrl: 'assets/images/Danau Toba.jpg'),
    TourPackage(id: '6', title: 'Pulau Komodo', description: 'Melihat naga purba di habitat aslinya.', price: 3500000, imageUrl: 'assets/images/Pulau Komodo.jpg'),
    TourPackage(id: '7', title: 'Kawah Ijen', description: 'Fenomena api biru yang memukau.', price: 900000, imageUrl: 'assets/images/Kawah Ijen.jpg'),
    TourPackage(id: '8', title: 'Desa Wae Rebo', description: 'Desa di atas awan Flores.', price: 2800000, imageUrl: 'assets/images/Desa Wae Rebo.jpg'),
    TourPackage(id: '9', title: 'Pulau Derawan', description: 'Berenang bersama ubur-ubur tanpa sengat.', price: 4200000, imageUrl: 'assets/images/Pulau Derawan.jpg'),
    TourPackage(id: '10', title: 'Taman Bunaken', description: 'Taman laut spektakuler di Manado.', price: 3100000, imageUrl: 'assets/images/Taman Bunaken.jpg'),
    TourPackage(id: '11', title: 'Tana Toraja', description: 'Budaya magis dan alam pegunungan.', price: 2500000, imageUrl: 'assets/images/Tana Toraja.jpg'),
    TourPackage(id: '12', title: 'Pulau Belitung', description: 'Pantai batu granit laskar pelangi.', price: 1600000, imageUrl: 'assets/images/Pulau Belitung.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      
      // AppBar / Header Atas
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F3443),
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.explore_outlined, color: Color(0xFF00E5FF), size: 24),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Nusa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
                    Text('Travel', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF00E5FF))),
                  ],
                ),
                Text('Eksplorasi Pesona Nusantara', style: TextStyle(fontSize: 10, color: Colors.white70)),
              ],
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              // Menampilkan Dialog Konfirmasi Custom saat tombol logout ditekan
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.logout, color: Colors.redAccent, size: 28),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Konfirmasi Keluar',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F3443)),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Apakah Anda yakin ingin keluar dari NusaTravel?\nRiwayat rute sebelumnya akan dihapus dari stack.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, color: Colors.grey, height: 1.5),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F3F4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFFF1F3F4),
                                    foregroundColor: Colors.black87,
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context); // Menutup dialog
                                  },
                                  child: const Text('Batal', style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE5003F),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  ),
                                  onPressed: () {
                                    // Eksekusi Poin 7: Logout & Hapus Riwayat
                                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                                  },
                                  child: const Text('Ya, Logout', style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.logout, color: Colors.white70, size: 16),
            label: const Text('Logout', style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner "Halo Petualang!"
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [Color(0xFF00897B), Color(0xFF0F3443)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('HALO PETUALANG! 👋', style: TextStyle(color: Color(0xFFFFD54F), fontWeight: FontWeight.bold, fontSize: 12)),
                  const SizedBox(height: 8),
                  const Text(
                    'Mau jelajah ke mana liburan kali\nini?',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, height: 1.2),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Pilih dari paket wisata kurasi resmi dengan\npanduan lokal terbaik.',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(height: 16),
                  
                  // Tombol Simulasi 404
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFFFD54F),
                          side: const BorderSide(color: Color(0xFFFFD54F)),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/promo-misterius-513');
                        },
                        icon: const Icon(Icons.warning_amber_rounded, size: 16),
                        label: const Text('Tes Error 404', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Kolom Pencarian
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 12),
                  Text('Cari destinasi, kota, atau paket...', style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Kategori Destinasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.filter_alt_outlined, color: Colors.teal, size: 20),
                    SizedBox(width: 8),
                    Text('KATEGORI DESTINASI', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF0F3443))),
                  ],
                ),
                Text('${packages.length} paket tersedia', style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryChip('Semua Destinasi', isSelected: true),
                  _buildCategoryChip('Pantai & Kepulauan'),
                  _buildCategoryChip('Gunung & Alam'),
                  _buildCategoryChip('Budaya & Desa'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Pilihan Paket Wisata Header
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('PILIHAN PAKET WISATA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF0F3443))),
          
              ],
            ),
            const SizedBox(height: 16),

            // Daftar Paket Wisata
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: packages.length,
              itemBuilder: (context, index) {
                final pkg = packages[index];
                return _buildPackageCard(context, pkg);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget Bantuan Kategori
  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0F3443) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? null : Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF0F3443),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // Widget Bantuan Kartu Wisata
  Widget _buildPackageCard(BuildContext context, TourPackage pkg) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: pkg);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    pkg.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 12, left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F3443).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on, color: Color(0xFF00E5FF), size: 12),
                        SizedBox(width: 4),
                        Text('Indonesia', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 12, right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFD54F),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.black87, size: 12),
                        SizedBox(width: 4),
                        Text('4.95', style: TextStyle(color: Colors.black87, fontSize: 10, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12, left: 12,
                  child: Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.white, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        pkg.id == '2' ? '4 Hari 3 Malam' : '3 Hari 2 Malam', 
                        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold, shadows: [Shadow(blurRadius: 4, color: Colors.black)]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pkg.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F3443)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    pkg.description,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Mulai dari', style: TextStyle(fontSize: 10, color: Colors.grey)),
                          Text(
                            'Rp ${pkg.price / 1000}K / pax',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}