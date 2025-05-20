import "package:flutter/material.dart";

class TransactionModel {
  final AssetImage icon;
  final String label;
  final String desc;
  final String amount;
  final String date;
  final bool isIncome;
  final String transactionId;
  final String? phone;
  final String? note;

  TransactionModel({
    required this.icon,
    required this.label,
    required this.desc,
    required this.amount,
    required this.date,
    this.isIncome = false,
    required this.transactionId,
    this.phone,
    this.note,
  });

  Map<String, dynamic> toJson() {
    return {
      'iconPath': icon.assetName,
      'label': label,
      'desc': desc,
      'amount': amount,
      'date': date,
      'isIncome': isIncome,
      'transactionId': transactionId,
      'phone': phone,
      'note': note,
    };
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      icon: AssetImage(json['iconPath']),
      label: json['label'],
      desc: json['desc'],
      amount: json['amount'],
      date: json['date'],
      isIncome: json['isIncome'],
      transactionId: json['transactionId'],
      phone: json['phone'],
      note: json['note'],
    );
  }
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
