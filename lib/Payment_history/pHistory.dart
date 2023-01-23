

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/myAppBar.dart';
import '../widgets/textField.dart';

class paymentHistory extends StatefulWidget {
  const paymentHistory({super.key});

  @override
  State<paymentHistory> createState() => _paymentHistorytate();
}

class _paymentHistorytate extends State<paymentHistory> {
  final List<String> list = [];

  TextEditingController regId = TextEditingController();
  TextEditingController sid = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool sank = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Payment History",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            hitory_payment(),
          ],
        ),
      ),
    );
  }

  Widget hitory_payment() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            color: Color.fromARGB(255, 246, 243, 243),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  myText("Name : Sanket Hake"),
                  SizedBox(
                    height: 15,
                  ),
                  myText("Registration ID : 201090038"),
                  SizedBox(
                    height: 15,
                  ),
                  myText("Caste : VJNT"),
                  SizedBox(
                    height: 15,
                  ),
                  myText(
                      "Scheme Name : Post Matric Scholarship for VJNT Student"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          myText("Account Information"),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 200,
            child: StreamBuilder(
            
                stream: db
                    .collection("Users")
                    .doc()
                    .collection("scholarship")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final Value = (snapshot.data! as QuerySnapshot).docs;
                  return ListView.builder(
                     shrinkWrap: true,
                      itemCount: Value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              Text("Sannke" , style: TextStyle(color: Colors.black , fontSize: 20 , ),),
                              Text(Value[index]["caste"]),
                              Text(Value[index]["caste"]),
                            ]),
                           
                          ],
                        );
                      });
                }),
          )
        ],
      ),
    );
  }

  Widget myText(
    String txt,
  ) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        txt,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
      ),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(
        label: Text(
          "Commodity",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      const DataColumn(
        label: SizedBox(
          width: 90,
          child: Text(
            "Arrival (Qts)",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          "Modal Price\n (Rs./Qtl)",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    ];
  }

  List<DataRow> _createRows() {
    List<DataRow> rows = [];
    for (int i = 0; i < list.length; i++) {
      rows.add(
        DataRow(
          cells: [
            DataCell(
              Text(
                list[i],
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            DataCell(
              Text(
                list[i],
              ),
            ),
            DataCell(
              Text(
                list[i],
              ),
            ),
          ],
        ),
      );
    }
    return rows;
  }

  Widget buildTable() {
    return Container(
      width: double.infinity,
      child: Expanded(
        flex: 2,
        child: DataTable(
          columns: _createColumns(),
          rows: _createRows(),
          columnSpacing: 25,
          dataRowHeight: 40,
          dataTextStyle: const TextStyle(
              fontSize: 5, color: Colors.black, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

//  body: sank == false
//             ? Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 30,
//                     ),
// myTextField(
//   controller: regId,
//   hintTxt: "Enter Registration ID",
//   labelTxt: "Registration ID",
//   myIcon: Icon(Icons.person),
//   textInputType: TextInputType.text,
//   validator: (value) {
//     if (value!.isEmpty) {
//       return 'Enter Registration ID';
//     }
//     return null;
//   },
// ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     myTextField(
//                       controller: sid,
//                       hintTxt: "Enter Scholarship ID",
//                       labelTxt: "Scholarship ID",
//                       myIcon: Icon(Icons.phone),
//                       textInputType: TextInputType.text,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Enter phone no.';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     MaterialButton(
//                       height: 50,
//                       minWidth: 175,
//                       onPressed: () {
//                         sank = true;
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Submitted Data')),
//                         );
//                         setState(() {});
//                       },
//                       color:Color.fromARGB(255, 97, 49, 218),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       child: const Text(
//                         "Search",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 18),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             : StreamBuilder(
//                 stream: db
// .collection("Users")
// .doc(regId.text)
// .collection("scholarship")
// .snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(child: CircularProgressIndicator());
//                   }
//                   final Value = (snapshot.data! as QuerySnapshot).docs;

                  // return ListView.builder(
                  //     itemCount: Value.length,
                  //     itemBuilder: (BuildContext context, int index) {
//                         var doc = snapshot.data?.docs[index].data()
//                             as Map<String, dynamic>;
//                         print(Value[index]["sid"]);
//                         if (Value[index]["sid"] == sid.text) {
//                           return SingleChildScrollView(
//                             child: Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Stack(
//                                 children: [
//                                   Center(
//                                     child: Container(

//                                       width: MediaQuery.of(context).size.width / 4,
//                                       height: 80,
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(20),
//                                         image: DecorationImage(
//                                             image: AssetImage(
//                                                 "assets/images/ancient-scroll.png"),
//                                             fit: BoxFit.contain),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Container(
//                                     padding: EdgeInsets.only(left: 10, top: 100),
//                                     child: Text(
//                                       "Account Information",
//                                       style: TextStyle(
//                                           color: Colors.black, fontSize: 25),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: EdgeInsets.only(
//                                         top:170 ,
//                                         left: 10,
//                                         right: 10),
//                                     child: SingleChildScrollView(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "SchemeName : " +
//                                                     Value[index]["SchemeName"],
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "Caste : " +
//                                                     Value[index]["caste"],
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "Total Fees : " +
//                                                     Value[index]["fees"].toString(),
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "MahaDBT Instt 1 : " +
//                                                     Value[index]["instal1"].toString(),
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "MahaDBT Instt 1 : " +
//                                                     Value[index]["iinstal2"].toString(),
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "Remark : " +
//                                                     Value[index]["remark"],
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "Total Fees : " +
//                                                     Value[index]["total"].toString(),
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "Balance : " +
//                                                     Value[index]["balance"].toString(),
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "financial year : " +
//                                                     Value[index]["fyear"],
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "Scholarship ID : " +
//                                                     Value[index]["sid"],
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                         } else {
//                           return Text("No data");
//                         }
//                       });
//                 },
//               )
