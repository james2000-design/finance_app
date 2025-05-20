import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw'),
        backgroundColor: Colors.deepPurple,
      ),
      body: const Center(
        child: Text('Withdraw Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
