import 'package:finance_app/screens/transaction_success_screen.dart';
import 'package:finance_app/widgets/action_icon.dart';
import 'package:finance_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/transaction_data.dart';
import 'package:badges/badges.dart' as badges;

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 15, 7, 31),
                    Color.fromARGB(255, 34, 18, 137),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/user.jpeg',
                            ),
                            radius: 24,
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello Hilya!',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Welcome back',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      badges.Badge(
                        position: badges.BadgePosition.topEnd(top: -3, end: 0),
                        badgeContent: const Text(
                          '',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        badgeStyle: const badges.BadgeStyle(
                          badgeColor: Colors.red,
                        ),
                        child: const Icon(
                          Icons.notification_add_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(12),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('YOUR BALANCE'),
                      SizedBox(height: 10),
                      Row(
                        children: const [
                          Text(
                            '\$41,379,000',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.remove_red_eye_outlined,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          ActionIcon(
                            icon: Icons.arrow_upward,
                            label: 'Transfer',
                          ),
                          ActionIcon(
                            icon: Icons.arrow_downward,
                            label: 'Withdraw',
                          ),
                          ActionIcon(
                            icon: Icons.attach_money_rounded,
                            label: 'Invest',
                          ),
                          ActionIcon(
                            icon: Icons.account_balance_wallet,
                            label: 'Top up',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(230, 242, 235, 248),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/icon.png'),
                        radius: 24,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          "Let's check your Financial Insight for the month of June!",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(width: 50),
                      Icon(Icons.arrow_forward_ios, size: 14),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Recent Transactions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 10),
                ...transactions.asMap().entries.map((entry) {
                  final index = entry.key;
                  final txn = entry.value;

                  if (index == 3) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => const TransactionSuccessScreen(),
                          ),
                        );
                      },
                      child: TransactionItem(model: txn),
                    );
                  }
                  return TransactionItem(model: txn);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
