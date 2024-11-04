import 'package:flutter/material.dart';

class PerbekalanScreen extends StatelessWidget {
  const PerbekalanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.green),
            onPressed: () {},
          ),
        ],
        title: const Text(
          'Perbekalan',
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/perbekalan.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Description Text
              const Text(
                'Perbekalan ketinggian acta logistik pendakian yang akan digunakan. Berbeda pendistribusian saat di camping area. Perbekalan ini bisa bervariatif, tergantung dengan seting menu yang filmnya memiliki nilai presentasi. Sangat disarankan dalam menyusun perbekalan yang effektive, artinya semua perbekalan yang dibawa efisient dapat berguna, tidak ribet dimakan, bergizi dll.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),

              // List Title
              const Text(
                'Daftar Logistik Makanan Untuk Naik Gunung',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),

              // Bullet points
              _buildBulletPoint('Track trail reserve'),
              _buildBulletPoint('Makanan ringan'),
              _buildBulletPoint('Air minum'),
              _buildBulletPoint('Makanan cepat saji'),
              _buildBulletPoint('Obat-obatan'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
