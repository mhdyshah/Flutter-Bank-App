// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bank_app/statistics.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BankApp(),
    );
  }
}

class BankApp extends StatefulWidget {
  const BankApp({Key? key}) : super(key: key);

  @override
  State<BankApp> createState() => _BankAppState();
}

class _BankAppState extends State<BankApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _top(),
              SizedBox(
                height: 290,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  children: [
                    _card(
                      name: "مهدی شهسواری",
                      bankName: "Blu",
                      id: "6219-8619-0008-5290",
                      color: Colors.red,
                      balance: "\$600",
                      image: "assets/images/jig.png",
                    ),
                    _card(
                      name: "مهدی شهسواری",
                      bankName: "Saderat",
                      id: "6037-6975-6150-1997",
                      color: Colors.deepPurple,
                      balance: "\$1200",
                      image: "assets/images/jig.png",
                    ),
                    _card(
                      name: "مهدی شهسواری",
                      bankName: "Tegarat",
                      id: "6037-1254-3433-1448",
                      color: Colors.lightBlue,
                      balance: "\$120",
                      image: "assets/images/jig.png",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transaction:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Statistics();
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.amber,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Analysis",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              _transaction(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _transaction() {
    return Container(
      height: 400,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: [
            _itemTransactions(
              icon: Icons.flight_takeoff,
              color: Colors.blue,
              total: "\$220.00",
              desc: "Traveling",
              time: "2 Days ago",
              date: "24 feb 2022",
              onTap: () {},
            ),
            _itemTransactions(
              icon: Icons.fastfood_rounded,
              color: Colors.green,
              total: "\$84.00",
              desc: "Food",
              time: "1 Days ago",
              date: "25 feb 2022",
              onTap: () {},
            ),
            _itemTransactions(
              icon: Icons.man_outlined,
              color: Colors.amber,
              total: "\$45.00",
              desc: "Yoga",
              time: "7 Days ago",
              date: "17 feb 2022",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemTransactions({
    required VoidCallback onTap,
    required IconData icon,
    required Color color,
    required String desc,
    required String total,
    required String time,
    required String date,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(right: 18),
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                color: color,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  total,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _card({
    required String name,
    required String id,
    required Color color,
    required String balance,
    required String image,
    required String bankName,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 40,
          margin: EdgeInsets.only(top: 80, left: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            children: [
              _cardBackGround(size: 40, pTop: 90, pLeft: 250),
              _cardBackGround(size: 140, pBottom: -50),
              Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _masterCardLogo(),
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        id,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$bankName Bank",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              balance,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: Image.asset(
            image,
            width: 110,
          ),
        )
      ],
    );
  }

  Widget _masterCardLogo() {
    return SizedBox(
      width: 50,
      child: Stack(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Positioned(
            left: 20,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardBackGround({
    double size = 40,
    double? pTop,
    double? pBottom,
    double? pLeft,
    double? pRight,
  }) {
    return Positioned(
      left: pLeft,
      top: pTop,
      right: pRight,
      bottom: pBottom,
      child: Transform.rotate(
        angle: 1,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.16),
            borderRadius: BorderRadius.circular(size / 6),
          ),
        ),
      ),
    );
  }

  Widget _top() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Cards",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: "DynaPuff",
                ),
              ),
              Text(
                "27 Feb",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "😉",
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
