import 'package:flutter/material.dart';
import 'package:goproapp/models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String _message = '';

  void _login() {
    final user = User(
      email: _emailController.text,
      password: _passwordController.text,
    );

    setState(() {
      _isLoading = true;
    });

    // Pengecekan login sederhana tanpa API
    if (user.email == 'test@example.com' && user.password == 'password123') {
      setState(() {
        _isLoading = false;
        _message = '';
      });
      Navigator.pushReplacementNamed(context, '/bottomConfig');
    } else {
      setState(() {
        _isLoading = false;
        _message = 'Login gagal. Periksa email dan password Anda.';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Gagal: Email atau Password salah')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/logoLogin.jpeg', // Ganti dengan path gambar yang sesuai
                  width: 100, // Sesuaikan ukuran gambar
                  height: 100, // Sesuaikan ukuran gambar
                  fit: BoxFit
                      .cover, // Mengatur bagaimana gambar di-fit ke dalam lingkaran
                ),
              ),
              // Email TextField Styling
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                width: 400, // Atur lebar yang diinginkan
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.blueGrey),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: const Icon(Icons.email, color: Colors.blueGrey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Password TextField Styling
              SizedBox(
                width: 400, // Atur lebar yang diinginkan
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.blueGrey),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: const Icon(Icons.lock, color: Colors.blueGrey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 30),
              // Login Button Styling
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              // Error Message Styling
              Text(
                _message,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
