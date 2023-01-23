import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:scholarship_vjti/widgets/myAppBar.dart';
import 'package:scholarship_vjti/widgets/textField.dart';
import '../widgets/myButton.dart';
import '../widgets/myDropDown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'History/H_main.dart';

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firststate();
}

class _firststate extends State<first> {
  final List<String> department = [
    "Master",
    "M.Tech",
    "Degree",
    "Diploma",
  ];

  final List<String> branch = [
    "B.Tech. Civil",
    "B.Tech. Computer",
    "B.Tech. Electrical",
    "B.Tech. Electronics",
    "B.Tech. EXTC",
    "B.Tech. I.T.",
    "B.Tech. Mechanical",
    "B.Tech. Producation",
    "B.Tech. Textile",
    "Diploma in Chemical",
    "Diploma in Civil",
    "Diploma in Electrical",
    "Master I Computer Application ",
    "Master in Machine Design ",
    "Master in Software Engineering",
  ];

  @override
  TextEditingController name = TextEditingController();
  TextEditingController income = TextEditingController();
  TextEditingController cast = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController registration = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController drop = TextEditingController();
  TextEditingController drop1 = TextEditingController();
  late Map<String, dynamic> studtoadd;
  final _formKey = GlobalKey<FormState>();
  CollectionReference ref = FirebaseFirestore.instance.collection('Users');
  addStudent() {
    studtoadd = {
      'Name': name.text,
      'Email': Email.text,
      'Mobile_No': phone.text,
      'Department': drop.text,
      'Branch': drop1.text,
      'Income': income.text,
      'Registration': registration.text,
    };

    ref
        .doc(registration.text)
        .set(studtoadd)
        .whenComplete(() => print("added"));
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          title: "Registration",
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FadeInDownBig(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        // ClipRect(
                        //   child: Container(
                        //     width: 140,
                        //     height: 140,
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       color: Colors.white,
                        //       image: DecorationImage(
                        //           image: NetworkImage(
                        //               "https://imgv3.fotor.com/images/blog-cover-image/10-profile-picture-ideas-to-make-you-stand-out.jpg"),
                        //           fit: BoxFit.cover),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        myTextField(
                          controller: name,
                          hintTxt: "Enter Name",
                          labelTxt: "Name",
                          myIcon: Icon(Icons.person),
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        myTextField(
                          controller: phone,
                          hintTxt: "Enter Phone",
                          labelTxt: "Phone no.",
                          myIcon: Icon(Icons.phone),
                          textInputType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter phone no.';
                            } else if (value.length != 10) {
                              return 'Enter 10 digit phone no.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        myTextField(
                          controller: registration,
                          hintTxt: "Enter registration ID",
                          labelTxt: "Registartion ID",
                          myIcon: Icon(Icons.numbers),
                          textInputType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter registration ID';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        myTextField(
                          controller: income,
                          hintTxt: "Enter your Income ",
                          labelTxt: "Income",
                          myIcon: Icon(Icons.money),
                          textInputType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your Income';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              myDropDown(
                                controller: drop,
                                items: department,
                                title: 'Department',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              myDropDown(
                                controller: drop1,
                                items: branch,
                                title: 'Branch',
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        MaterialButton(
                          height: 50,
                          minWidth: double.infinity,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            } else {
                              print("Not");
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Not Submitted Data')),
                              );
                              
                           
                            }
                            addStudent();
                             ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Submitted Data')),
                            );

                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => H_main()),
                            );
                           

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => H_main()),
                            // );
                          },
                          color: Color.fromARGB(255, 97, 49, 218),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Color.fromARGB(255, 97, 49, 218),
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
