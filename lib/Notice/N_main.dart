import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholarship_vjti/widgets/myAppBar.dart';
import 'package:scholarship_vjti/widgets/theme.dart';

class NMain extends StatefulWidget {
  const NMain({Key? key}) : super(key: key);

  @override
  _NMainState createState() => _NMainState();
}

class _NMainState extends State<NMain> {
  @override
  FirebaseFirestore db = FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    return Scaffold(appBar: MyAppBar(title: "Notice Board"), body: sanika());
  }

  Widget sanika() {
    return StreamBuilder(
      stream: db.collection("Notification").snapshots(),
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
                    return Stack(
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 16, right: 16, top: 16),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 228, 220, 220),
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
                                        Container(
                                          padding: EdgeInsets.only(
                                            bottom: 5.0,
                                            right: 4.0,
                                          ),
                                          child: ListTile(
                                            tileColor: Color.fromARGB(255, 251, 247, 247),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            title:
                                                Text(Value[index]["message"] ,style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold),),
                                          ),
                                        ),
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
                  })
              : Center(
                  child: Text(
                    "Data Not found",
                    style: TextStyle(fontSize: 25, color: Colors.green),
                  ),
                ),
        );
      },
    );
  }
}
