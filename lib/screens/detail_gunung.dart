import 'package:flutter/material.dart';

class DetailGunung extends StatelessWidget {
  const DetailGunung({super.key});

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
          'PEMESANAN TIKET',
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
              const Text(
                'GUNUNG PRAU',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 16),

              // Mountain Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/gunung_prau.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Description Text
              const Text(
                'Puncak dari gunung Prau merupakan padang rumput luas yang menyerupai bukit teletubbies jika dilihat dari dekat dan pemandangan di puncak gunung Prau juga tidak kalah indah. Sunrise di Puncak Surut saat kabut condong ramai, di Puncak ini hagi. Paling lengkap pole naik roda meski. Syarat.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),

              // Location Info
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                  children: [
                    TextSpan(
                      text: '• Desa Acabit 24 Temanggung km, ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Medan Kabupaten Temanggung, Jawa Tengah 50254',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Price Table
              Table(
                border: TableBorder.all(
                  color: Colors.grey.shade300,
                ),
                children: [
                  const TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Harga Tiket',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Weekdays',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Weekend',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Wisatawan Lokal'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Rp. 15.000',
                            style: TextStyle(color: Colors.green[700])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Rp. 20.000',
                            style: TextStyle(color: Colors.green[700])),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Wisatawan Asing'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Rp. 30.000',
                            style: TextStyle(color: Colors.green[700])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Rp. 50.000',
                            style: TextStyle(color: Colors.green[700])),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Book Now Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'PESAN SEKARANG!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
