import "package:flutter/material.dart";

class TransactionModel {
  final Object icon;
  final String label;
  final String desc;
  final String amount;
  final String date;
  final bool isIncome;

  const TransactionModel({
    required this.icon,
    required this.label,
    required this.desc,
    required this.amount,
    required this.date,
    this.isIncome = false,
  });
}

class IncomeItem {
  final String label;
  final double amount;
  final double percent;
  final Color color;

  IncomeItem({
    required this.label,
    required this.amount,
    required this.percent,
    required this.color,
  });
}
