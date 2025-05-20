import 'package:flutter/material.dart';
import 'package:finance_app/models/transaction_model.dart';
import 'package:finance_app/widgets/transaction_success_widget.dart';

class TransactionSuccessScreen extends StatefulWidget {
  final TransactionModel transaction;

  const TransactionSuccessScreen({super.key, required this.transaction});

  @override
  State<TransactionSuccessScreen> createState() =>
      _TransactionSuccessScreenState();
}

class _TransactionSuccessScreenState extends State<TransactionSuccessScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _checkScale;
  late Animation<double> _starFade;
  late Animation<double> _titleFade;
  late Animation<double> _subtitleFade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _checkScale = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOutBack),
      ),
    );

    _starFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.5, curve: Curves.easeIn),
      ),
    );

    _titleFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.7, curve: Curves.easeIn),
      ),
    );

    _subtitleFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 0.9, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildAnimatedSuccessIcon() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          width: 120,
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 243, 251, 246),
                  shape: BoxShape.circle,
                ),
              ),
              Transform.scale(
                scale: _checkScale.value,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(238, 34, 189, 127),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
              if (_starFade.value > 0) ...[
                Positioned(
                  top: 10,
                  left: 0,
                  child: Opacity(
                    opacity: _starFade.value,
                    child: buildStar(Colors.purple, 24),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 0,
                  child: Opacity(
                    opacity: _starFade.value,
                    child: buildStar(Colors.purple, 14),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 5,
                  child: Opacity(
                    opacity: _starFade.value,
                    child: buildStar(Colors.amber, 14),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  child: Opacity(
                    opacity: _starFade.value,
                    child: buildStar(Colors.purple, 14),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget buildStar(Color color, double size) {
    return Icon(Icons.star, color: color, size: size);
  }

  @override
  Widget build(BuildContext context) {
    final txn = widget.transaction;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context, widget.transaction);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              buildAnimatedSuccessIcon(),
              const SizedBox(height: 24),

              FadeTransition(
                opacity: _titleFade,
                child: Text(
                  '${txn.label} Successful!',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              FadeTransition(
                opacity: _subtitleFade,
                child: Text(
                  '${txn.desc} - ${txn.amount}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF888888),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 32),
              buildTransactionDetails({
                'Date': txn.date,
                'Status': 'Success',
                'Transaction ID': txn.transactionId,
                'Phone Number': txn.phone ?? '—',
                'Note': txn.note ?? txn.desc,
              }, txn.amount),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
