import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:scholarship_vjti/widgets/myAppBar.dart';
import 'package:scholarship_vjti/widgets/textField.dart';
import '../widgets/myButton.dart';
import '../widgets/myDropDown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  final List<String> schemeName = [
    "Rajarshi Chatrapati Shahu Maharaj Shikshan Shulka Shishyavrutti Yoja (EBC)",
    "Dr. Panjabrao Deshmukh Vastigruh Nirvah Bhatta Yojna[DTE]",
    "Scholarship for students of minority communities pursuing Higher and Professional courses[DTE]",
    "Government of India Post-Metric Scholarship",
    "Post-Matric Tuition Fees and Examination Fees (Freeship)",
    "Post-Matric Scholarship Scheme (Government of India)",
    "(Vocational Education Fee Reimbursement)",
    "Post Matric Scholarship to OBC Students",
    "Post Matric Scholarship to SBC Students",
    "Post Matric Scholarship to VJNT Students",
    "Tuition Fee & Examination Fees to OBC Students",
    "Tuition Fee & Examination Fees to SBC Students",
    "Tuition Fee & Examination Fees to VJNT Students",
    "Post Matric Scholarship for person with disability",
    "Assistance to Meritorious Students scholarhip - Senior Level",
  ];

  final List<String> caste = [
    "Open",
    "SEBC",
    "EWS",
    "Minority(Muslim, Sikh, Christian, Buddhist, Parsi, Jain and Jew)",
    "SC",
    "ST",
    "OBC",
    "SBC",
    "VJNT",
    "Only Physically Handicapped",
    "AMS Students",
  ];

  final List<String> fyear = [
    "2018-19",
    "2019-20",
    "2022",
  ];
  @override
  TextEditingController name = TextEditingController();
  TextEditingController income = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController registration = TextEditingController();
  TextEditingController scholarship = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController drop = TextEditingController(); //department
  TextEditingController drop1 = TextEditingController(); //branch
  TextEditingController drop2 = TextEditingController(); // caste
  TextEditingController drop3 = TextEditingController(); //schemeName
  TextEditingController drop4 = TextEditingController(); //fyear

  late Map<String, dynamic> studtoadd;
  final _formKey = GlobalKey<FormState>();
  CollectionReference ref = FirebaseFirestore.instance.collection('Users');
  addStudent() {
    studtoadd = {
      'Name': name.text,
      'Email': email.text,
      'Mobile_No': phone.text,
      'Department': drop.text,
      'Branch': drop1.text,
      'Income': income.text,
      'Registration': registration.text,
      'Scholarship ID': scholarship.text,
      'Caste': drop2.text,
      'Scheme Name': drop3.text,
      'Financial year': drop4.text,
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
                        SizedBox(
                          height: 20,
                        ),
                        myTextField(
                          controller: name,
                          hintTxt: "Enter Name as per Adhar Card",
                          labelTxt: "Name",
                          myIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 97, 49, 218),
                          ),
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Name as per Adhar Card';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        myTextField(
                          controller: phone,
                          hintTxt: "Enter Phone No. linked with Maha DBT",
                          labelTxt: "Phone no.",
                          myIcon: Icon(
                            Icons.phone,
                            color: Color.fromARGB(255, 97, 49, 218),
                          ),
                          textInputType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter phone No. linked with Maha DBT';
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
                          hintTxt: "Enter Registration ID",
                          labelTxt: "Registartion ID",
                          myIcon: Icon(
                            Icons.numbers,
                            color: Color.fromARGB(255, 97, 49, 218),
                          ),
                          textInputType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Registration ID';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        myTextField(
                          controller: scholarship,
                          hintTxt: "Enter Scholarship ID",
                          labelTxt: "Scholarship ID",
                          myIcon: Icon(
                            Icons.numbers,
                            color: Color.fromARGB(255, 97, 49, 218),
                          ),
                          textInputType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Scholarship ID';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        myTextField(
                          controller: email,
                          hintTxt: "Enter Email id",
                          labelTxt: "Email id",
                          myIcon: Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 97, 49, 218),
                          ),
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Email id';
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
                          myIcon: Icon(
                            Icons.money,
                            color: Color.fromARGB(255, 97, 49, 218),
                          ),
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
                                controller: drop2,
                                items: caste,
                                title: 'Caste',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              myDropDown(
                                controller: drop1,
                                items: branch,
                                title: 'Branch',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              myDropDown(
                                controller: drop3,
                                items: schemeName,
                                title: 'Scheme Name',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              myDropDown(
                                controller: drop4,
                                items: fyear,
                                title: 'Financial year',
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
