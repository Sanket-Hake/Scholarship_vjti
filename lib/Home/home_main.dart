import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:marquee/marquee.dart';
import 'package:scholarship_vjti/Details/registration.dart';
import 'package:scholarship_vjti/Home/slider.dart';
import 'package:scholarship_vjti/Notice/N_main.dart';
import '../AllSchemes/tab.dart';
import '../Documents/required.dart';
import 'drawer.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 97, 49, 218),
        elevation: 30,
        title: Text("Scholarship"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: FadeInDownBig(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 20,
                  child: Marquee(
                    text: " MAHADBT registration deadline is January 31, 2023",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 20.0,
                    velocity: 100.0,
                    pauseAfterRound: Duration(seconds: 1),
                    startPadding: 10.0,
                    accelerationDuration: Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                slider(),
                SizedBox(
                  height: 20,
                ),
                Card(
                  color: Color.fromARGB(255, 246, 243, 243),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 40,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/first");
                                  },
                                  child: column("assets/images/history.png",
                                      "Registration", context)),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => main_activity(),
                                    ),
                                  );
                                },
                                child: column("assets/images/diagram.png",
                                    "All Schemes", context),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                child: column("assets/images/notice.png",
                                    "Important Notice", context),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NMain(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => document(),
                                    ),
                                  );
                                },
                                child: column("assets/images/paper.png",
                                    "Documents", context),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/paymentHistory');
                                },
                                child: column("assets/images/history_icon.png",
                                    "Payment History", context),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/MySchemes");
                                },
                                child: column("assets/images/planning.png",
                                    "Eligible Schemes", context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget column(String image, String text, BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
            width: MediaQuery.of(context).size.width / 4,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(image), fit: BoxFit.contain),
            ),
          ),
          Text(
            text,
            style: const TextStyle(
                color: Color.fromARGB(255, 76, 76, 175),
                fontWeight: FontWeight.w600,
                fontSize: 17),
          ),
        ],
      ),
    );
  }
}
