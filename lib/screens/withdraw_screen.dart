import 'package:finance_app/utils/id_generator.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/models/transaction_model.dart';
import 'package:intl/intl.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _phoneController = TextEditingController();
  final _noteController = TextEditingController();
  final _pinController = TextEditingController();
  bool _isLoading = false;

  void _submit() async {
    final now = DateTime.now();
    final formattedDate = DateFormat('d MMMM yyyy').format(now);
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    final txn = TransactionModel(
      icon: const AssetImage('assets/images/withdraw.jpeg'),
      label: "Withdrawal",
      desc: "To Wallet",
      amount: NumberFormat.currency(
        symbol: '\$',
        decimalDigits: 0,
      ).format(int.parse(_amountController.text)),
      date: formattedDate,
      isIncome: true,
      transactionId: generateTransactionId(),
      phone: _phoneController.text,
      note: _noteController.text,
      transactionType: 'Withdrawal',
    );

    if (!mounted) return;
    setState(() => _isLoading = false);
    Navigator.pop(context, txn);
  }

  @override
  Widget build(BuildContext context) {
    final isFormFilled =
        _amountController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _noteController.text.isNotEmpty &&
        _pinController.text.length == 4;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Withdraw"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          onChanged: () => setState(() {}),
          child: Column(
            children: [
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Amount',
                  prefix: Text('\$'),
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? "Enter amount" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "Enter phone number"
                            : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _pinController,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "PIN",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Enter PIN";
                  if (value.length != 4) return "PIN must be 4 digits";
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _noteController,
                decoration: const InputDecoration(
                  labelText: "Note",
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? "Enter a note" : null,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: isFormFilled && !_isLoading ? _submit : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                ),
                child:
                    _isLoading
                        ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                        : Text(
                          "Withdraw from wallet",
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                isFormFilled && !_isLoading
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
