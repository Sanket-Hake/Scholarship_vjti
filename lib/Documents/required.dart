import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:scholarship_vjti/widgets/theme.dart';

import '../widgets/myAppBar.dart';

class document extends StatelessWidget {
  List<String> requiredDocs = <String>[
    'Cap allotment letter',
    'College fee receipt',
    'Marksheet of SSC(10th std)',
    'Marksheet of HSC(12th std)',
    'Previous Year Marksheet',
    'All semester Marksheets',
    'Caste Certificate',
    'Income Certificate of current financial   year(from Tehsildar)',
    'Bank Passbook',
    'Self Declaration',
    'Domicile Certificate',
    'Rashan Card',
    'Hostel Certificate(if Required)',
    'Gap Certificate(if Required)',
    'Handicap Certificate(if Required)',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            appBar: MyAppBar(title: "Required Documents"),
            body: StreamBuilder(
              builder: (context, snapshot) {
                return FadeInDown(
                    delay: Duration(milliseconds: 800),
                    child: ListView.builder(
                        itemCount: requiredDocs.length,
                        itemBuilder: (BuildContext context, int index) {
                          // print(Value[index]["category"]) ;

                          return Stack(
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 16, right: 16, top: 16),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      )),
                                  child: Text(
                                    requiredDocs[index],
                                    maxLines: 2,
                                    softWrap: true,
                                    style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }));
              },
            )),
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
