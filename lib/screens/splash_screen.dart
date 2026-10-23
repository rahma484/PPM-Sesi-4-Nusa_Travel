import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF072C3F), // Warna latar biru gelap[cite: 5]
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              
              // Tag "Aplikasi Wisata Nusantara #1"[cite: 5]
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('✨ ', style: TextStyle(fontSize: 14)),
                    Text('Aplikasi Wisata Nusantara #1', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              
              // Ikon / Logo Utama[cite: 5]
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFF072C3F),
                  border: Border.all(color: const Color(0xFF00E5FF), width: 2),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00E5FF).withValues(alpha: 0.15),
                      blurRadius: 30,
                      spreadRadius: 5,
                    )
                  ]
                ),
                child: const Icon(Icons.explore_outlined, size: 50, color: Color(0xFF00E5FF)),
              ),
              const SizedBox(height: 24),
              
              // Teks NusaTravel dengan 2 warna (Putih dan Toska)[cite: 5]
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, letterSpacing: -0.5),
                  children: [
                    TextSpan(text: 'Nusa', style: TextStyle(color: Colors.white)),
                    TextSpan(text: 'Travel', style: TextStyle(color: Color(0xFF00E5FF))),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              
              // Deskripsi[cite: 5]
              const Text(
                'Jelajahi surga tersembunyi kepulauan\nIndonesia. Dari Raja Ampat hingga kawah\nBromo.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, height: 1.5, fontSize: 14),
              ),
              const SizedBox(height: 32),
              
              // Info Cards (Destinasi & Keberangkatan)[cite: 5]
              Row(
                children: [
                  Expanded(
                    child: _buildInfoCard(Icons.location_on_outlined, '4+ Destinasi', 'Terverifikasi resmi'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildInfoCard(Icons.verified_user_outlined, 'Pasti Berangkat', 'Jaminan harga terbaik'),
                  ),
                ],
              ),
              
              const Spacer(),
              
              // Tombol Mulai Eksplorasi[cite: 5]
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00E5FF),
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: () {
                    // Fitur Navigasi Wajib (pushReplacementNamed)[cite: 5]
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Mulai Eksplorasi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Keterangan Teknis untuk Bukti Tugas[cite: 5]
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                ),
                child: const Column(
                  children: [
                    Text("Navigator.pushReplacementNamed(context, '/home')", style: TextStyle(color: Color(0xFF00E5FF), fontSize: 10, fontFamily: 'monospace')),
                    SizedBox(height: 4),
                    Text('Splash digantikan sehingga tidak dapat kembali lagi saat tombol\nBack ditekan.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white54, fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
        ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget bantuan untuk membuat kotak informasi "4+ Destinasi" dll[cite: 5]
  Widget _buildInfoCard(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF00E5FF), size: 24),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.white54, fontSize: 11)),
        ],
      ),
    );
  }
}
