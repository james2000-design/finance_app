import 'package:finance_app/data/transaction_data.dart';
import 'package:finance_app/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/screens/transaction_form_screen.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Choose the bank where you want to send money",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search bank',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.builder(
                itemCount: banks.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  final bank = banks[index];
                  return GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push<TransactionModel>(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => TransactionFormScreen(
                                bankName: bank['name']!,
                                logoPath: bank['logo']!,
                              ),
                        ),
                      );
                      if (!mounted) return;

                      if (result != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context, result);
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(bank['logo']!, height: 30),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          bank['abbr']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  "Don't know bank name? Enter IBAN",
                  style: TextStyle(
                    color: Colors.blue,

                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
