// transaction_success_widgets.dart

import 'package:flutter/material.dart';

Widget buildSuccessIcon() {
  return SizedBox(
    width: 120,
    height: 120,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 236, 255, 244),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color.fromARGB(238, 34, 189, 127),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 32),
        ),
        Positioned(top: 15, left: 0, child: buildStar(Colors.purple, 16)),
        Positioned(top: 10, right: 0, child: buildStar(Colors.purple, 16)),
        Positioned(bottom: 0, right: 20, child: buildStar(Colors.amber, 14)),
        Positioned(bottom: 10, left: 0, child: buildStar(Colors.purple, 14)),
      ],
    ),
  );
}

Widget buildStar(Color color, double size) {
  return Icon(Icons.star, color: color, size: size);
}

Widget buildDetailRow(String label, String value, {bool isSuccess = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        ),
        isSuccess
            ? Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 241, 251, 246),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.check,
                    color: Color.fromARGB(237, 71, 203, 151),
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Success',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color.fromARGB(237, 58, 178, 154),
                    ),
                  ),
                ],
              ),
            )
            : Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
      ],
    ),
  );
}

Widget buildTotalRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
      ],
    ),
  );
}

Widget buildTransactionDetails(Map<String, String> details) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Detail Transaction',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ...details.entries.map((entry) {
          if (entry.key == 'Status') {
            return buildDetailRow(entry.key, entry.value, isSuccess: true);
          }
          return buildDetailRow(entry.key, entry.value);
        }),
        SizedBox(height: 5),
        const Divider(height: 0.1),
        buildTotalRow('Total', '\$180.05'),
      ],
    ),
  );
}
