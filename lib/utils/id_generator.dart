import 'dart:math';

String generateTransactionId() {
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final random = Random().nextInt(900000) + 100000;
  return 'TXN$timestamp$random';
}
