import 'package:finance_app/data/transaction_data.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key, required this.onBackToMenu});
  final VoidCallback onBackToMenu;
  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  bool showIncome = true;

  @override
  Widget build(BuildContext context) {
    double totalIncome = incomeData.fold(0, (sum, item) => sum + item.amount);

    final Map<String, double> dataMap = {
      for (var item in incomeData) item.label: item.amount,
    };

    final List<Color> colorList = [for (var item in incomeData) item.color];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: widget.onBackToMenu,
        ),
        title: const Text('Statistic'),
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: DropdownButton<String>(
              value: 'May 2024',
              underline: const SizedBox(),
              icon: const Icon(Icons.keyboard_arrow_down),
              items: const [
                DropdownMenuItem(value: 'May 2024', child: Text('May 2024')),
                DropdownMenuItem(
                  value: 'April 2024',
                  child: Text('April 2024'),
                ),
              ],
              onChanged: (_) {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 1,
                color: Colors.grey.shade300,
                margin: const EdgeInsets.only(top: 50),
              ),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              showIncome = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'Income',
                                style: TextStyle(
                                  fontWeight:
                                      showIncome
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                  color:
                                      showIncome
                                          ? Colors.black
                                          : const Color.fromARGB(
                                            255,
                                            22,
                                            22,
                                            22,
                                          ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              showIncome = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'Outcome',
                                style: TextStyle(
                                  fontWeight:
                                      !showIncome
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                  color:
                                      !showIncome ? Colors.black : Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ), // To make room for indicator
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  AnimatedAlign(
                    alignment:
                        showIncome
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                    duration: const Duration(milliseconds: 350),
                    child: Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width / 2,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 30),

          Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                dataMap: dataMap,
                colorList: colorList,
                chartType: ChartType.ring,
                chartRadius: 170,
                ringStrokeWidth: 20,
                baseChartColor: Colors.white,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValues: false,
                ),
                legendOptions: const LegendOptions(showLegends: false),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'TOTAL INCOME',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    '\$${totalIncome.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,

              child: Text(
                'Income Breakdown',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: incomeData.length,
                  itemBuilder: (context, index) {
                    final item = incomeData[index];

                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 24,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      item.label,
                                      style: const TextStyle(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '\$${item.amount.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: item.color,
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        child: Text(
                                          '${(item.percent * 100).round()}%',
                                          style: TextStyle(
                                            color:
                                                ThemeData.estimateBrightnessForColor(
                                                          item.color,
                                                        ) ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
