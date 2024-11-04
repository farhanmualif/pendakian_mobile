import 'package:flutter/material.dart';


class InfoPendakianScreen extends StatelessWidget {
  const InfoPendakianScreen({super.key});

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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'INFO GUNUNG UNTUK PENDAKI\nPEMULA',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            // Image section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/info_pendakian.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            // Subtitle
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Rekomendasi Gunung-gunung untuk Pendaki Pemula :',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
            
            // Mountain List
            const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MountainListItem('1. Gunung Prau'),
                  MountainListItem('2. Gunung Andong'),
                  MountainListItem('3. Gunung Sibayak'),
                  MountainListItem('4. Gunung Batok/Widodaren'),
                  MountainListItem('5. Gunung Bromo'),
                  MountainListItem('6. Gunung Ungaran'),
                  MountainListItem('7. Gunung Telomoyo'),
                  MountainListItem('8. Gunung Ireng'),
                  MountainListItem('9. Gunung Nglanggeran'),
                  MountainListItem('10. Gunung Batur'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MountainListItem extends StatelessWidget {
  final String text;
  
  const MountainListItem(this.text, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
          height: 1.5,
        ),
      ),
    );
  }
}