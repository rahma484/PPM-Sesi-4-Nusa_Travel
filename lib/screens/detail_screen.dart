import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/tour_package.dart';

class DetailScreen extends StatelessWidget {
  final TourPackage package;

  const DetailScreen({super.key, required this.package});

  // Fungsi pembantu untuk memformat harga
  String formatCurrency(double price) {
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatCurrency.format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      
      // AppBar Khusus[cite: 7]
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F3443),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Detail Paket Wisata', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(package.title, style: const TextStyle(fontSize: 12, color: Colors.white70)),
          ],
        ),
        actions: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'args: pkg-${package.id}', // Indikator pengiriman argumen
                style: const TextStyle(color: Colors.white70, fontSize: 10, fontFamily: 'monospace'),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Hero dengan Overlay[cite: 7]
            Stack(
              children: [
                Image.asset(
                  package.imageUrl,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                // Gradien Hitam di bawah gambar
                Positioned(
                  bottom: 0, left: 0, right: 0,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [const Color(0xFF0F3443).withValues(alpha: 0.9), Colors.transparent],
                      ),
                    ),
                  ),
                ),
                // Judul dan Rating di atas gambar[cite: 7]
                Positioned(
                  bottom: 16, left: 16, right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFF00BFA5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.location_on, color: Colors.white, size: 12),
                                  SizedBox(width: 4),
                                  Text('Indonesia', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              package.title,
                              style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFD54F),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.star, color: Colors.black87, size: 14),
                                SizedBox(width: 4),
                                Text('4.95', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 12)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text('(142 ulasan)', style: TextStyle(color: Colors.white70, fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Panel Info Cepat[cite: 7]
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 5)),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildQuickInfo(Icons.access_time, 'Durasi', '4 Hari 3 Malam', Colors.blue),
                        Container(width: 1, height: 40, color: Colors.grey.shade200),
                        _buildQuickInfo(Icons.category_outlined, 'Kategori', 'Premium', Colors.orange),
                        Container(width: 1, height: 40, color: Colors.grey.shade200),
                        _buildQuickInfo(Icons.check_circle_outline, 'Status', 'Tersedia', const Color(0xFF00BFA5)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Tentang Paket Wisata[cite: 7]
                  const Text('TENTANG PAKET WISATA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0F3443))),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Text(
                      'Nikmati pengalaman tak terlupakan melalui paket wisata ${package.title}. ${package.description} Perjalanan ini dirancang khusus untuk memberikan kenyamanan dan petualangan yang seimbang, lengkap dengan panduan lokal profesional.',
                      style: const TextStyle(color: Colors.grey, height: 1.6, fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Sorotan Aktivitas[cite: 8]
                  const Row(
                    children: [
                      Icon(Icons.auto_awesome, color: Color(0xFFFFB300), size: 18),
                      SizedBox(width: 8),
                      Text('SOROTAN AKTIVITAS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0F3443))),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      children: [
                        _buildChecklistItem('Eksplorasi destinasi ikonik dan spot foto terbaik'),
                        _buildChecklistItem('Aktivitas luar ruangan yang seru & aman'),
                        _buildChecklistItem('Menginap di akomodasi terkurasi yang nyaman'),
                        _buildChecklistItem('Mencicipi kuliner khas daerah setempat', isLast: true),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Fasilitas Termasuk[cite: 8]
                  const Row(
                    children: [
                      Icon(Icons.verified_user_outlined, color: Colors.blue, size: 18),
                      SizedBox(width: 8),
                      Text('FASILITAS TERMASUK', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0F3443))),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBulletPoint('Transportasi lokal selama kegiatan tour'),
                        _buildBulletPoint('Tiket masuk kawasan wisata & konservasi'),
                        _buildBulletPoint('Dokumentasi perjalanan oleh guide lokal'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20), // Spacing tambahan sebelum navbar bawah
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar (Area Harga & Tombol Pesan)[cite: 7]
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -5)),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Total Harga Paket', style: TextStyle(color: Colors.grey, fontSize: 11)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(formatCurrency(package.price), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF0F3443))),
                        const Text(' /org', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00BFA5),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                onPressed: () {
                  // Meneruskan data paket ke Booking Screen (Wajib sesuai tugas)[cite: 6, 7]
                  Navigator.pushNamed(context, '/booking', arguments: package);
                },
                child: const Row(
                  children: [
                    Text('Pesan Sekarang', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    SizedBox(width: 8),
                    Icon(Icons.send, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Komponen pembantu UI
  Widget _buildQuickInfo(IconData icon, String title, String value, Color iconColor) {
    return Column(
      children: [
        Icon(icon, color: iconColor, size: 20),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 10)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF0F3443))),
      ],
    );
  }

  Widget _buildChecklistItem(String text, {bool isLast = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_outline, color: Color(0xFF00BFA5), size: 18),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(color: Color(0xFF0F3443), fontSize: 13))),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0, right: 12.0),
            child: CircleAvatar(radius: 3, backgroundColor: Colors.blue),
          ),
          Expanded(child: Text(text, style: const TextStyle(color: Color(0xFF0F3443), fontSize: 13))),
        ],
      ),
    );
  }
}