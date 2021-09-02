import 'package:flutter/material.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/constants.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/ui/home/home_page.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/ui/report/report_page.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/ui/setting/setting_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Aplikasi Catatan Keuangan',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: kPrimaryColor,
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 2;

  List<Widget> _pages = [
    HomePage(),
    ReportPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: kPrimaryColor,
        selectedFontSize: 12.0,
        elevation: 8.0,
        iconSize: 18.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.trending_up_outlined,
            ),
            label: 'Laporan',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      // bottomNavigationBar: BottomNavigationBar(items: []),
    );
  }
}

class PreviousTransactionItem2 extends StatelessWidget {
  const PreviousTransactionItem2({
    Key? key,
    required this.upperText,
    required this.bottomText,
  }) : super(key: key);
  final String upperText;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Container(
          width: 80.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4.0,
          ),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$upperText\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '$bottomText',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
        ),
        title: Row(
          children: [
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pemasukan',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        'Rp. 120.000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: kIncomeColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pengeluaran',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        'Rp. 120.000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: kOutomeColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HightlightItem extends StatelessWidget {
  const HightlightItem({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class TransactionItem2 extends StatelessWidget {
  const TransactionItem2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 0,
              spreadRadius: 0.02,
              offset: Offset(0, 2), // Shadow position
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Beli bahan-bahan masakan didapur',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: kPrimaryColor,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.money,
                      color: Colors.white,
                      size: 14.0,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      'Belanja bulanan',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Rp. 100.000',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF4CAF50),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
