import 'package:flutter/material.dart';

class PPPKScreen extends StatelessWidget {
  const PPPKScreen({super.key});

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
          'PPPK',
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/p3k.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Description Text
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kotak P3K bisa dibilang merupakan salah satu peralatan yang wajib dibawa para pendaki gunung yang sebenarnya sering kita temui kegiatan ini kotak P3K ini biasanya digunakan sebagai pertolongan pertama saat terjadi kecelakaan di tengah perjalanan mendaki gunung. Tidak disungkiri, mendaki gunung memang memiliki sejumlah extreme pada rute.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Layaknya yang lazim di perbekalan hutan dan gudu dan bertapa kecelakaan seringsali menimpa terkuat kedudukan di atur ditanggung dan ikut memudahkan penanganan. Dan karena itu tujunan wajib membawa peralatan standar P3K saat mendaki gunung.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
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
