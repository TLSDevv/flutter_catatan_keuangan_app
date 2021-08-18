import 'package:flutter/material.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Aplikasi Catatan Keuangan',
      theme: ThemeData(primaryColor: kPrimaryColor),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('KeuanganKu'),
      //   elevation: 0,
      // ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      35.0,
                    ),
                    bottomRight: Radius.circular(
                      35.0,
                    ),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      kPrimaryColor,
                      kDarkPrimaryColor,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 16.0),
                  child: Text(
                    'KeuanganKu',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 22,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(height: 150),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text('Hari ini, 18 Oktober 2021'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(children: [
                                Text('pemasukan'),
                                Text('Rp. 120.000')
                              ]),
                              Column(
                                children: [
                                  Text('pengeluaran'),
                                  Text('Rp. 50.000')
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text('Selisih'),
                              Text('Rp. 70.000'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Beli bahan-bahan masakan didapur'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Belanja bulanan'),
                              Text('Rp. 100.000'),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('fab');
        },
        child: Icon(Icons.add),
      ),
      // bottomNavigationBar: BottomNavigationBar(items: []),
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
