import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:scholarship_vjti/widgets/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class schemes extends StatelessWidget {
  String type;
  schemes({
    Key? key,
    required this.type,
  }) : super(key: key);
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: db.collection("mySchemes").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final Value = (snapshot.data! as QuerySnapshot).docs;
          return FadeInDown(delay: Duration(milliseconds: 800), child: ritish()
              // : Center(
              //     child: Text(
              //       "Products Not Available",
              //       style: TextStyle(fontSize: 25, color: Colors.green),
              //     ),
              //   ),
              );
        },
      ),
    );
  }

  Widget ritish() {
    return StreamBuilder(
      stream: db.collection("mySchemes").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final Value = (snapshot.data! as QuerySnapshot).docs;
        return FadeInDown(
          delay: Duration(milliseconds: 800),
          child: Value.length > 0
              ? ListView.builder(
                  itemCount: Value.length,
                  itemBuilder: (BuildContext context, int index) {
                    // print(Value[index]["category"]) ;
                    _launchURLBrowser() async {
                      var url = Uri.parse(Value[index]["link"]);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }

                    if (Value[index]["type"] == type) {
                      return Stack(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              _launchURLBrowser();
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 16, right: 16, top: 16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  )),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 6,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                text: Value[index]["name"],
                                                style: CustomTextStyle
                                                    .textFormFieldSemiBold
                                                    .copyWith(fontSize: 20),
                                                recognizer:
                                                    new TapGestureRecognizer()
                                                      ..onTap = (() {
                                                        launchUrl(Uri.parse(
                                                            Value[index]
                                                                ["link"]));
                                                      })),
                                          ),
                                          // Container(
                                          //   padding: EdgeInsets.only(
                                          //       right: 8, top: 4),
                                          //   child:
                                          // ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 100,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  })
              : Center(
                  child: Text(
                    "Products Not Available",
                    style: TextStyle(fontSize: 25, color: Colors.green),
                  ),
                ),
        );
      },
    );
  }
}
