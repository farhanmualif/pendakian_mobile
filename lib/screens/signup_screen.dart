import 'package:flutter/material.dart';
import 'package:pendakian_mobile/models/profile.dart';
import 'package:pendakian_mobile/screens/signin_screen.dart';
import 'package:pendakian_mobile/themes/app_color.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SupabaseClient supabase = Supabase.instance.client;

  // Loading state
  bool _isLoading = false;

// Function untuk register
  Future<void> _registerUser(Profile profile) async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Register user dengan Supabase
      final AuthResponse res = await supabase.auth.signUp(
        email: profile.email,
        password: profile.password!,
      );

      if (res.user != null) {
        // Jika registrasi berhasil, tambahkan data profil ke tabel 'profiles'
        await supabase.from('profiles').insert({
          'id': res.user!.id,
          'username': profile.username,
          'email': profile.email,
          'role': profile.role,
        });

        // Tampilkan pesan sukses
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Registration successful! Please check your email to verify your account.')),
        );

        // Navigasi ke halaman login
        if (!mounted) return;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const SigninScreen(),
        ));
      }
    } on AuthException catch (error) {
      if (!mounted) return;

      // Tangani error autentikasi
      print(error.message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
    } catch (error) {
      if (!mounted) return;

      // Tangani error lainnya
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unexpected error occurred: $error')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/mountain.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 16),

                // Moreen Text
                const Text(
                  'MOREEN',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32), // Dark Green
                  ),
                ),
                const SizedBox(height: 24),

                // Create New Account Text
                const Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF2E7D32),
                  ),
                ),
                const Text(
                  'New Account',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF2E7D32),
                  ),
                ),
                const SizedBox(height: 32),

                // Input Fields
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    filled: true,
                    fillColor: const Color(0xFFB8D5BE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: const Color(0xFFB8D5BE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: const Color(0xFFB8D5BE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : () {
                            Profile profile = Profile(
                                email: _emailController.text.trim(),
                                password: _passwordController.text,
                                username: _nameController.text.trim(),
                                role: 'user');
                            _registerUser(profile);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 24),

                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SigninScreen(),
                    ));
                  },
                  child: Text(
                    'Have a account?',
                    style: TextStyle(
                      color: AppColor.promary,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Website Text
                const Text(
                  'www.mrhmn.com',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
