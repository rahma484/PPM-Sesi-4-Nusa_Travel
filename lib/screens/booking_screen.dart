// lib/screens/booking_screen.dart
import 'package:flutter/material.dart';
import '../models/tour_package.dart';

class BookingScreen extends StatelessWidget {
  final TourPackage package;
  BookingScreen({super.key, required this.package});

  // Controller untuk mengambil teks dari inputan user
  final TextEditingController nameController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Logika PopScope: Menangani event ketika tombol Back (fisik atau dari appbar) ditekan.
    return PopScope(
      canPop: false, // Mencegah layar ditutup secara otomatis
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return; // Jika sudah berhasil ditutup, hentikan proses
        
        // Menampilkan dialog konfirmasi
        final bool shouldPop = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Batalkan Pemesanan?'),
            content: const Text('Data yang belum disimpan akan hilang.'),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Tidak')),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () => Navigator.pop(context, true), 
                child: const Text('Ya, Batalkan', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ) ?? false;

        // Jika user memilih 'Ya' (true), tutup BookingScreen tanpa mengirim hasil sukses
        if (shouldPop && context.mounted) {
          Navigator.pop(context); 
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Form Pemesanan'), backgroundColor: Colors.teal, foregroundColor: Colors.white),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Paket: ${package.title}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              _buildTextField(controller: nameController, label: 'Nama Pemesan', icon: Icons.person),
              const SizedBox(height: 15),
              _buildTextField(controller: qtyController, label: 'Jumlah Peserta', icon: Icons.group, isNumber: true),
              const SizedBox(height: 15),
              _buildTextField(controller: dateController, label: 'Tanggal Keberangkatan (DD/MM/YYYY)', icon: Icons.calendar_today),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, padding: const EdgeInsets.symmetric(vertical: 15)),
                  onPressed: () {
                    if(nameController.text.isEmpty) return; // Validasi sederhana

                    // Logika: Navigator.pop akan menutup halaman ini dan MEMBAWA DATA STRING kembali ke DetailScreen
                    Navigator.pop(context, 'Berhasil! ${package.title} dipesan atas nama ${nameController.text}.');
                  },
                  child: const Text('Konfirmasi Pemesanan', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget bantuan untuk membuat desain TextField yang seragam dan bagus
  Widget _buildTextField({required TextEditingController controller, required String label, required IconData icon, bool isNumber = false}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.teal),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.teal, width: 2)),
      ),
    );
  }
}