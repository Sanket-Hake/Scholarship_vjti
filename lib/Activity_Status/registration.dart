import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:scholarship_vjti/widgets/myAppBar.dart';
import 'package:scholarship_vjti/widgets/textField.dart';
import '../widgets/myButton.dart';
import '../widgets/myDropDown.dart';

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

  final _formKey = GlobalKey<FormState>();

  // final CollectionReference collectionReference =
  //     FirebaseFirestore.instance.collection("Users");

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title: "Registration"),
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
                            } else if (int.parse(value) > 100 ||
                                int.parse(value) < 9) {
                              return 'Enter valid registration ID';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        myTextField(
                          controller: Email,
                          hintTxt: "Enter your email ID",
                          labelTxt: "Email ID",
                          myIcon: Icon(Icons.email),
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your emaail ID';
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
                        myTextField(
                          controller: cast,
                          hintTxt: "Enter your Cast",
                          labelTxt: "Cast",
                          myIcon: Icon(Icons.cast),
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your cast';
                            }
                          },
                        ),
                         SizedBox(
                        height: 30,
                      ),
                        myButton(
                            height: 50,
                            path: "/Second_Screen",
                            radius: 20,
                            text: "Submit",
                            width: 174,
                            backColor: Color.fromARGB(255, 80, 108, 202),
                            textColor: Colors.white),
                        // ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                        //     primary: Color.fromARGB(255, 108, 159, 200),
                        //     onPrimary: Colors.white,
                        //   ),
                        //   onPressed: () async {
                        //     // if (_formKey.currentState!.validate()) {
                        //     //   ScaffoldMessenger.of(context).showSnackBar(
                        //     //     const SnackBar(
                        //     //         content: Text('Processing Data')),
                        //     //   );
                        //     //   collectionReference.doc().set({
                        //     //     'Name': name.text,
                        //     //     'Mobile No': phone.text,
                        //     //     'Age': int.parse(age.text),
                        //     //     "Photo": profile_photo.text,
                        //     //     'Department': drop.text
                        //     //   });
                        //     // } else {
                        //     //   ScaffoldMessenger.of(context).showSnackBar(
                        //     //     const SnackBar(
                        //     //         content: Text('Add all required field')),
                        //     //   );
                        //     // }

                        //     // ScaffoldMessenger.of(context).showSnackBar(
                        //     //   const SnackBar(content: Text('Submitted Data')),
                        //     // );
                        //   },
                        //   child: Text(
                        //     'Submit',
                        //     style: TextStyle(fontSize: 15),
                        //   ),
                        // ),
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
