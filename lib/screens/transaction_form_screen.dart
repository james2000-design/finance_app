import 'package:finance_app/models/transaction_model.dart';
import 'package:finance_app/screens/transaction_success_screen.dart';
import 'package:finance_app/utils/id_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TransactionFormScreen extends StatefulWidget {
  final String bankName;
  final String logoPath;

  const TransactionFormScreen({
    super.key,
    required this.bankName,
    required this.logoPath,
  });

  @override
  State<TransactionFormScreen> createState() => _TransactionFormScreenState();
}

class _TransactionFormScreenState extends State<TransactionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _accountController = TextEditingController();
  final _pinController = TextEditingController();
  final _amountController = TextEditingController();
  final _phoneController = TextEditingController();
  final _noteController = TextEditingController();
  bool _isLoading = false;

  void _submit() async {
    if (_formKey.currentState?.validate() != true) return;

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    final now = DateTime.now();
    final formattedDate = DateFormat('d MMMM yyyy').format(now);

    final transaction = TransactionModel(
      icon: AssetImage(widget.logoPath),
      label: 'Transfer',
      desc: 'Transferred to ${_accountController.text}',
      amount: NumberFormat.currency(
        symbol: '\$',
        decimalDigits: 0,
      ).format(int.parse(_amountController.text)),
      date: formattedDate,
      isIncome: false,
      transactionId: generateTransactionId(),
      transactionType: "Transfer",
      phone: _phoneController.text.isNotEmpty ? _phoneController.text : null,
      note: _noteController.text.isNotEmpty ? _noteController.text : null,
    );

    final result = await Navigator.push<TransactionModel>(
      context,
      MaterialPageRoute(
        builder: (_) => TransactionSuccessScreen(transaction: transaction),
      ),
    );

    if (!mounted) return;

    if (result != null) {
      Navigator.pop(context, result);
    }
  }

  @override
  void dispose() {
    _accountController.dispose();
    _pinController.dispose();
    _amountController.dispose();
    _phoneController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFormValid =
        _accountController.text.isNotEmpty &&
        _pinController.text.isNotEmpty &&
        _amountController.text.isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text("Transfer")),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  onChanged: () => setState(() {}),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              widget.logoPath,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.bankName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const Text(
                                "America",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text("Enter Account Number"),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: _accountController,
                        decoration: const InputDecoration(
                          hintText: 'Account Number',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter account number';
                          }
                          if (val.length != 10) {
                            return 'Account number must be 10 digits';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      const Text("Enter Pin Code"),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: _pinController,
                        decoration: const InputDecoration(
                          hintText: 'Pin Code',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator:
                            (val) =>
                                val!.isEmpty ? 'Please enter pin code' : null,
                      ),
                      const SizedBox(height: 16),
                      const Text("Enter Amount"),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Amount',
                          border: OutlineInputBorder(),
                          prefix: Text('\$'),
                        ),
                        validator:
                            (val) =>
                                val!.isEmpty ? 'Please enter amount' : null,
                      ),
                      const SizedBox(height: 16),
                      const Text("Phone Optional"),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: 'Phone Number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "payment receipt to be sent on this number",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      const SizedBox(height: 16),
                      const Text("Add a Note"),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: _noteController,
                        decoration: const InputDecoration(
                          hintText: "e.g. today's lunch",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: isFormValid ? _submit : null,
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 16),
                            ),
                            backgroundColor:
                                WidgetStateProperty.resolveWith<Color>((
                                  Set<WidgetState> states,
                                ) {
                                  if (states.contains(WidgetState.disabled)) {
                                    return Colors.grey.shade300;
                                  }
                                  return Colors.grey.shade800;
                                }),
                            foregroundColor:
                                WidgetStateProperty.resolveWith<Color>((
                                  Set<WidgetState> states,
                                ) {
                                  if (states.contains(WidgetState.disabled)) {
                                    return Colors.grey.shade500;
                                  }
                                  return Colors.white;
                                }),
                          ),
                          child: const Text("Proceed"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
