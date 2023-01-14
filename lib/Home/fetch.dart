

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/myAppBar.dart';
import '../widgets/textField.dart';

class fetch extends StatefulWidget {
  const fetch({super.key});

  @override
  State<fetch> createState() => _fetchstate();
}

class _fetchstate extends State<fetch> {
  TextEditingController regId = TextEditingController();
  TextEditingController sid = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;
  bool sank = false;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title: "MyData",),
        body: sank == false
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    myTextField(
                      controller: regId,
                      hintTxt: "Enter Registration ID",
                      labelTxt: "Registration ID",
                      myIcon: Icon(Icons.person),
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Registration ID';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    myTextField(
                      controller: sid,
                      hintTxt: "Enter Scholarship ID",
                      labelTxt: "Scholarship ID",
                      myIcon: Icon(Icons.phone),
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter phone no.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      height: 50,
                      minWidth: 175,
                      onPressed: () {
                        sank = true;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Submitted Data')),
                        );
                        setState(() {});
                      },
                      color:Color.fromARGB(255, 97, 49, 218),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "Search",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )
            : StreamBuilder(
                stream: db
                    .collection("Users")
                    .doc(regId.text)
                    .collection("scholarship")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final Value = (snapshot.data! as QuerySnapshot).docs;

                  return ListView.builder(
                      itemCount: Value.length,
                      itemBuilder: (BuildContext context, int index) {
                        var doc = snapshot.data?.docs[index].data()
                            as Map<String, dynamic>;
                        print(Value[index]["sid"]);
                        if (Value[index]["sid"] == sid.text) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                     
                                      width: MediaQuery.of(context).size.width / 4,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/ancient-scroll.png"),
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 10, top: 100),
                                    child: Text(
                                      "Account Information",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 25),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top:170 , 
                                        left: 10,
                                        right: 10),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "SchemeName : " +
                                                    Value[index]["SchemeName"],
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "Caste : " +
                                                    Value[index]["caste"],
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "Total Fees : " +
                                                    Value[index]["fees"].toString(),
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "MahaDBT Instt 1 : " +
                                                    Value[index]["instal1"].toString(),
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "MahaDBT Instt 1 : " +
                                                    Value[index]["iinstal2"].toString(),
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "Remark : " +
                                                    Value[index]["remark"],
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "Total Fees : " +
                                                    Value[index]["total"].toString(),
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "Balance : " +
                                                    Value[index]["balance"].toString(),
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "financial year : " +
                                                    Value[index]["fyear"],
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "Scholarship ID : " +
                                                    Value[index]["sid"],
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Text("No data");
                        }
                      });
                },
              ));
  }
  
}

