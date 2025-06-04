import 'package:flutter/material.dart';

class LodingScreen extends StatelessWidget {
  const LodingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Image.asset('assets/logo.png'),
          Text(
            'FAGO',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.amber[800],
            ),
          ),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),

      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
