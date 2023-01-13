import 'package:flutter/material.dart';

import '../widgets/myAppBar.dart';
class document extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            appBar: MyAppBar(title: "Required Documents"),
          body: Container(
            padding: EdgeInsets.only(left: 8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Texttitle(title: 'Cap allotment letter'),
                SizedBox(
                  height: 10.0,
                ),
                Texttitle(title: 'College fee receipt'),
                SizedBox(
                  height: 10.0,
                ),
                Texttitle(title: 'Marksheet of SSC(10th std)'),
                SizedBox(
                  height: 10.0,
                ),
                Texttitle(title: 'Marksheet of HSC(12th std)'),
                SizedBox(
                  height: 10.0,
                ),
                Texttitle(title: 'Previous Year Marksheet'),
                SizedBox(
                  height: 10.0,
                ),
                Texttitle(title: 'All semester Marksheets'),
                SizedBox(
                  height: 10.0,
                ),
                Texttitle(title: 'Caste Certificate'),
                SizedBox(
                  height: 10.0,
                ),
                Texttitle(
                    title:
                        'Income Certificate of current financial year(from Tehsildar)'),
                SizedBox(
                  height: 10.0,
                ),
                Texttitle(title: 'Bank Passbook'),
                SizedBox(
                  height: 10.0,
                ),
                Texttitle(title: 'Self Declaration'),
                SizedBox(
                  height: 10.0,
                ),
                Texttitle(title: 'Domicile Certificate'),
                SizedBox(
                  height: 10.0,
                ),
                Texttitle(title: 'Rashan Card'),
                SizedBox(
                  height: 10.0,
                ),
                Texttitle(title: 'Hostel Certificate(if Required)'),
                SizedBox(
                  height: 10.0,
                ),
                Texttitle(title: 'Gap Certificate(if Required)'),
                SizedBox(
                  height: 10.0,
                ),
                Texttitle(title: 'Handicap Certificate(if Required)'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Texttitle extends StatelessWidget {
  Texttitle({required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20.0,
      ),
    );
  }
}