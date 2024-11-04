import 'package:flutter/material.dart';

class PerlengkapanScreen extends StatelessWidget {
  const PerlengkapanScreen({super.key});

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
          'Perlengkapan',
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
            Container(
              width: double.infinity,
              height: 200,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage("assets/images/perlengkapan.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'List Perlengkapan Naik Gunung',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Equipment list
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEquipmentItem('1. Jaket'),
                  _buildEquipmentItem('2. Sarung tangan'),
                  _buildEquipmentItem('3. Pelindung kepala'),
                  _buildEquipmentItem('4. Gaiters'),
                  _buildEquipmentItem('5. Jas hujan'),
                  _buildEquipmentItem('6. Trekking pole'),
                  _buildEquipmentItem('7. Senter dan headlamp'),
                  _buildEquipmentItem('8. Tenda'),
                  _buildEquipmentItem('9. Perlengkapan masak'),
                  _buildEquipmentItem('10. Tas gunung'),
                  _buildEquipmentItem('11. Sepatu gunung'),
                  _buildEquipmentItem('12. Matras'),
                  _buildEquipmentItem('13. Sleeping bag'),
                  _buildEquipmentItem('14. Hammock'),
                  _buildEquipmentItem('15. Tali'),
                  _buildEquipmentItem('16. Kacamata dan masker'),
                  _buildEquipmentItem('17. Pakaian'),
                  _buildEquipmentItem('18. Survival kit'),
                  _buildEquipmentItem('19. Kantong sampah'),
                  _buildEquipmentItem('20. Jam tangan'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEquipmentItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
