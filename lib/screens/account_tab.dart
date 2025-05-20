import 'package:finance_app/widgets/build_setting_tile.dart';
import 'package:flutter/material.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey[200],
                            backgroundImage: AssetImage(
                              'assets/images/user.jpeg',
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Tanjiro Hilya',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'tanjirooow@mail.com',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withAlpha(12),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 16.0,
                          top: 16.0,
                          bottom: 8.0,
                        ),
                        child: Text(
                          'Financial Overview',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      buildSettingTile(
                        icon: Icons.account_balance_outlined,
                        iconColor: Colors.blue,
                        title: 'Linked Accounts',
                        onTap: () {},
                      ),
                      const Divider(height: 1, indent: 56),
                      buildSettingTile(
                        icon: Icons.savings_outlined,
                        iconColor: Colors.blue,
                        title: 'Active Savings Goals',
                        onTap: () {},
                      ),
                      const Divider(height: 1, indent: 56),
                      buildSettingTile(
                        icon: Icons.currency_exchange,
                        iconColor: Colors.blue,
                        title: 'Cashback Summary',
                        onTap: () {},
                        showDivider: false,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Security Settings Section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withAlpha(12),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 16.0,
                          top: 16.0,
                          bottom: 8.0,
                        ),
                        child: Text(
                          'Security Settings',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      buildSettingTile(
                        icon: Icons.lock_outline,
                        iconColor: Colors.blue,
                        title: 'Change Password',
                        onTap: () {},
                      ),
                      const Divider(height: 1, indent: 56),
                      buildSettingTile(
                        icon: Icons.security,
                        iconColor: Colors.blue,
                        title: 'Two-Factor Authentication',
                        onTap: () {},
                      ),
                      const Divider(height: 1, indent: 56),
                      buildSettingTile(
                        icon: Icons.fingerprint,
                        iconColor: Colors.blue,
                        title: 'Fingerprint/Face ID',
                        onTap: () {},
                        showDivider: false,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
