import 'dart:convert';
import 'package:finance_app/models/transaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionStorage {
  static const String _key = 'transactions';

  static Future<void> saveTransaction(TransactionModel transaction) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> current = prefs.getStringList(_key) ?? [];

    current.insert(0, jsonEncode(transaction.toJson()));

    await prefs.setStringList(_key, current);
  }

  static Future<List<TransactionModel>> getTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> data = prefs.getStringList(_key) ?? [];

    return data.map((e) => TransactionModel.fromJson(jsonDecode(e))).toList();
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
