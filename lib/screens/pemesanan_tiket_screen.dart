import 'package:flutter/material.dart';
import 'package:pendakian_mobile/screens/detail_gunung.dart';

class PemesananTiketScreen extends StatelessWidget {
  const PemesananTiketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mountainNames = [
      'Gunung Prau',
      'Gunung Andong',
      'Gunung Merbabu',
      'Gunung Merapi',
      'Gunung Sindoro',
      'Gunung Sumbing',
      'Gunung Bromo',
      'Gunung Papandayan',
    ];

    void navigateToDetaiMountain(int index) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const DetailGunung(),
      ));
    }

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
              // Grid of mountain options
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: mountainNames.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            navigateToDetaiMountain(index);
                          },
                          child: MountainOption(name: mountainNames[index])),
                      Text(mountainNames[index])
                    ],
                  );
                },
              ),

              const SizedBox(height: 24),

              // Description Text
              const Text(
                'Pemesanan tiket pendakian menjadi salah satusi informasi pendakian seperti nama gunung, jalur, tanggal, dan biaya. Pengguna dapat memilih tanggal, memasukkan data pendaki, dan memberikan fasilitas tambahan. Setelah itu, muncul ringkasan pemesanan, dan pengguna memilih metode pembayaran. Hindari gangguan di tengah-tengah setelah pembayaran berhasil.',
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
      ),
    );
  }
}

class MountainOption extends StatelessWidget {
  final String name;

  const MountainOption({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Tooltip(
        message: name,
        child: const Icon(
          Icons.landscape,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
