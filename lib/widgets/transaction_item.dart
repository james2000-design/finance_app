import 'package:finance_app/widgets/build_icon.dart';
import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel model;

  const TransactionItem({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(4),
      leading: buildIcon(model.icon),
      title: Text(model.label),
      subtitle: Text(model.desc),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            model.amount,
            style: TextStyle(
              fontSize: 16,
              color:
                  model.isIncome
                      ? const Color.fromARGB(238, 34, 189, 127)
                      : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(model.date, style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
