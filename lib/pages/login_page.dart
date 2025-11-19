import 'package:flutter/material.dart';
import 'chat_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Layouting: SingleChildScrollView penting agar tidak overflow
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            // Header dan Logo
            const SizedBox(height: 80),
            const Icon(Icons.psychology, size: 100, color: Colors.indigo), 
            const Text(
              'Selamat Datang di Gilang Bot',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 40),

            // Layouting: Input Email dengan border melingkar
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Layouting: Input Password
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 40),

            // Layouting: Tombol Login lebar dengan shape melingkar
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                elevation: 5,
              ),
              onPressed: () {
                // Navigasi ke Halaman Chat
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const ChatPage())
                );
              },
              child: const Text(
                'Masuk', 
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)
              ),
            ),
          ],
        ),
      ),
    );
  }
}