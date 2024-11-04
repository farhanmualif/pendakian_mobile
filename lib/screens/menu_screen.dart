import 'package:flutter/material.dart';
import 'package:pendakian_mobile/screens/info_pendakian_screen.dart';
import 'package:pendakian_mobile/screens/p3k_screen.dart';
import 'package:pendakian_mobile/screens/pemesanan_tiket_screen.dart';
import 'package:pendakian_mobile/screens/perbekalan_screen.dart';
import 'package:pendakian_mobile/screens/perlengkapan_screen.dart';
import 'package:pendakian_mobile/screens/splash_screen.dart';
import 'package:pendakian_mobile/screens/survival_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuItemData> menuItems = [
      MenuItemData(title: 'PERLENGKAPAN', icon: Icons.shopping_bag),
      MenuItemData(title: 'PERBEKALAN', icon: Icons.shopping_basket),
      MenuItemData(title: 'SURVIVAL', icon: Icons.nature_people),
      MenuItemData(title: 'PPPK', icon: Icons.medical_services),
      MenuItemData(title: 'REKOMENDASI\nGUNUNG', icon: Icons.terrain),
      MenuItemData(title: 'PEMESANAN\nTIKET', icon: Icons.confirmation_number),
    ];

    void navigateTo(int index) {
      if (index == 0) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const PerlengkapanScreen()));
      } else if (index == 1) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const PerbekalanScreen()));
      } else if (index == 2) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SurvivalScreen()));
      } else if (index == 3) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const PPPKScreen()));
      } else if (index == 4) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const InfoPendakianScreen()));
      } else if (index == 5) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const PemesananTiketScreen()));
      }
    }

    Future<void> handleLogout(BuildContext context) async {
      final supabase = Supabase.instance.client;

      try {
        await supabase.auth.signOut();

        if (context.mounted) {
          // Navigasi ke SigninScreen setelah logout
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const SplashScreen()),
            (route) => false,
          );
        }
      } catch (error) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error logging out: $error'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text('MENU'),
          backgroundColor: Colors.green,
          centerTitle: true,
          actions: [
            // Tambahkan tombol logout
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => handleLogout(context),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.0,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  navigateTo(index);
                },
                child: MenuItemWidget(menuItem: menuItems[index]));
          },
        ),
      ),
    );
  }
}

class MenuItemData {
  final String title;
  final IconData icon;

  MenuItemData({required this.title, required this.icon});
}

class MenuItemWidget extends StatelessWidget {
  final MenuItemData menuItem;

  const MenuItemWidget({
    super.key,
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: Icon(
              menuItem.icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            menuItem.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
