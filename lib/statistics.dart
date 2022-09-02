// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 30),
            _menu(),
            SizedBox(height: 30),
            _total(),
            SizedBox(height: 30),
            _chart(),
            SizedBox(height: 30),
            _statistics(),
          ],
        ),
      ),
    );
  }

  Widget _statistics() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Statistics",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.tune,
                  color: Colors.white70,
                  size: 32,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.orange,
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(24),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black12,
                  ),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black12,
                    ),
                    child: Center(
                      child: Text(
                        "55%",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Average Speed",
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "\$4,100",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.file_open,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Report",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chart() {
    return SizedBox(
      height: 240,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(enabled: false),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget: _bottomTitlesWidgets,
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              curveSmoothness: 0.4,
              color: Colors.lime,
              barWidth: 6,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: true),
              spots: [
                FlSpot(1, 3),
                FlSpot(2, 1),
                FlSpot(3, 5),
                FlSpot(4, 2),
                FlSpot(5, 5),
                FlSpot(6, 6),
                FlSpot(7, 9),
              ],
            ),
          ],
          minX: 0,
          maxX: 8,
          minY: 0,
          maxY: 10,
        ),
      ),
    );
  }

  Widget _bottomTitlesWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.white, fontSize: 15);
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text("Mon", style: style);
        break;
      case 2:
        text = Text("Thu", style: style);
        break;
      case 3:
        text = Text("Wed", style: style);
        break;
      case 4:
        text = Text("Thr", style: style);
        break;
      case 5:
        text = Text("Fri", style: style);
        break;
      case 6:
        text = Text("Sat", style: style);
        break;
      default:
        text = Text("");
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  Widget _total() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Total Income",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              Text(
                "\$2,500",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
            child: VerticalDivider(
              color: Colors.white,
            ),
          ),
          Column(
            children: [
              Text(
                "Expenses",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              Text(
                "\$1,450",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menu() {
    return CarouselSlider(
      items: [
        _itemMenu(
          index: 0,
          color: Colors.blue.shade300,
          icon: Icons.flight_takeoff,
        ),
        _itemMenu(
          index: 1,
          color: Colors.green.shade300,
          icon: Icons.fastfood,
        ),
        _itemMenu(
          index: 2,
          color: Colors.amber.shade300,
          icon: Icons.man_outlined,
        ),
      ],
      options: CarouselOptions(
        autoPlay: false,
        height: 100,
        enlargeCenterPage: true,
        viewportFraction: 0.3,
        initialPage: _currentIndex,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _itemMenu({
    required int index,
    required Color color,
    required IconData icon,
  }) {
    Color bgColor = index == _currentIndex ? color : Colors.white70;
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white70,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: bgColor,
        ),
        child: Icon(
          icon,
          color: bgColor == color ? Colors.white : color,
          size: 30,
        ),
      ),
    );
  }
}
