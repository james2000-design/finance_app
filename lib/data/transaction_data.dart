import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

const List<TransactionModel> transactions = [
  TransactionModel(
    icon: AssetImage('assets/images/youtube1.png'),
    label: 'Youtube',
    desc: 'Subscription Payment',
    amount: '\$15,000',
    date: '16 May 2024',
  ),
  TransactionModel(
    icon: AssetImage('assets/images/stripe.jpeg'),
    label: 'Stripe',
    desc: 'Monthly Salary',
    amount: '+\$3,000',
    date: '15 May 2024',
    isIncome: true,
  ),
  TransactionModel(
    icon: AssetImage('assets/images/playstore.jpeg'),
    label: 'Google Play',
    desc: 'E-book Purchase',
    amount: '\$139,000',
    date: '14 May 2024',
  ),
  TransactionModel(
    icon: AssetImage('assets/images/ovo.jpeg'),
    label: 'OVO',
    desc: 'Top Up E-Money',
    amount: '\$180,000',
    date: '18 May 2024',
  ),
];

final List<IncomeItem> incomeData = [
  IncomeItem(
    label: 'Monthly Salary',
    amount: 10086.50,
    percent: 0.5,
    color: const Color.fromARGB(255, 234, 200, 241),
  ),
  IncomeItem(
    label: 'Passive Income',
    amount: 3631.14,
    percent: 0.18,
    color: Colors.pinkAccent.shade100,
  ),
  IncomeItem(
    label: 'Freelance',
    amount: 3429.41,
    percent: 0.17,
    color: Colors.deepPurpleAccent.shade100,
  ),
  IncomeItem(
    label: 'Side Business',
    amount: 3025.95,
    percent: 0.15,
    color: Colors.black,
  ),
];

final Map<String, String> transactionDetails = {
  'Transaction ID': '7236 1121 2830',
  'Date': '08:16 · 18 May 2024',
  'Type of Transactions': 'Top up e-money',
  'Nominal': '\$180',
  'Admin': '\$0.5',
  'Recipient\'s number': '+62 813 8164 3328',
  'Status': 'Success',
};
