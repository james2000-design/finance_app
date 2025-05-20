import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

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

final banks = const [
  {'name': 'J.P. Morgan', 'abbr': 'JPMC', 'logo': 'assets/images/jp.png'},
  {'name': 'Wells Fargo', 'abbr': 'WFB', 'logo': 'assets/images/WFB.png'},
  {'name': 'Morgan Stanley', 'abbr': 'MSB', 'logo': 'assets/images/morgan.png'},
  {
    'name': 'Goldman Sachs',
    'abbr': 'GMSB',
    'logo': 'assets/images/goldman.jpeg',
  },
  {'name': 'Citibank', 'abbr': 'CGOB', 'logo': 'assets/images/citi.png'},
  {'name': 'Bank of America', 'abbr': 'BOA', 'logo': 'assets/images/boa.png'},
  {
    'name': 'Charles Schwab',
    'abbr': 'CSB',
    'logo': 'assets/images/charles.png',
  },
  {'name': 'PNC', 'abbr': 'PNC', 'logo': 'assets/images/pnc.png'},
];
