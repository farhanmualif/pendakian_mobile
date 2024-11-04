import 'package:flutter/material.dart';

class SurvivalScreen extends StatelessWidget {
  const SurvivalScreen({super.key});

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
          'Survival',
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage("assets/images/survival.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Description Text
                  const Text(
                    'Survival adalah suatu perjuangan yang dilakukan seseorang dengan maksud untuk mempertahankan keberlangsungan hidupnya. Biasanya dalam hal pendakian adalah situasi yang krusial dan beresiko dimana-mana dan memerlukan tindakan yang tepat dan cepat dalam mengatasinya. Dengan demikian keberuntungan hidup seseorang ini sangat tergantung pada kemampuan dalam mengatasi dan menyelesaikan masalahnya serta mempertahankan diri tergantung pada sikap mental, pengetahuan, dan keterampilan.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),

                  // Factors Section
                  const Text(
                    'Faktor Penyebab Survival',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Bullet points
                  _buildNumberedPoint('1', 'Subjective Dangerous',
                      'Suatu keadaan darurat yang disebabkan oleh pelaku pendakian (diani belum tau sendiri)'),
                  _buildNumberedPoint('2', 'Natural hazard yang tidak normal',
                      'Keragaman penghalangan dan keterasingan yang menerpa.'),
                  _buildNumberedPoint(
                      '3',
                      'Kerana salah mengerti keputusan dalam keadaan yang bahaya.',
                      ''),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberedPoint(String number, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. ',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (description.isNotEmpty)
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
